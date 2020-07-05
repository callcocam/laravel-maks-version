<?php

/**
 * Created by Claudio Campos.
 * User: callcocam@gmail.com
 * https://www.sigasmart.com.br
 */

namespace App\Http\Controllers;

use App\Forms\OrderFabricForm;
use App\Http\Requests\OrderFabricStore;
use App\OrderFabric;

class OrderFabricController extends AbstractController
{
    protected $template = 'orders';

    protected $routeStore = 'orders-fabrics';

    protected $model = OrderFabric::class;

    protected $formClass = OrderFabricForm::class;
    /**
     * Store a newly created resource in storage.
     *
     * @param OrderFabricStore $request
     * @return \Illuminate\Http\Response
     */
    public function store(OrderFabricStore $request)
    {
        $this->template = "edit-fabrics";

        return $this->save($request);
    }

    public function edit($id)
    {
        $this->templateEdit = "edit-fabrics";

        return parent::edit($id);
    }

}
