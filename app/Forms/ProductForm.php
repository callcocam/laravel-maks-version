<?php

namespace App\Forms;

use App\AbstractForm;

class ProductForm extends AbstractForm
{
    public function buildForm()
    {
        if($this->getModel()){
            $this->add('id', 'hidden');
        }

        $this
            ->add('slug', 'hidden')
            ->add('name', 'text',[
                'label'=>'Nome'
            ])
            ->add('reference', 'text',[
                'label'=>'Referência'
            ])
            ->add('stoke', 'text',[
                'label'=>'Estoque'
            ])
            ->add('cover', 'file',[
                'label'=>'Foto'
            ])
            ->addDescription('information',"Informações")
            ->addDescription('details','Detalhes')
            ->addDescription()
            ->getStatus("Ativo", "Inativo")
            ->addSubmit();

        parent::buildForm();
    }

}
