<?php
/**
 * Created by Claudio Campos.
 * User: callcocam@gmail.com
 * https://www.sigasmart.com.br
 */
namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class StageStore extends FormRequest
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

        $rules = [
            'name' => [
                'required',
                Rule::unique('stages')->ignore($this->id)->whereNull('deleted_at'),
            ],
            'ordering' => [
                'required'
            ],
        ];
        return $rules;
    }

    public function messages()
    {
        return [
            'required'=>"Campo obrigatório"
        ];
    }
}
