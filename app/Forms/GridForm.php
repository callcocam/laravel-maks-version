<?php

namespace App\Forms;

use App\AbstractForm;
use App\Number as NumberGrid;

class GridForm extends AbstractForm
{
    public function buildForm()
    {
        $data=[];
        $id = null;
        if($this->getModel()){
            $this->add('id', 'hidden');
            $id = $this->getModel()->id;
            $numbers = $this->getModel()->numbers()->get();
            $map = $numbers->map(function($items){
                return $items->id;
            });
            if($map){
                $data = $map->toArray();
            }
        }

        $dataNumberGrid = NumberGrid::query()->select(['id','name'])->orderBy('name', 'DESC')->get();
          
        $map = [];
        foreach($dataNumberGrid as $value){
         
            if($id){
                 $sunGrid = $value->order_items()->select(\DB::raw('SUM(amount) as amounts'))->where('grid_id',$id)->first();
                 if($sunGrid->amounts)
                 $map[$value->id] = sprintf("%s - Estoque: %s",$value->name,$sunGrid->amounts);
                 else
                 $map[$value->id] = sprintf("%s - Estoque:00",$value->name);  
            }
            else{
                $map[$value->id] = sprintf("%s - Estoque:00",$value->name);
            }
           
           
        }


        $this
            ->add('slug', 'hidden')
            ->add('name', 'text',[
                'label'=>'Nome'
            ])->add('numbers', 'choice', [
                'choices' =>  $map,
                'property' => 'name',
                'selected' => $data,
                'expanded' => true,
                'multiple' => true
            ])
           /* ->add('numbers','entity',[
                'class' => NumberGrid::class,
                'property' => 'name',
                'selected'=>$data,
                'property_key ' => 'id',
                'expanded' => true,
                'multiple' => true,
                'query_builder' => function (NumberGrid $fabric) {
                    // If query builder option is not provided, all data is fetched
                    return $fabric
                    ->select(['id','name'])
                    ->orderBy('name', 'DESC');
                }
            ])*/
            ->addDescription()
            ->getStatus("Ativo", "Inativo")
            ->addSubmit();
          // This creates list of checkboxes
        parent::buildForm();
    }

}
