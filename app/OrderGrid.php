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

class OrderGrid extends Model
{
    use TraitModel, TraitTable;

    protected $table = "orders";

    public $incrementing = false;

    protected $keyType = "string";

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'codigo', 'responsible_id', 'grid_id', 'fabric_id', 'product_id', 'date', 'differentiated', 'line_color', 'washed', 'status', 'description', 'observation'
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
        $this->headers = [];
    }


    public function user()
    {
        return $this->belongsTo(User::class, 'responsible_id');
    }

    public function grids()
    {
        return $this->hasMany(GridOrderItem::class,'grid_id');
    }

    protected function posSave($data)
    {

        if (isset($data['grid'])) {
            $grids = $data['grid'];
            if (isset($grids['parent']) && $grids['parent']) {
                $grids = $data['grid'];
                $grid = Grid::find( $grids['parent'] );
                $numbers = $grid->numbers()->get();
                if($numbers->count()){
                    foreach ($numbers as $number){
                       $this->addItem($data['id'],$grids['parent'], $number->id, 0);
                    }
                }
            }

        }

        if (isset($data['amount'])) {

            $amounts = $data['amount'];

            foreach ($amounts as $key => $amount){
                $this->model->grids()->getRelated()->saveBy([
                    'id'=>$key,
                    'amount'=>$amount,
                ]);
            }
        }
    }

    public function init()
    {

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



    protected function addItem($order, $grid,$number,$amount){
        $dataItem["order_id"] = $order;
        $dataItem["grid_id"] = $grid;
        $dataItem["number_id"] = $number;
        $dataItem["amount"] = $amount;
        $dataItem["status"] = "published";
        $item = $this->model->grids()->getRelated()->findBy([
            "order_id"=>$order,
            "grid_id"=>$grid,
            "number_id"=>$number,
        ])->first();

        if ($item) {
            $dataItem["id"] = $item->id;
            $dataItem["amount"] = $item->amount;
        }
        $this->model->grids()->getRelated()->saveBy($dataItem);
    }
}
