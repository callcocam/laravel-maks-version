<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OutputProcessStep extends Model
{
    use TraitModel, TraitTable;

    public $incrementing = false;

    protected $keyType = "string";

    protected $table = "output_process_steps";

    protected $fillable = [
        'stage_id','responsible_id','provider_id','order_id','date','number_of_pieces','piece_value','status'
    ];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

        $this->defaultOptions['endpoint'] = "address";
        $this->headers = [];
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
