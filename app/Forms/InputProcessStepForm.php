<?php

namespace App\Forms;

use App\AbstractForm;
use App\InputProcessStep;
use App\Order;
use App\Provider;
use App\Stage;
use Illuminate\Support\Facades\DB;

class InputProcessStepForm extends AbstractForm
{
    public function buildForm()
    {
        $this->add('order_id', 'hidden', [
            'default_value' => $this->request->get('ordem_servico')
        ]);
        if ($this->getModel()) {
            $this->add('id', 'hidden');
            if ($this->getModel()->status == 'payment') {
                $this->addReadonly();
            } else {
                $this->addEditable();
            }
        } else {
            $this->addCreate();
        }


        parent::buildForm();
    }

    private function addCreate()
    {

        $currentStage = InputProcessStep::query()->where([
            "order_id" => request()->get('ordem_servico')
        ])->orderBy('created_at', 'DESC')->whereNotIn('status', [
            'draft',
            'pause',
            'feedstock',
            'deleted',
        ])->first();

        $number_of_pieces = 0;
        //$piece_value = 0;

        if ($currentStage) {
            $number_of_pieces = $currentStage->number_of_pieces - $currentStage->number_of_damaged_pieces;
            //$piece_value = $currentStage->piece_value;
        }
        if(auth()->user()->hasRole('corte')){
            $this->add('number_of_pieces', 'text', [
                'label' => 'Número de peças na entrada',
                'default_value' => $number_of_pieces
            ]);
        }
        else{
            $this->add('number_of_pieces', 'hidden', [
                'default_value' => $number_of_pieces
            ]);
        }

        $this->add('piece_value', 'hidden', [
            'default_value' => 0
        ])->add('date', 'hidden', [
            'default_value' => date("Y-m-d")
        ]) ->add('status', 'hidden',
            [
                'default_value' => 'draft',
            ])->add('number_of_damaged_pieces', 'hidden', [
            'default_value' => 0
        ])->add('stage_id', 'entity', [
            'class' => Stage::class,
            'label' => 'Etapa',
            'empty_value' => '=== Selecione Uma Etapa ===',
            'property' => 'full_name',
            'query_builder' => function (Stage $stage) {
                $params = InputProcessStep::query()->select('stage_id')->where([
                    "order_id" => request()->get('ordem_servico')
                ])->get();
                // If query builder option is not provided, all data is fetched
                return $stage->select(["id",app('db')->raw('CONCAT(ordering," - ", name) AS full_name')])
                    ->whereNotIn('id', $params->toArray())->orderBy('ordering','ASC');
            }
        ])
            ->add('provider_id', 'entity', [
                'class' => Provider::class,
                'label' => 'Fornecedor',
                'empty_value' => '=== Selecione Um Fornecedor ==='
            ])
            ->add('expected_delivery_date', 'date', [
                'label' => 'Data prevista para entrega',
                'default_value' => today()->addDays($this->request->get('delivery', 1))->format("Y-m-d"),
            ])
            //->addDescription()
//            ->add('status', 'choice', [
//                'choices' => [
//                    'draft' => "Abrir"
//                ],
//                'default_value' => 'draft',
//                'label' => 'Situação Da Etapa',
//                'expanded' => true,
//            ])
            ->addSubmit("Iniciar Etapa");
    }


    private function addEditable()
    {


        $piece_amount = InputProcessStep::query()->select(DB::raw('SUM(piece_value) as total'))->where([
            "order_id" => request()->get('ordem_servico')
        ])->first();

        $piece_fabric = 0;
        $piece_value_amount = 0;

        if ($piece_amount) {
            $piece_value_amount = $piece_amount->total;
        }


        $order = Order::query()->where([
            "id" => request()->get('ordem_servico')
        ])->first();

        if ($order->items) {

            foreach ($order->items as $value) {
                if (!empty($value->fabric_id)) {

                    $amount = Calcular($value->amount, form_read($value->fabric->price), '+');

                    $piece_fabric = Calcular($piece_fabric, $amount, '+');
                }
            }
        }

        $this
            ->add('provider_id', 'hidden')
            ->add('stage_id', 'hidden')
            ->add('piece_fabric_value', 'hidden',
                [
                    'default_value' => form_read($piece_fabric),
                ])
            ->add('status', 'hidden',
                [
                    'value' => 'published',
                ])
            ->add('piece_current_value', 'hidden');
//
//            ->add('fabric_desc', 'text', [
//                'label' => 'Produto',
//                'default_value' => $order->product->name,
//                'attr' => [
//                    'readonly' => true
//                ],
//            ])
        /*->add('piece_fabric_value', 'text', [
            'label' => 'Valor total do tecido',
            'default_value' => form_read($piece_fabric),
            'attr' => [
                'readonly' => true
            ],
        ])*/
        /* ->add('piece_current_value', 'text', [
             'label' => 'Total do valor do serviço por peça',
             'default_value' => form_read($piece_value_amount),
             'attr' => [
                 'readonly' => true
             ],
         ])*/

        if(auth()->user()->hasRole('gerente')){
            $this->add('number_of_pieces', 'text', [
                'label' => 'Número de peças na entrada',
                'default_value' => form_read($piece_value_amount),
                'attr' => [
                    'readonly' => false
                ],
            ]);
        }
        else{

            $this->add('number_of_pieces', 'hidden', [
                'default_value' => form_read($piece_value_amount),
            ]);
        }

        $this ->add('current_value_pecie', 'text',[
            'default_value'=>$piece_amount->total
        ])->add('delivery_date', 'date', [
            'label' => 'Data prevista para entrega',
            'default_value' => today()->format("Y-m-d"),
        ])
            ->add('number_of_damaged_pieces', 'text', [
                'label' => 'Número de peças danificadas'
            ])
            ->add('piece_value', 'text', [
                'label' => 'Valor cobrado por peça'
            ])
            //->addDescription()
           /* ->add('status', 'choice', [
                'choices' => $this->status(),
                'default_value' => 'draft',
                'label' => 'Situação Da Etapa',
                'expanded' => true,
            ])*/
            ->addSubmit("Finalizar Etapa");
    }

    private function status(){


        if($this->getModel()->number_of_pieces && $this->getModel()->piece_value){
            return [
                'draft' => "Aberto",
                // 'pause' => "Pausado",
                //'feedstock' => "Aguardando Matéria Prima",
                'published' => "Finalizado",
                'payment' => "Gerar Pagamento",
            ];
        }
        return [
            'draft' => "Aberto",
            //'pause' => "Pausado",
            // 'feedstock' => "Aguardando Matéria Prima",
            'published' => "Finalizado",
        ];
    }


    private function addReadonly()
    {

        $this
            ->add('provider_id', 'hidden')
            ->add('providers', 'text', [
                'label' => 'Fornecedor',
                'default_value' => $this->getModel()->provider->name,
                'attr' => [
                    'readonly' => true
                ],
            ])
            ->add('stages', 'text', [
                'label' => 'Etapa',
                'default_value' => $this->getModel()->stage->name,
                'attr' => [
                    'readonly' => true
                ],
            ])
            ->add('number_of_pieces', 'text', [
                'label' => 'Número de peças na entrada',
                'attr' => [
                    'readonly' => true
                ],
            ])
            ->add('expected_delivery_date', 'date', [
                'label' => 'Data prevista para entrega',
                'attr' => [
                    'readonly' => true
                ],
            ])
            ->add('number_of_damaged_pieces', 'text', [
                'label' => 'Número de peças danificadas',
                'attr' => [
                    'readonly' => true
                ],
            ])
            ->add('piece_value', 'text', [
                'label' => 'Valor cobrado por peça',
                'attr' => [
                    'readonly' => true
                ],
            ])
            ->addDescription()
            ->add('status', 'choice', [
                'choices' => [
                    'payment' => "Gerar Pagamento",
                ],
                'label' => 'Situação Da Etapa',
                'expanded' => true,
            ]);
    }
}
