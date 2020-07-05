<?php
/**
 * Created by Claudio Campos.
 * User: callcocam@gmail.com
 * https://www.sigasmart.com.br
 */
namespace App\Http\Controllers;

use App\Forms\PaymentForm;
use App\Http\Requests\PaymentStore;
use App\Payment;

class PaymentController extends AbstractController
{
    protected $template = 'payments';

    protected $model = Payment::class;

    protected $formClass = PaymentForm::class;
    /**
     * Store a newly created resource in storage.
     *
     * @param PaymentStore $request
     * @return \Illuminate\Http\Response
     */
    public function store(PaymentStore $request)
    {
        return $this->save($request);
    }
}
