@extends('layouts.admin')

@section('breadcrumb')
    <div class="breadcrumb">
        <h1>{{ $tenant->name }}</h1>
        <ul>
            <li><a href="{{ route('admin.admin.index') }}">{{ __('Painel') }}</a></li>
            <li><a href="{{ route('admin.providers.index', request()->query()) }}">{{ __('Fornecedors') }}</a></li>
            <li>{{ __('Visualizar Fornecedor') }} - {{ $rows->name }}</li>
        </ul>
    </div>
@endsection
@section('content')
    <div class="row">

       <div class="col-12">
           <div class="card mb-4">
               <div class="card-header">{{ $rows->name }}</div>
               <div class="card-body">
                   <div class="ul-widget__item">
                       <div class="ul-widget__info">
                           <h3 class="ul-widget1__title">{{ __('Nome:') }}</h3>
                           <span class="ul-widget__desc text-mute">{{ $rows->name }}</span>
                       </div>
                   </div>
                   @if($rows->fantasy)
                       <div class="ul-widget__item">
                           <div class="ul-widget__info">
                               <h3 class="ul-widget1__title">{{ __('Nome Fantasia:') }}</h3>
                               <span class="ul-widget__desc text-mute">{{ $rows->fantasy }}</span>
                           </div>
                       </div>
                   @endif
                   <div class="ul-widget__item">
                       <div class="ul-widget__info">
                           <h3 class="ul-widget1__title">{{ __('Email:') }}</h3>
                           <span class="ul-widget__desc text-mute">{{  $rows->email }}</span>
                       </div>
                   </div>
                   <div class="ul-widget__item">
                       <div class="ul-widget__info">
                           <h3 class="ul-widget1__title">{{ __('Telefone:') }}</h3>
                           <span class="ul-widget__desc text-mute">{{ $rows->phone }}</span>
                       </div>
                   </div>
                   <div class="ul-widget__item">
                       <div class="ul-widget__info">
                           <h3 class="ul-widget1__title">{{ __('Documento(CPF ou CNPJ):') }}</h3>
                           <span class="ul-widget__desc text-mute">{{ $rows->document }}</span>
                       </div>
                   </div>
                   <br>
                   @if($rows->address)
                        <div class="ul-widget__item">
                           <div class="ul-widget__info">
                               <h3 class="ul-widget1__title">{{ __('ENDEREÇO:') }}</h3>
                               @if($rows->address->city)
                                   {{ $rows->address->city }},
                               @endif
                               @if($rows->address->state)
                                   {{ $rows->address->state }},
                               @endif
                               @if($rows->address->zip)
                                   {{ $rows->address->zip }},
                               @endif
                               @if($rows->address->street)
                                   {{ $rows->address->street }},
                               @endif
                               @if($rows->address->number)
                                   {{ $rows->address->number }},
                               @endif
                               @if($rows->address->district)
                                   {{ $rows->address->district }},
                               @endif
                               @if($rows->address->complement)
                                   {{ $rows->address->complement }}
                               @endif
                           </div>
                       </div>
                   @endif
                 <br>
                 <br>
                   <div class="card-body">
                       <div class="card-title">{{ __("Prestação de serviço") }}</div>

                       @if($rows->stages)
                           @foreach($rows->stages as $item)
                                   <div class="d-flex flex-column flex-sm-row align-items-sm-center mb-3">
                                       <div class="flex-grow-1">
                                           <h5>{{ $item->stage->name }}</h5>
                                           <p class="m-0 text-small text-muted">{{ __('Data prevista de entrega') }}: {{ date_carbom_format($item->expected_delivery_date)->toLongDateString() }}</p>
                                           <p class="m-0 text-small text-muted">{{ __('Número de peças') }}: {{ $item->number_of_pieces }}</p>
                                           <p class="m-0 text-small text-muted">{{ __('Número de peças estragadas') }}: {{ $item->number_of_damaged_pieces }}</p>
                                           <p class="m-0 text-small text-muted">{{ __('preço por peça') }}: {{ form_read($item->piece_value) }}</p>
                                           <p class="m-0 text-small text-muted">{{ __('Situação') }}: {{ $item->inputStatusMessage($item,$item->order) }}</p>
                                       </div>
                                   </div>
                           @endforeach
                       @endif
                   </div>
               </div>
           </div>
       </div>
    </div>
@endsection

