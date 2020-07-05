<?php
/**
 * Created by Claudio Campos.
 * User: callcocam@gmail.com
 * https://www.sigasmart.com.br
 */
namespace App\Suports\Call\Resources\Fields;

class ActionField extends AbstractFiled
{

    public function make($name, $table=null)
    {
        $this->render['name']=$name;
        $this->render['alias']=$name;
        $this->render['format']="actions";
        return  parent::make($name,$table);
    }


}