<?php
/**
 * Created by Claudio Campos.
 * User: callcocam@gmail.com
 * https://www.sigasmart.com.br
 */
namespace App\Http\Requests;

use App\Fabric;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class OrderGridStore extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {

        $rules = [];

        return $rules;
    }

    public function messages()
    {
        return [
            'required'=>"Campo obrigatório",
            'max'=>"A quantidade não pode ser superior a :max.",
        ];
    }
}
