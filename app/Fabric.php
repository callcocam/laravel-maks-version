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

class Fabric extends Model
{
    use TraitModel, TraitTable;

    protected $table = "stocks";

    public $incrementing = false;

    protected $keyType = "string";


    protected $fillable = [
        'name','slug','assets', 'reference','metreage','amount','width','price','minimum_quantity', 'status','description'
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

        $this->alias = 'tecido';
        $this->endpoint = 'fabrics';

        $this->defaultOptions['title'] = "Lista de tecidos";
        $this->defaultOptions['endpoint'] = "fabrics";
        $this->headers = [
            ID::make('id')->hiddenList()->hiddenShow()->render(),
            TEXT::make('name')->filter()->render(),
            TEXT::make('reference')->filter()->render(),
        ];
    }
    public function init()
    {
        $this->getHeader('status')->getCell()->addDecorator('callable', [
            'closure' => function ($context, $record) {
                return view('vendor.table.status', compact('context'));
            },
        ]);
    }

    public function initFilter($query)
    {
        $query->where('assets', 'fabrics');
    }

}
