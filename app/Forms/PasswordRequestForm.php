<?php

namespace App\Forms;

use App\AbstractForm;

class PasswordRequestForm extends AbstractForm
{
    public function setToken($token){

    }
    public function buildForm()
    {

        $this
        ->add('token', 'hidden',[
            'template' => 'laravel-form-builder::text-inline',
            'label_show'=>false,
            'value_default'=>request()->get('token')
        ])
        ->add('email', 'email',[
            'template' => 'laravel-form-builder::text-inline',
            'label_show'=>false
        ])
        ->add('password', 'password',[
            'template' => 'laravel-form-builder::text-inline',
            'label_show'=>false,
            'label'=>'Senha'
        ])
        ->add('password_confirmation', 'password',[
            'template' => 'laravel-form-builder::text-inline',
            'label_show'=>false,
            'label'=>'Confirmar Senha'
        ])->addSubmit('Cadastrar Nova Senha',[
            'template' => 'laravel-form-builder::button-inline'
        ]);

        parent::buildForm();
    }


}
