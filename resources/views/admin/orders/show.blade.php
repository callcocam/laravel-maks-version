@extends('layouts.admin')

@section('breadcrumb')
    <div class="breadcrumb">
        <h1>{{ $tenant->name }}</h1>
        <ul>
            <li><a href="{{ route('admin.admin.index') }}">{{ __('Painel') }}</a></li>
            <li><a href="{{ route('admin.orders.index', request()->query()) }}">{{ __('Ordem De Serviço') }}</a></li>
            <li>{{ __('Visualizar') }} - {{ str_pad($rows->codigo, 5, '0', STR_PAD_LEFT) }}</li>
        </ul>
    </div>
@endsection
@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card">
               <div class="card-header">
                   <div class="row">
                       <div class="col">
                           <h2>
                               {{ __('Ordem De Serviço') }} - {{ str_pad($rows->codigo, 5, '0', STR_PAD_LEFT) }}
                           </h2>
                       </div>
                       <div class="col">

                            @if($rows->inputStage($rows->id))
                                @if($rows->inputOpen())
                                    <a class="btn btn-dark float-right" href="{{ route('admin.inputs.create',[
                                    'ordem_servico'=>$rows->id
                                    ]) }}"><i class="fa fa-plus"></i> Adcionar Etapa </a>
                                @endif
                            @else
                            <a target="_blank" class="btn btn-warning float-right" href="{{ route('admin.order-delete-stage.print-stage.store',$rows->id) }}"><i class="fa fa-print"></i> Imprimir Etapas </a>
                            @endif
                       </div>
                   </div>
                   <div class="row">
                       <div class="col">
                           <b>Valor atual da peça:</b>{{ $rows->input_piece_value($rows) }} |
                           <b>Valor de serviços:</b>{{ $rows->input_total($rows) }} |
                           <b>Valor de tecidos:</b>{{ $rows->price() }} |
                           <b>Valor de aviamento:</b>{{ $rows->price(false) }}<br>
                           <b>Valor total:</b>{{ Calcular(Calcular($rows->input_total($rows), $rows->input_total($rows),"+"), $rows->price(false),"+") }}<br>
                           <b>Observações:</b>{{ $rows->observation }}<br>
                           <b>Descrição:</b>{{ $rows->description }}
                       </div>
                   </div>
               </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-12">
                            @if($rows->input()->count())
                              @include('admin.orders.stages.stage')
                            @else
                                <div class="not-found-wrap text-center">
                                    <p class="text-36 subheading mb-3">{{ __('Opa!') }}</p>
                                    <p class="mb-5 text-muted text-18">{{ __('Nenhum etapa foi encontrado!!') }}</p>
                                        <a class="btn btn-lg btn-danger btn-rounded" href="{{ route('admin.orders.index', request()->query()) }}"><i class="fa fa-reply"></i> {{ __('Retornar Para A Lista') }}</a>
                                        <a class="btn btn-lg btn-primary btn-rounded" href="{{ route('admin.inputs.create',[
                            'ordem_servico'=>$rows->id
                            ]) }}"><i class="fa fa-plus"></i> {{ __('Adcionar Etapa') }}</a>
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="row">
                        <div class="col">
                            @if($rows->inputStage($rows->id))
                            @if($rows->inputOpen())
                                <a class="btn btn-dark float-right" href="{{ route('admin.inputs.create',[
                                'ordem_servico'=>$rows->id
                                ]) }}"><i class="fa fa-plus"></i> Adcionar Etapa </a>
                            @endif
                        @else
                        <a target="_blank" class="btn btn-warning float-right" href="{{ route('admin.order-delete-stage.print-stage.store',$rows->id) }}"><i class="fa fa-print"></i> Imprimir Etapas </a>
                        @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

