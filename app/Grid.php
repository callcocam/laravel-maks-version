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

class Grid extends Model
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
        'name','slug','status','description'
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

        $this->alias = 'grade';

        $this->defaultOptions['endpoint'] = "grids";
        $this->defaultOptions['title'] = "Grades";
        $this->headers = [
            ID::make('id')->hiddenList()->hiddenShow()->render(),
            TEXT::make('name')->filter()->render(),
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
        // TODO: Implement initFilter() method.
    }
    public function numbers(){

        return $this->belongsToMany(Number::class);

    }
    protected function posSave($data)
    {
        if(isset($data['numbers'])){
            $this->model->numbers()->sync($data['numbers']);
        }
    }
}
