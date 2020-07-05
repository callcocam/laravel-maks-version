@extends('layouts.admin')

@section('breadcrumb')
    <div class="breadcrumb">
        <h1>{{ $tenant->name }}</h1>
        <ul>
            <li><a href="{{ route('admin.admin.index') }}">{{ __('Painel') }}</a></li>
            <li><a href="{{ route('admin.roles.index', request()->query()) }}">{{ __('Usuário') }}</a></li>
            <li>{{ __('Excluir Usuário') }} - {{ $rows->name }}</li>
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
                </div>
            </div>
        </div>
    </div>
@endsection
