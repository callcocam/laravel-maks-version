<?php

/**
 * Created by Claudio Campos.
 * User: callcocam@gmail.com
 * https://www.sigasmart.com.br
 */

namespace App\Http\Controllers;

use App\Forms\OrderForm;
use App\Http\Requests\OrderStore;
use App\InputProcessStep;
use App\Item;
use App\Order;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Auth;

class OrderController extends AbstractController
{
    protected $template = 'orders';

    protected $model = Order::class;

    protected $formClass = OrderForm::class;
    /**
     * Store a newly created resource in storage.
     *
     * @param OrderStore $request
     * @return \Illuminate\Http\Response
     */
    public function store(OrderStore $request)
    {

        return $this->save($request);
    }

    public function deleteItem($id)
    {
        $this->model = Item::class;

        $model = $this->getModel()->findById($id);

        if (!$model) {

            notify()->error("O modelo não foi informado, se o problema persistir contate o administardor!!!!");

            return back()->withErrors("O modelo não foi informado, se o problema persistir contate o administardor!!!!");
        }

        if ($this->getModel()->deleteBy($model)) {

            notify()->success($this->getModel()->getMessage());

            return back()->with('success', $this->getModel()->getMessage());
        }

        notify()->error($this->getModel()->getMessage());

        return back()->withErrors($this->getModel()->getMessage());
    }

    public function deleteStage($id)
    {
        $this->model = InputProcessStep::class;

        $model = $this->getModel()->findById($id);

        if (!$model) {

            notify()->error("O modelo não foi informado, se o problema persistir contate o administardor!!!!");

            return back()->withErrors("O modelo não foi informado, se o problema persistir contate o administardor!!!!");
        }

        if ($this->getModel()->deleteBy($model)) {

            notify()->success($this->getModel()->getMessage());

            return back()->with('success', $this->getModel()->getMessage());
        }

        notify()->error($this->getModel()->getMessage());

        return back()->withErrors($this->getModel()->getMessage());
    }

    public function printStage($id)
    {
        error_reporting(E_ALL ^ E_DEPRECATED);

        $this->results['user'] = Auth::user();

        $this->results['tenant'] = get_tenant();

        if ($this->model) {

            $this->results['rows'] = $this->getModel()->findById($id);
        }

        if (!$this->results['rows']) {

            notify()->error("O modelo não foi informado, se o problema persistir contate o administardor!!!!");

            return redirect()->route(sprintf("admin.%s.index", $this->template))->withErrors("O modelo não foi informado, se o problema persistir contate o administardor!!!!");
        }

        $pdf = App::make('dompdf.wrapper');

        $pdf->loadHTML(view(sprintf('admin.%s.print-stage', $this->template), $this->results));
        return $pdf->stream();

        //return view(sprintf('admin.%s.print-stage', $this->template), $this->results);
    }
}
