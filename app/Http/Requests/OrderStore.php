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

class OrderStore extends FormRequest
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

        $rules['product_id'] = ['required'];
        $rules['responsible_id'] = ['required'];
       /* if($this->id){
            if($this->fabric){
                if($this->fabric['parent']){
                    $stoke = Fabric::find($this->fabric['parent']);
                    $qty = $stoke->amount;
                    $rules['fabric.amounts'] = "required|numeric|min:1|max:$qty";
                }
            }
            if($this->aviament){
                if($this->aviament['parent']){
                    $stoke = Fabric::find($this->aviament['parent']);
                    $qty = $stoke->amount;

                    $rules['aviament.amounts'] = "required|numeric|min:1|max:$qty";
                }
            }
        }*/
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
