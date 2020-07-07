<?php

/**
 * Created by Claudio Campos.
 * User: callcocam@gmail.com
 * https://www.sigasmart.com.br
 */

namespace App\Http\Controllers;

use App\Forms\OrderAviamentForm;
use App\Http\Requests\OrderAviamentStore;
use App\OrderAviament;

class OrderAviamentController extends AbstractController
{
    protected $template = 'orders';

    protected $routeStore = 'orders-aviaments';

    protected $model = OrderAviament::class;

    protected $formClass = OrderAviamentForm::class;
    /**
     * Store a newly created resource in storage.
     *
     * @param OrderAviamentStore $request
     * @return \Illuminate\Http\Response
     */
    public function store(OrderAviamentStore $request)
    {
        $this->template = "edit-aviaments";

        return $this->save($request);
    }

    public function edit($id)
    {
        $this->templateEdit = "edit-aviaments";

        return parent::edit($id);
    }

}
