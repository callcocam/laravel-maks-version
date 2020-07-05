<?php
/**
 * Created by Claudio Campos.
 * User: callcocam@gmail.com
 * https://www.sigasmart.com.br
 */

namespace App\Suports\Call\Resources\Fields\Facades;


use App\Suports\Call\Resources\Fields\DateField;
use Illuminate\Support\Facades\Facade;

class DATE extends Facade
{

    protected static function getFacadeAccessor()
    {
        return DateField::class;
    }

}