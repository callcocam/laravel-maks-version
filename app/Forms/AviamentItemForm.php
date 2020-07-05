<?php
/**
 * Created by Claudio Campos.
 * User: callcocam@gmail.com
 * https://www.sigasmart.com.br
 */
namespace App\Forms;

use App\AbstractForm;
use App\Aviament;
class AviamentItemForm extends AbstractForm
{
    public function buildForm()
    {
        if($this->getModel()){
            $this->add('id', 'hidden');
        }
        $this
            ->add('id', 'hidden')
            ->add('parent', 'chosen',[
                'class' => Aviament::class,
                'empty_value' => '=== Selecione Um Aviamento ===',
                'label'=>'Aviamentos',
                'default_value' => request()->get('aviaments_parent',null),
                'property' => 'cover,name,metreage,width,amount',
                'attr'=>[
                    'class'=>'form-control form-control-chosen'
                ],
                'query_builder' => function (Aviament $aviament) {
                    // If query builder option is not provided, all data is fetched
                    return $aviament->where('assets', 'aviaments');
                }
            ])->addSubmit("Add Aviamento");

        parent::buildForm();
    }

}
