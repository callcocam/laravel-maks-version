<?php

namespace App\Forms;

use App\AbstractForm;
use App\Number as NumberGrid;

class GridForm extends AbstractForm
{
    public function buildForm()
    {
        $data=[];
        if($this->getModel()){
            $this->add('id', 'hidden');
            $numbers = $this->getModel()->numbers()->get();
            $map = $numbers->map(function($items){
                return $items->id;
            });
            if($map){
                $data = $map->toArray();
            }
        }

        $this
            ->add('slug', 'hidden')
            ->add('name', 'text',[
                'label'=>'Nome'
            ])
            ->add('numbers','entity',[
                'class' => NumberGrid::class,
                'property' => 'name',
                'selected'=>$data,
                'property_key ' => 'id',
                'expanded' => true,
                'multiple' => true,
                'query_builder' => function (NumberGrid $fabric) {
                    // If query builder option is not provided, all data is fetched
                    return $fabric->orderBy('name', 'DESC');
                }
            ])
            ->addDescription()
            ->getStatus("Ativo", "Inativo")
            ->addSubmit();

        parent::buildForm();
    }

}
