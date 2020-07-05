<?php
/**
 * Created by Claudio Campos.
 * User: callcocam@gmail.com
 * https://www.sigasmart.com.br
 */

namespace App\Http\Controllers;

use App\Forms\ProviderForm;
use App\Http\Requests\ProviderStore;
use App\Provider;

class ProviderController extends AbstractController
{
    protected $template = 'providers';

    protected $model = Provider::class;

    protected $formClass = ProviderForm::class;
    /**
     * Store a newly created resource in storage.
     *
     * @param ProviderStore $request
     * @return \Illuminate\Http\Response
     */
    public function store(ProviderStore $request)
    {
        return $this->save($request);
    }
}
