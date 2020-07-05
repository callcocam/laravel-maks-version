<?php
/**
 * Created by Claudio Campos.
 * User: callcocam@gmail.com
 * https://www.sigasmart.com.br
 */
namespace App;

use App\Processors\AvatarProcessor;
use App\Suports\Call\Resources\Fields\Facades\COVER;
use App\Suports\Call\Resources\Fields\Facades\ID;
use App\Suports\Call\Resources\Fields\Facades\TEXT;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{

    use TraitModel, TraitTable;

    protected $table = "products";

    public $incrementing = false;

    protected $keyType = "string";
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name','slug','stoke', 'reference','information','details','description', 'status'
    ];


   public function __construct(array $attributes = [])
   {
       parent::__construct($attributes);

       $this->alias="produto";

       $this->defaultOptions['endpoint'] = "products";
       $this->defaultOptions['title'] = "Produtos";
       $this->headers = [
           ID::make('id')->hiddenList()->hiddenShow()->render(),
           COVER::make('cover')->render(),
           TEXT::make('name')->sortable()->filter()->render(),
       ];
   }

    public function init()
    {

        $this->getHeader('cover')->getCell()->addDecorator('callable', [
            'closure' => function ($context, $record) {
                return AvatarProcessor::get($record);
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
        // TODO: Implement initFilter() method.
    }
}
