<?php
/**
 * Created by Claudio Campos.
 * User: callcocam@gmail.com
 * https://www.sigasmart.com.br
 */
namespace App\Http\Controllers;

use App\Forms\StageForm;
use App\Http\Requests\StageStore;
use App\Stage;

class StageController extends AbstractController
{
    protected $template = 'stages';

    protected $model = Stage::class;

    protected $formClass = StageForm::class;
    /**
     * Store a newly created resource in storage.
     *
     * @param StageStore $request
     * @return \Illuminate\Http\Response
     */
    public function store(StageStore $request)
    {
        return $this->save($request);
    }
}
