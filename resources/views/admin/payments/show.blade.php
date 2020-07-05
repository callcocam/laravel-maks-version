@extends('layouts.admin')

@section('breadcrumb')
    <div class="breadcrumb">
        <h1>{{ $tenant->name }}</h1>
        <ul>
            <li><a href="{{ route('admin.admin.index') }}">{{ __('Painel') }}</a></li>
            <li><a href="{{ route('admin.payments.index', request()->query()) }}">{{ __('Pagamento') }}</a></li>
            <li>{{ __('Visualizar') }} - {{ $rows->name }}</li>
        </ul>
    </div>
@endsection

@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card mb-4">
                <div class="card-header">{{ $rows->provider->name }}</div>
                <div class="card-body">
                    <div class="ul-widget__item">
                        <div class="ul-widget__info">
                            <h3 class="ul-widget1__title">{{ __('Data do pagamento:') }}</h3>
                            <span class="ul-widget__desc text-mute">{{ date_carbom_format($rows->payment_date)->toLongDateString() }}</span>
                        </div>
                    </div>
                    <div class="ul-widget__item">
                        <div class="ul-widget__info">
                            <h3 class="ul-widget1__title">{{ __('Valor:') }}</h3>
                            <span class="ul-widget__desc text-mute">{{  form_read($rows->price) }}</span>
                        </div>
                    </div>
                    <div class="ul-widget__item">
                        <div class="ul-widget2__info">
                            <h3 class="ul-widget1__title">{{ __('Situação:') }}</h3>
                            <span class="ul-widget__desc text-mute text-{{ check_status($rows->status) }}">{{ check_status_text($rows->status,[
        'published'=>"Pago", 'draft'=>"Não pago", 'deleted'=>"Cancelado"
    ]) }}</span>
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
