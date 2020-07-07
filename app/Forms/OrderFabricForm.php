<?php

/**
 * Created by Claudio Campos.
 * User: callcocam@gmail.com
 * https://www.sigasmart.com.br
 */

namespace App\Forms;

use App\AbstractForm;

class OrderFabricForm extends AbstractForm
{
    public function buildForm()
    {
        if ($this->getModel()) {
            $this->add('id', 'hidden');
        }
        $this->add('clear_url', 'hidden',[
            'default_value' =>1
        ])->addFabric();

        parent::buildForm();
    }

    private function addFabric()
    {

        if (!$this->getModel()) {
            return $this;
        }

        $this->add('fabric', 'form', [
            'label_attr' => ['class' => 'footer-bottom border-top pt-3 d-flex flex-column flex-sm-row align-items-center'],
            'class' => $this->formBuilder->create(FabricItemForm::class),
            'wrapper' => false,
            'wrapper_class' => false,
            'label' => 'Tecidos'
        ]);


        $this->add('fabrics', 'belongsto', [
            'label' => 'Lista de Tecidos',
            'items' => $this->getModel()->items()->getRelated()->setParams([
                'assets'=>'fabrics',
                'order_id'=>$this->getModel()->id,
            ])->render('table-items'),
        ]);

        return $this;
    }
}
