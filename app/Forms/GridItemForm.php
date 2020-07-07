<?php
/**
 * Created by Claudio Campos.
 * User: callcocam@gmail.com
 * https://www.sigasmart.com.br
 */
namespace App\Forms;

use App\AbstractForm;
use App\Grid;

class GridItemForm extends AbstractForm
{
    public function buildForm()
    {
        if($this->getModel()){
            $this->add('id', 'hidden');
        }
        $this
            ->add('id', 'hidden')
            ->add('parent', 'chosen',[
                'class' => Grid::class,
                'empty_value' => '=== Selecione Um Grade ===',
                'label'=>'Grades',
                'property' => 'cover,name',
                'attr'=>[
                    'class'=>'form-control form-control-chosen'
                ]
            ])->addSubmit("Add Grade", [], [
                'class'=>'btn btn-warning btn-block'
            ]);

        parent::buildForm();
    }

}
