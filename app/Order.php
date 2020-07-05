<?php

/**
 * Created by Claudio Campos.
 * User: callcocam@gmail.com
 * https://www.sigasmart.com.br
 */

namespace App;

use App\Suports\Call\Resources\Fields\Facades\ID;
use App\Suports\Call\Resources\Fields\Facades\TEXT;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class Order extends Model
{
    use TraitModel, TraitTable;

    public $incrementing = false;

    protected $keyType = "string";

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'codigo', 'responsible_id',  'fabric_id', 'product_id', 'date', 'differentiated', 'line_color', 'washed', 'status', 'description', 'observation'
    ];

    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = [
        'date',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'date' => 'datetime:d/m/Y',
    ];

    public function getDateAttribute($value)
    {
        return date_carbom_format($value)->format('d/m/Y');
    }

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

        $this->alias = 'ordem_servico';

        $this->defaultOptions['title'] = "Lista de ordems de serviço";
        $this->defaultOptions['endpoint'] = "orders";
        $this->headers = [
            ID::make('id')->hiddenList()->hiddenShow()->render(),
            TEXT::make('codigo')->label("Código")->sortable()->render(),
            TEXT::make('product')->label("Produto")->alias('product_id')->sortable()->render(),
            TEXT::make('user')->label("Responsavel")->alias('responsible_id')->sortable()->render(),
            TEXT::make('stage')->label("Etapa")->render(),
            TEXT::make('date')->label("Data")->sortable()->render()
        ];
    }


    public function user()
    {
        return $this->belongsTo(User::class, 'responsible_id');
    }

    public function items($where = [])
    {
        return $this->hasMany(Item::class)->where($where);
    }

    public function grids()
    {
        return $this->hasMany(GridOrderItem::class);
    }

    public function init()
    {
        $this->getHeader('codigo')->getCell()->addDecorator('callable', [
            'closure' => function ($context, $record) {
                return str_pad($context, 5, '0', STR_PAD_LEFT);
            },
        ]);

        $this->getHeader('stage')->getCell()->addDecorator('callable', [
            'closure' => function ($context, $record) {
                $stage = $record->input()->first();
                if($stage)
                    return $stage->provider->name;

                return "Não iniciada";
            },
        ]);

        $this->getHeader('product')->getCell()->addDecorator('callable', [
            'closure' => function ($context, $record) {
                if ($context)
                    return  $context->name;

                return '---';
            },
        ]);
        $this->getHeader('user')->getCell()->addDecorator('callable', [
            'closure' => function ($context, $record) {
                if($context)
                    return $context->name;

                return '---';
            },
        ]);

        $this->getHeader('date')->getCell()->addDecorator('callable', [
            'closure' => function ($context, $record) {
                if ($context)
                    return date_carbom_format($context)->toLongDateString();
            },
        ]);

        $this->getHeader('status')->getCell()->addDecorator('callable', [
            'closure' => function ($context, $record) {
                return view('vendor.table.status', compact('context'));
            },
        ]);
    }

    public function initFilter($query)
    {
        if(Auth::user()->hasAnyRole('funcionarios')){
            $query->where('responsible_id', Auth::id());
        }

    }

    public function grid()
    {

        return $this->belongsTo(Grid::class);
    }

    public function fabric()
    {
        return $this->belongsTo(Fabric::class);
    }
    public function aviament()
    {
        return $this->belongsTo(Aviament::class);
    }

    public function price($type=true)
    {
        $piece = 0;
        if($type):
            $items = $this->hasMany(Item::class)->whereNotNull('fabric_id')->get();
        else:
            $items = $this->hasMany(Item::class)->whereNotNull('aviament_id')->get();
        endif;
        if ($items) {

            foreach ($items as $value) {
                if($type):
                    $amount = Calcular($value->amount, form_read($value->fabric->price), '+');
                else:
                    $amount = Calcular($value->amount, form_read($value->aviament->price), '+');
                endif;


                $piece = Calcular($piece, $amount, '+');
            }
        }
        return $piece;
    }


    public function provider()
    {

        return $this->belongsTo(Provider::class);
    }

    public function product()
    {

        return $this->belongsTo(Product::class);
    }


    public function input()
    {
        return $this->hasMany(InputProcessStep::class)->orderBy('created_at', 'DESC');
    }


    public function input_piece_value($rows)
    {
         $InputProcessStep = InputProcessStep::query()->select(DB::raw('SUM(piece_value) as total'))->where([
            "order_id" =>$rows->id
        ])->first();
        if($InputProcessStep)
          return form_read($InputProcessStep->total);

        return "0,0";
    }
    public function input_total($rows)
    {
        $Input = $this->input()->first();
        if($Input){
            $number_of_pieces = Calcular($Input->number_of_pieces,$Input->number_of_damaged_pieces, '-');
            $InputProcessStep = $this->input_piece_value($rows);
            if((int)$InputProcessStep)
                return Calcular($InputProcessStep,$number_of_pieces, "*");
        }


        return "0,0";
    }

    public function inputStage($ordem_servico)
    {
        $params = InputProcessStep::query()->select('stage_id')->where([
            "order_id" => $ordem_servico
        ])->get();

        return Stage::query()->whereNotIn('id', $params->toArray())->count();
    }


    public function inputOpen()
    {

        if ($this->hasMany(InputProcessStep::class)->whereIn('status', [
            'draft',
            'pause',
            'feedstock'
        ])->count()) {
            return false;
        }


        return true;
    }

    public function output()
    {
        return $this->belongsTo(OutputProcessStep::class);
    }

}
