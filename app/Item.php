<?php

/**
 * Created by Claudio Campos.
 * User: callcocam@gmail.com
 * https://www.sigasmart.com.br
 */

namespace App;

use App\Suports\Call\Resources\Fields\Facades\COVER;
use App\Suports\Call\Resources\Fields\Facades\ID;
use App\Suports\Call\Resources\Fields\Facades\TEXT;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Gate;

class Item extends Model
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
        'order_id', 'fabric_id', 'aviament_id', 'assets', 'amount', 'status', 'description'
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

        $this->alias = 'item';

        $this->defaultOptions['title'] = "Lista de ordems de serviço";
        $this->defaultOptions['endpoint'] = "orders";
        $this->headers = [
            ID::make('id')->hiddenList()->hiddenShow()->render(),
            COVER::make('cover')->label("Foto")->width('5%')->render(),
            TEXT::make('sotock')->label("Descrição")->render(),
            TEXT::make('items_stokes')->label("Quantidade")->render(),
            TEXT::make('delete')->label("#")->render(),
        ];
    }


    public function user()
    {
        return $this->belongsTo(User::class, 'responsible_id');
    }

    public function actions()
    {
        if (empty($this->endpoint)) {
            $this->endpoint = $this->getTable();
        }
        $this->getHeader('action')->getCell()->addDecorator('callable', [
            'closure' => function ($context, $record) {
                $actions = [];

                if (Gate::allows('admin.order-delete-item.store')) {
                    $actions['submit'] = [];
                }

                if (Gate::allows('admin.order-delete-item.destroy')) {
                    $actions['reload'] = [
                        'name' => route('admin.order-delete-item.destroy', array_merge([
                            'id' => $record['id'],
                            'fabrics_parent' => 'sdfsfds'
                        ], request()->all())),
                        'id' => $record['id'],
                        'icon' => 'trash',
                        'class' => 'danger btn-rounded delete',
                    ];
                }
                return $actions;
            },
        ]);
    }
    public function init()
    {

        $this->getHeader('sotock')->getCell()->addDecorator('callable', [
            'closure' => function ($context, $record) {

                if (!is_null($record['fabric_id'])) {
                    $route = route('admin.fabrics.edit', array_merge(['tecido' => $record['fabric_id']], request()->all()));
                    $fabric = Fabric::find($record['fabric_id']);
                    $name = sprintf("Tecido: %s",$fabric->name);
                    return view('vendor.table.link', compact('name', 'route'));
                } elseif (!is_null($record['aviament_id'])) {
                    $route = route('admin.aviaments.edit', array_merge(['aviamento' => $record['aviament_id']], request()->all()));
                    $aviament = Aviament::find($record['aviament_id']);
                    $name = sprintf("Aviamento: %s",$aviament->name);
                    return view('vendor.table.link', compact('name', 'route'));
                }
            },
        ]);

        $this->getHeader('status')->getCell()->addDecorator('callable', [
            'closure' => function ($context, $record) {

                return view('vendor.table.status', compact('context','record'));
            },
        ]);

        $this->getHeader('items_stokes')->getCell()->addDecorator('callable', [
            'closure' => function ($context, $record) {
                 $data = $record->stoke($record)->first();
                return view('vendor.table.amount', compact('context','record','data'));
            },
        ]);
    }

    public function initFilter($query)
    {
        $query->where($this->getParams()->params);
        // TODO: Implement initFilter() method.
    }

    public function aviament()
    {

        return $this->belongsTo(Aviament::class);
    }

    public function fabric()
    {

        return $this->belongsTo(Fabric::class);
    }


    public function stoke($record){

        if (!is_null($record['fabric_id'])) {
            return $record->fabric();
        } elseif (!is_null($record['aviament_id'])) {
            return $record->aviament();
        }
    }
}
