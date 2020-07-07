<?php
/**
 * Created by Claudio Campos.
 * User: callcocam@gmail.com
 * https://www.sigasmart.com.br
 */
namespace App\Forms;

use App\AbstractForm;
use App\Fabric;

class FabricItemForm extends AbstractForm
{
    public function buildForm()
    {

        if($this->getModel()){
            $this->add('id', 'hidden');
        }

        $this
            ->add('id', 'hidden')
            ->add('parent', 'chosen',[
                'class' => Fabric::class,
                'empty_value' => '=== Selecione Um Tecido ===',
                'label'=>'Aviamentos',
                'default_value' => request()->get('fabrics_parent',null),
                'property' => 'cover,name,metreage,width,amount',
                'attr'=>[
                    'class'=>'form-control form-control-chosen'
                ],
                'query_builder' => function (Fabric $fabric) {
                    // If query builder option is not provided, all data is fetched
                    return $fabric->where('assets', 'fabrics');
                }
            ])->addSubmit("Add Tecido");

        parent::buildForm();
    }

}
