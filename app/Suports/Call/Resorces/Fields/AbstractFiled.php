<?php
/**
 * Created by Claudio Campos.
 * User: callcocam@gmail.com
 * https://www.sigasmart.com.br
 */
namespace App\Suports\Call\Resources\Fields;


use Illuminate\Support\Str;

abstract class AbstractFiled
{

    protected $table;

    protected $render = [
        'index'=>'',
        'name'=>'',
        'title'=>'',
        'label'=>'',
        'visible'=>false,
        'sorter'=>false,
        'filter'=>false,
        'alias'=>'',
        'width'=>null,
        'format'=>'text',
        'separatable'=>false,
        'classe'=>'',
        'variant'=>'',
        'icone'=>'',
        'hidden_list'=>true,
        'hidden_show'=>true,
        'hidden_create'=>true,
        'hidden_edit'=>true,
    ];

    public  function make($name, $opitions=null){


        $this->render['key'] =$name;
        $this->render['index'] =$name;
        $this->render['label']=Str::title($name);

        if($opitions){

            foreach($opitions as $name => $value){
                $this->render[$name]  = $value;
            }
        }


        return $this;
    }

    /**
     * @return string
     */
    public function format($format)
    {
        $this->render['format']=$format;

        return  $this;
    }

    /**
     * @return string
     */
    public function width($width="15%")
    {
        $this->render['width']=$width;

        return  $this;
    }

    /**
     * @return string
     */
    public function label($label)
    {
        $this->render['label']=$label;

        return  $this;
    }

    /**
     * @return string
     */
    public function alias($alias)
    {
        $this->render['alias']=$alias;

        return  $this;
    }

    /**
     * @return string
     */
    public function sortable()
    {
        $this->render['sorter']=true;

        return  $this;
    }

    /**
     * @return string
     */
    public function filter()
    {
        $this->render['filter']=true;

        return  $this;
    }

    /**
     * @return string
     */
    public function hiddenList()
    {
        $this->render['hidden_list']=false;

        return  $this;
    }

    /**
     * @return string
     */
    public function hiddenShow()
    {
        $this->render['hidden_show']=false;

        return  $this;
    }

    /**
     * @return string
     */
    public function hiddenEdit()
    {
        $this->render['hidden_edit']=false;

        return  $this;
    }

    /**
     * @return string
     */
    public function hiddenCreate()
    {
        $this->render['hidden_create']=false;

        return  $this;
    }

    public function getKey(){

        return $this->render['name'];
    }

    public function render(){

        return $this->render;
    }

    public function __get($name)
    {
        return $this->{$name};
    }

    public function __set($name, $value)
    {
        $this->{$name}  = $value;

        return $this;
    }

}
