<?php
/**
 * Created by Claudio Campos.
 * User: callcocam@gmail.com
 * https://www.sigasmart.com.br
 */
namespace App\Suports\Call\Resources\Fields\Facades;


use App\Suports\Call\Resources\Fields\IdField;
use Illuminate\Support\Facades\Facade;

class ID extends Facade
{
    protected static function getFacadeAccessor()
    {
        return IdField::class;
    }
}