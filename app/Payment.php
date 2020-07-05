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

class Payment extends Model
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
       'input_process_step_id','provider_id','payment_date','price','status','description'
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

        $this->alias = 'pagamento';

        $this->defaultOptions['endpoint'] = "payments";
        $this->defaultOptions['title'] = "Processos de produção";
        $this->headers = [
            ID::make('id')->hiddenList()->hiddenShow()->render(),
            TEXT::make('provider')->label('Fornecedor')->alias('provider_id')->sortable()->render(),
            TEXT::make('payment_date')->label('Data de vencimento')->sortable()->render(),
            TEXT::make('price')->label('Valor')->sortable()->render(),
        ];
    }
    public function init()
    {
        $this->getHeader('provider')->getCell()->addDecorator('callable', [
            'closure' => function ($context, $record) {
                return $context->name;
            },
        ]);
        $this->getHeader('payment_date')->getCell()->addDecorator('callable', [
            'closure' => function ($context, $record) {
                return date_carbom_format($context)->toLongDateString();
            },
        ]);
        $this->getHeader('price')->getCell()->addDecorator('callable', [
            'closure' => function ($context, $record) {
                return form_read($context);
            },
        ]);
        $this->getHeader('status')->getCell()->addDecorator('callable', [
            'closure' => function ($context, $record) {

                $options=[ 'published' => "Pago", "draft" => "Aguardando pagamento", 'deleted' => "Cancelado"];
                return view('vendor.table.status', compact('context','options'));
            },
        ]);
    }

    public function initFilter($query)
    {
        // TODO: Implement initFilter() method.
    }

    public function provider(){

        return $this->belongsTo(Provider::class);
    }
}
