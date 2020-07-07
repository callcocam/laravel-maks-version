<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class InputProcessStep extends Model
{
    use TraitModel, TraitTable;

    public $incrementing = false;

    protected $keyType = "string";

    protected $table = "input_process_steps";

    protected $fillable = [
        'stage_id','provider_id','order_id','date','number_of_pieces','expected_delivery_date','number_of_damaged_pieces','piece_value','status','description'
    ];
    protected $casts = [
        'piece_value' => 'float',
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);
        $this->floats = ['price','piece_value'];
        $this->defaultOptions['endpoint'] = "inputs";
        $this->alias = 'ordem_servicos_etapas_entrada';
        $this->headers = [];
    }

    public function getDateAttribute($value)
    {
        return date_carbom_format($value)->format('d/m/Y');
    }
    public function inputStatusChek($currentData,$status)
    {
        return $currentData->status == $status;
    }


    public function inputStatusClass($currentData)
    {
        return check_status($currentData->status,[
            'published'=>"success",
            'payment'=>"success",
            'draft'=>"dark",
            'pause'=>"info",
            'feedstock'=>"warning",
            'deleted'=>"danger"
        ]);
    }

    public function inputStatusBtnText($currentData)
    {
        return check_status($currentData->status,[
            'payment'=>"Visualizar Etapa",
            'published'=>"Finalizada",
            'draft'=>" Finalizar Etapa",
            'pause'=>"Retornar etapa",
            'feedstock'=>"Retornar etapa",
            'deleted'=>"Folder-Trash"
        ]);
    }


    public function inputStatusBtnIcon($currentData)
    {
        return check_status($currentData->status,[
            'payment'=>"Eye",
            'published'=>"Check",
            'draft'=>"Pause",
            'pause'=>"Play-Music",
            'feedstock'=>"Play-Music",
            'deleted'=>"Folder-Trash"
        ]);
    }

    public function inputStatusIcon($currentData)
    {
        return check_status($currentData->status,[
            'payment'=>"Money-2",
            'published'=>"Check",
            'draft'=>"Pause",
            'pause'=>"Play-Music",
            'feedstock'=>"Play-Music",
            'deleted'=>"Folder-Trash"
        ]);
    }

    public function inputStatusMessage($currentData,$rows)
    {
        if(!$rows){
            return '--';
        }

        return check_status($currentData->status,[
            'draft'=>sprintf("Etapa %s para a ordem de serviço %s, esta em andamento",$currentData->name,str_pad($rows->codigo, 5, '0', STR_PAD_LEFT)),
            'pause'=>sprintf("Etapa %s para a ordem de serviço %s, esta pausada",$currentData->name,str_pad($rows->codigo, 5, '0', STR_PAD_LEFT)),
            'feedstock'=>sprintf("Etapa %s para a ordem de serviço %s, esta aguardando materia prima",$currentData->name,str_pad($rows->codigo, 5, '0', STR_PAD_LEFT)),
            'published'=>sprintf("Etapa %s para a ordem de serviço %s, esta finalizada",$currentData->name,str_pad($rows->codigo, 5, '0', STR_PAD_LEFT)),
            'payment'=>sprintf("Etapa %s para a ordem de serviço %s, esta finalizada e com ordem de pagamento gerada",$currentData->name,str_pad($rows->codigo, 5, '0', STR_PAD_LEFT)),
            'deleted'=>sprintf("Etapa %s para a ordem de serviço %s, foi cancelada",$currentData->name,str_pad($rows->codigo, 5, '0', STR_PAD_LEFT)),
        ]);
    }


    public function stage()
    {
        return $this->belongsTo(Stage::class);
    }

    public function payment()
    {
        return $this->hasOne(Payment::class);
    }

    public function provider()
    {
        return $this->belongsTo(Provider::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'responsible_id');
    }

    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    public function input_varia_value($rows)
    {
        return $rows->order->input_varia_value($rows->order,$rows);
    }
    public function init()
    {
        // TODO: Implement init() method.
    }



    public function initFilter($query)
    {
        // TODO: Implement initFilter() method.
    }
}
