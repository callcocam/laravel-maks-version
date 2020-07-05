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

class OrderForm extends AbstractForm
{
    public function buildForm()
    {
        if ($this->getModel()) {
            $this->add('id', 'hidden');
        }
        $this->add('clear_url', 'hidden',[
            'default_value' =>1
        ])
            ->add('codigo', 'text', [
                'label' => 'Referência',
                    'label_show' => false,
                "attr" => [
                    "readonly" => true,
                    "placeholder" => "Geração automatica"
                ]
            ]) ->add('product_id', 'chosen',[
                'class' => Product::class,
                'empty_value' => '=== Selecione Um Produto ===',
                'property' => 'cover,name',
                'label_show' => false,
                'attr'=>[
                    'class'=>'form-control form-control-chosen'
                ]
            ])
            ->add('responsible_id', 'chosen', [
                'class' => User::class,
                'label' => 'Responsavel',
                'label_show' => false,
                'property' => 'cover,name',
                'empty_value' => '=== Selecione Um Responsavel ===',
                'attr'=>[
                    'class'=>'form-control form-control-chosen'
                ]
            ])
            ->add('date', 'text', [
                'label' => 'Data',
                'label_show' => false,
                'default_value' => date("d/m/Y"),
                "attr" => [
                    "readonly" => true
                ]
            ])
            ->add('differentiated', 'text', [
                'label' => 'Diferenciado',
                'label_show' => false
            ])
            ->add('line_color', 'text', [
                'label' => 'Cor Da Linha',
                'label_show' => false
            ])
            ->add('washed', 'text', [
                'label' => 'Lavado',
                'label_show' => false
            ])
            ->addDescription('observation', 'Observações',[],false)
            ->addDescription('description', 'Descrição',[],false)
            ->getStatus("Ativo", "Inativo")
            ->addSubmit();

        parent::buildForm();
    }
}
