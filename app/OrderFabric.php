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

class OrderFabric extends Model
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

    public function items($where = [])
    {
        return $this->hasMany(ItemFabric::class)->where($where);
    }

    public function grids()
    {
        return $this->hasMany(GridOrderItem::class);
    }

    protected function posSave($data)
    {

        if (isset($data['fabric'])) {
            if ($data['fabric']) {
                $fabric = $data['fabric'];
                if (!empty($fabric["parent"])) {
                    $this->addItem($data, $fabric["parent"],[
                        "order_id" => $data["id"],
                        "fabric_id" => $fabric["parent"]
                    ]);
                }
            }
        }


        if (isset($data['amount'])) {
            $amounts = $data['amount'];
            foreach ($amounts as $key => $amount){
                $this->model->items()->getRelated()->saveBy([
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

    public function fabric()
    {
        return $this->belongsTo(Fabric::class);
    }


    protected function addItem($data, $parent, $ruery){
        $dataItem["order_id"] = $data["id"];
        $dataItem["assets"] = 'fabrics';
        $dataItem["fabric_id"] = $parent;
        $dataItem["amount"] = 1;
        $dataItem["status"] = "published";

        $item = $this->model->items()->getRelated()->findBy($ruery)->first();


        if ($item) {
            $dataItem["id"] = $item->id;
        }
        $this->model->items()->getRelated()->saveBy($dataItem);
    }
}
