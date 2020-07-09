<?php

namespace App\Observers;

use App\InputProcessStep;
use Illuminate\Support\Facades\DB;

class InputProcessStepObserver
{

    /**
     * Handle the input process step "created" event.
     *
     * @param  \App\InputProcessStep  $inputProcessStep
     * @return void
     */
    public function created(InputProcessStep $inputProcessStep)
    {
        //
    }

    /**
     * Handle the input process step "updated" event.
     *
     * @param  \App\InputProcessStep  $inputProcessStep
     * @return void
     */
    public function updated(InputProcessStep $inputProcessStep)
    {
        //payment
        $order = $inputProcessStep->order()->first();
        if($order){
            $result =  $order->input()->select(DB::raw('SUM(piece_value) as total'))->first();
            if($result){
                DB::table('input_process_steps')->where(['id'=>$inputProcessStep->id])->update([
                    'current_value_pecie'=>$result->total,
                ]);
                $inputProcessStep->current_value_pecie=$result->total;
            }
        }

        if($inputProcessStep->status == 'published'){
            $quantity = form_read( $inputProcessStep->number_of_pieces);
            $price = Calcular(form_read( $inputProcessStep->piece_value),$quantity, '*');
            if($inputProcessStep->number_of_damaged_pieces){
                $number_of_damaged_pieces = Calcular(form_read( $inputProcessStep->current_value_pecie),form_read( $inputProcessStep->number_of_damaged_pieces), '8');
                $price = Calcular(form_read($price),form_read($number_of_damaged_pieces), '-');
            }
            if(!$inputProcessStep->payment()->count()){
                $inputProcessStep->payment()->getRelated()->saveBy([
                    'input_process_step_id'=>$inputProcessStep->id,
                    'provider_id'=>$inputProcessStep->provider_id,
                    'payment_date'=>today()->addDays(env('PAYMENT_DATE',30))->format("Y-m-d"),
                    'price'=> $price,
                    'status'=>'draft',
                    'description'=>sprintf("Conta referente a ordem de serviço código -%s- da etapa -%s!",$inputProcessStep->order->codigo,$inputProcessStep->stage->name)
                ]);
            }

        }


    }

    /**
     * Handle the input process step "deleted" event.
     *
     * @param  \App\InputProcessStep  $inputProcessStep
     * @return void
     */
    public function deleted(InputProcessStep $inputProcessStep)
    {
        //
    }

    /**
     * Handle the input process step "restored" event.
     *
     * @param  \App\InputProcessStep  $inputProcessStep
     * @return void
     */
    public function restored(InputProcessStep $inputProcessStep)
    {
        //
    }

    /**
     * Handle the input process step "force deleted" event.
     *
     * @param  \App\InputProcessStep  $inputProcessStep
     * @return void
     */
    public function forceDeleted(InputProcessStep $inputProcessStep)
    {
        //
    }
}
