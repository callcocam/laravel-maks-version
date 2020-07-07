<?php
/**
 * ==============================================================================================================
 *
 * Created by Claudio Campos.
 * User: callcocam@gmail.com
 * https://www.sigasmart.com.br
 * ==============================================================================================================
 */

namespace App\Providers;


use App\Rules\GtZero;
use Illuminate\Support\ServiceProvider;

class CustomRulesServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        \Validator::extend('gtzero', function($attribute, $value, $parameter, $validator){
            return (new GtZero())->passes($attribute, $value);
        });
    }

}
