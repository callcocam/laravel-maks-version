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

class Provider extends Model
{
    use TraitModel, TraitTable;

    protected $table ='providers';

    public $incrementing = false;

    protected $keyType = "string";
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id','name','slug', 'fantasy','phone','document','ie','email', 'status','description'
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

        $this->alias="fornecedore";

        $this->defaultOptions['endpoint'] = "providers";
        $this->defaultOptions['title'] = "Fornecedores";
        $this->headers = [
            ID::make('id')->hiddenList()->hiddenShow()->render(),
            COVER::make('cover')->render(),
            TEXT::make('name')->sortable()->filter()->render(),
        ];
    }
    public function address(){

        return $this->morphOne(Addres::class, 'addresable');
    }

    public function stages(){

        return $this->hasMany(InputProcessStep::class);
    }

    public function getAddressAttribute(){

        return $this->address()->first(['zip','city','state','country', 'street','district','number','complement']);
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
