<?php

namespace App\Forms;

use App\AbstractForm;
use App\Suports\Shinobi\Models\Role;

class LoginForm extends AbstractForm
{
    public function buildForm()
    {

        $this->add('email', 'email',[
            'template' => 'laravel-form-builder::text-inline',
            'label_show'=>false
        ])
            ->add('password', 'password',[
                'template' => 'laravel-form-builder::text-inline',
                'label'=>"Senha",
                'label_show'=>false,
            ])
            ->addSubmit("Logar no sistema",[
                'template' => 'laravel-form-builder::button-inline'
            ]);

        parent::buildForm();
    }


}
