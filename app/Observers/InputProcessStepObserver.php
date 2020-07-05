<?php

namespace App\Observers;

use App\InputProcessStep;

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
        if($inputProcessStep->status == 'payment'){
            $quantity = form_read( $inputProcessStep->number_of_pieces);
            if($inputProcessStep->number_of_damaged_pieces){
                $quantity = Calcular(form_read( $inputProcessStep->number_of_pieces),form_read( $inputProcessStep->number_of_damaged_pieces), '-');
            }
            $price = Calcular(form_read( $inputProcessStep->piece_value),$quantity, '*');

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
