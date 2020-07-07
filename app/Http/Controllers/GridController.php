<?php
/**
 * Created by Claudio Campos.
 * User: callcocam@gmail.com
 * https://www.sigasmart.com.br
 */
namespace App\Http\Controllers;

use App\Forms\GridForm;
use App\Http\Requests\GridStore;
use App\Grid;

class GridController extends  AbstractController
{
    protected $template = 'grids';

    protected $model = Grid::class;

    protected $formClass = GridForm::class;
    /**
     * Store a newly created resource in storage.
     *
     * @param GridStore $request
     * @return \Illuminate\Http\Response
     */
    public function store(GridStore $request)
    {
        return $this->save($request);
    }

}
