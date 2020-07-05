<?php

/**
 * Created by Claudio Campos.
 * User: callcocam@gmail.com
 * https://www.sigasmart.com.br
 */

namespace App\Forms;

use App\AbstractForm;

class OrderAviamentForm extends AbstractForm
{
    public function buildForm()
    {
        if ($this->getModel()) {
            $this->add('id', 'hidden');
        }
        $this->add('clear_url', 'hidden',[
            'default_value' =>1
        ])->addAviament();

        parent::buildForm();
    }
    private function addAviament()
    {

        if (!$this->getModel()) {
            return $this;
        }

        $this->add('aviament', 'form', [
            'label_attr' => ['class' => 'footer-bottom border-top pt-3 d-flex flex-column flex-sm-row align-items-center'],
            'class' => $this->formBuilder->create(AviamentItemForm::class),
            'wrapper' => false,
            'wrapper_class' => false,
            'label' => 'Tecidos'
        ]);


        $this->add('aviaments', 'belongsto', [
            'label' => 'Lista de Aviamentos',
            'items' => $this->getModel()->items()->getRelated()->setParams([
                'assets'=>'aviaments',
                'order_id'=>$this->getModel()->id,
            ])->render('table-items')
        ]);

        return $this;
    }
}
