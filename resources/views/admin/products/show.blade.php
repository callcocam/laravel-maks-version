@extends('layouts.admin')

@section('breadcrumb')
    <div class="breadcrumb">
        <h1>{{ $tenant->name }}</h1>
        <ul>
            <li><a href="{{ route('admin.admin.index') }}">{{ __('Painel') }}</a></li>
            <li><a href="{{ route('admin.products.index', request()->query()) }}">{{ __('Produtos') }}</a></li>
            <li>{{ __('Visualizar Produto') }} - {{ $rows->name }}</li>
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
                            <h3 class="ul-widget1__title">{{ __('Referência:') }}</h3>
                            <span class="ul-widget__desc text-mute">{{  $rows->reference }}</span>
                        </div>
                    </div>
                    <div class="ul-widget__item">
                        <div class="ul-widget__info">
                            <h3 class="ul-widget1__title">{{ __('Informações:') }}</h3>
                            <span class="ul-widget__desc text-mute">{{ $rows->information }}</span>
                        </div>
                    </div>
                    <div class="ul-widget__item">
                        <div class="ul-widget__info">
                            <h3 class="ul-widget1__title">{{ __('Detalhes:') }}</h3>
                            <span class="ul-widget__desc text-mute">{{ $rows->details }}</span>
                        </div>
                    </div>
                    <div class="ul-widget__item">
                        <div class="ul-widget__info">
                            <h3 class="ul-widget1__title">{{ __('Descrição:') }}</h3>
                            <span class="ul-widget__desc text-mute">{{ $rows->description }}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

