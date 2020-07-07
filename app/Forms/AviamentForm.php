<?php

namespace App\Forms;

use App\AbstractForm;
use App\Suports\Shinobi\Models\Role;

class AviamentForm extends AbstractForm
{
    public function buildForm()
    {
        if($this->getModel()){
            $this->add('id', 'hidden');
        }

        $this
            //->add('width', 'hidden')
            ->add('slug', 'hidden')
            ->add('assets', 'hidden',[
                'default_value'=>'aviaments'
            ])
            ->add('name', 'text',[
                'label'=>'Nome'
            ])
            ->add('reference', 'text',[
                'label'=>'Referência'
            ])
            ->add('amount', 'text',[
                'label'=>'Quantidade'
            ])
            ->add('width', 'text',[
                'label'=>'Tamanho'
            ])
            ->add('price', 'text',[
                'label'=>'Valor'
            ])
            ->add('minimum_quantity', 'text',[
                'label'=>'Quantidade mínima '
            ])
            ->add('cover', 'file',[
                'label'=>'Capa'
            ])
            ->addDescription()
            ->getStatus("Ativo", "Inativo")
            ->addSubmit();

        parent::buildForm();
    }

}
