@extends('layouts.admin')
@section('breadcrumb')
    <div class="breadcrumb">
        <h1>{{ $tenant->name }}</h1>
        <ul>
            <li><a href="{{ route('admin.admin.index') }}">{{ __('Painel') }}</a></li>
            <li><a href="{{ route('admin.orders.show', request()->query()) }}">{{ __('Ordem De Serviço') }}</a></li>
            <li>{{ $rows->stage->name }}</li>
        </ul>
    </div>
@endsection
@section('content')
    <div class="row mb-5">
        <div class="col-md-12">
             {!! form($form) !!}
        </div>
    </div>

@endsection


