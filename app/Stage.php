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

class Stage extends Model
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
        'name','slug','ordering','alert_time','status','description'
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

        $this->alias = 'etapa';

        $this->defaultOptions['endpoint'] = "stages";
        $this->defaultOptions['title'] = "Etapas";
        $this->headers = [
            ID::make('id')->hiddenList()->hiddenShow()->render(),
            TEXT::make('name')->sortable()->render(),
            TEXT::make('ordering')->sortable()->render(),
            TEXT::make('alert_time')->render()
        ];
    }

    public function input($oder)
    {
        $this->currentData = $this->hasOne(InputProcessStep::class)->where('order_id', $oder->id)->first();
        return $this->currentData;
    }

    public function inputGet($name)
    {
        return $this->currentData->{$name};
    }
    public function inputExist()
    {
        return $this->currentData;
    }

    public function output()
    {
        return $this->belongsTo(OutputProcessStep::class);
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

}
