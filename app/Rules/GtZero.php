<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;

class GtZero implements Rule
{
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {

        if($this->number_format_drop_zero_decimals(form_w($value),2) > 0) return true;  // Vazio, sem required antes

        return false;
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'Valor maior que zero deve ser passado';
    }

    private  function number_format_drop_zero_decimals($n, $n_decimals)
    {
        return ((floor($n) == round($n, $n_decimals)) ? number_format($n) : number_format($n, $n_decimals));
    }
}
