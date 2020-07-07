<?php
/**
 * Created by Claudio Campos.
 * User: callcocam@gmail.com
 * https://www.sigasmart.com.br
 */

namespace App\Http\Controllers;

use App\Forms\ProductForm;
use App\Http\Requests\ProductStore;
use App\Product;

class ProductController extends AbstractController
{
    protected $template = 'products';

    protected $model = Product::class;

    protected $formClass = ProductForm::class;

    //protected $templateList = 'products';
    /**
     * Store a newly created resource in storage.
     *
     * @param ProductStore $request
     * @return \Illuminate\Http\Response
     */
    public function store(ProductStore $request)
    {
        return $this->save($request);
    }

}
