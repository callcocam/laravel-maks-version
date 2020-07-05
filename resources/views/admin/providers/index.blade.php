@extends('layouts.admin')

@section('breadcrumb')
    <div class="breadcrumb">
        <h1>{{ $tenant->name }}</h1>
        <ul>
            <li><a href="{{ route('admin.admin.index', request()->query()) }}">{{ __('Painel') }}</a></li>
            <li>{{ __('Fornecedors') }}</li>
        </ul>
    </div>
@endsection
@section('content')

    @if($rows)
        {!! $rows !!}
    @else
        <div class="row">
            <div class="col-12">
                @include("admin.includes.empty", [
                       'url' =>route('admin.providers.create')
                   ])
            </div>
        </div>

    @endif

@endsection

@include("admin.includes.alert")
