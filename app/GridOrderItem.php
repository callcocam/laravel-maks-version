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
use Illuminate\Support\Facades\Gate;

class GridOrderItem extends Model
{
    use TraitModel, TraitTable;
    //grid_order_items
    public $incrementing = false;

    protected $keyType = "string";

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'order_id', 'grid_id', 'number_id', 'amount', 'status', 'description'
    ];
    protected $casts = [
        'amount' => 'integer',
    ];
    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

        $this->alias = 'item';

        $this->defaultOptions['title'] = "Lista de ordems de serviço";
        $this->defaultOptions['endpoint'] = "orders";
        $this->headers = [
            ID::make('id')->hiddenList()->hiddenShow()->render(),
            TEXT::make('grid_id')->label("Descrição")->render(),
            TEXT::make('number_id')->label("Número")->render(),
            TEXT::make('amount')->label("Quantidade")->render(),
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

              //  if (Gate::allows('admin.order.store')) {
                    $actions['submit'] = [];
              //  }

                if (Gate::allows('admin.order-delete-item-grid.destroy')) {
                    $actions['reload'] = [
                        'name' => route('admin.order-delete-item-grid.destroy', array_merge([
                            'id' => $record['id']], request()->all())),
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

        $this->getHeader('grid_id')->getCell()->addDecorator('callable', [
            'closure' => function ($context, $record) {
                $route = route('admin.grids.edit', array_merge(['grade' => $context], request()->all()));
                $grid = $record->grid;
                $name = sprintf("Grade: %s",$grid->name);
                return view('vendor.table.link', compact('name', 'route'));
            },
        ]);

        $this->getHeader('number_id')->getCell()->addDecorator('callable', [
            'closure' => function ($context, $record) {
                $route = route('admin.numbers.edit', array_merge(['number' => $context], request()->all()));
                $number = $record->number;
                $name = sprintf("Número: %s",$number->name);
                return view('vendor.table.link', compact('name', 'route'));
            },
        ]);

        $this->getHeader('status')->getCell()->addDecorator('callable', [
            'closure' => function ($context, $record) {
                return view('vendor.table.status', compact('context','record'));
            },
        ]);

        $this->getHeader('amount')->getCell()->addDecorator('callable', [
            'closure' => function ($context, $record) {
                 $data = $record->grid()->first();
                return view('vendor.table.amount', compact('context','record','data'));
            },
        ]);
    }

    public function initFilter($query)
    {
        $query->where($this->getParams()->params);
    }

    public function grid()
    {

        return $this->belongsTo(Grid::class);
    }
    public function number()
    {

        return $this->belongsTo(Number::class);
    }

}
