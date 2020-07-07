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

class Number extends Model
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
        'name','slug','status'
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

        $this->alias = 'number';

        $this->defaultOptions['endpoint'] = "numbers";
        $this->defaultOptions['title'] = "Números de Grades";
        $this->headers = [
            ID::make('id')->hiddenList()->hiddenShow()->render(),
            TEXT::make('name')->label("Número")->filter()->render(),
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
        $query->orderBy('name','ASC');
    }

    public function order_items(){

        return $this->hasOne(GridOrderItem::class);
    }
}
