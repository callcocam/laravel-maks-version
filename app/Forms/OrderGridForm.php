<?php

/**
 * Created by Claudio Campos.
 * User: callcocam@gmail.com
 * https://www.sigasmart.com.br
 */

namespace App\Forms;

use App\AbstractForm;
use App\Grid;
use App\Product;
use App\User;

class OrderGridForm extends AbstractForm
{
    public function buildForm()
    {
        if ($this->getModel()) {
            $this->add('id', 'hidden');
        }
        $this->addGrid();

        parent::buildForm();
    }

    private function addGrid()
    {

        if (!$this->getModel()) {
            return $this;
        }

        $this->add('grid', 'form', [
            'label_attr' => ['class' => 'footer-bottom border-top pt-3 d-flex flex-column flex-sm-row align-items-center'],
            'class' => $this->formBuilder->create(GridItemForm::class),
            'wrapper' => false,
            'wrapper_class' => false,
            'label' => 'Grade'
        ]);

        $this->add('grids', 'belongsto', [
            'label' => 'Lista de Grades',
            'items' => $this->getModel()->grids()->getRelated()->setParams([
                'order_id'=>$this->getModel()->id,
            ])->render('table-items-grid'),
        ]);

        return $this;
    }

}
