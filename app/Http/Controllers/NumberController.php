<?php
/**
 * Created by Claudio Campos.
 * User: callcocam@gmail.com
 * https://www.sigasmart.com.br
 */
namespace App\Http\Controllers;

use App\Forms\NumberForm;
use App\Http\Requests\NumberStore;
use App\Number;

class NumberController extends  AbstractController
{
    protected $template = 'numbers';

    protected $model = Number::class;

    protected $formClass = NumberForm::class;
    /**
     * Store a newly created resource in storage.
     *
     * @param NumberStore $request
     * @return \Illuminate\Http\Response
     */
    public function store(NumberStore $request)
    {
        return $this->save($request);
    }

}
