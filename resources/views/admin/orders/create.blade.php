@extends('layouts.admin')
@section('breadcrumb')
    <div class="breadcrumb">
        <h1>{{ $tenant->name }}</h1>
        <ul>
            <li><a href="{{ route('admin.admin.index') }}">{{ __('Painel') }}</a></li>
            <li><a href="{{ route('admin.orders.index', request()->query()) }}">{{ __('Ordems De Serviço') }}</a></li>
            <li>{{ __('Cadastrar') }}</li>
        </ul>
    </div>
@endsection
@section('content')
<div class="row mb-5">
    <div class="col-md-12">
        {!! form_start($form) !!}
        <div class="row">
            <div class="col-md-12">
                <label class="d-block text-12 text-muted">{{ __('Produto') }}</label>
                    <div class="pr-0 mb-1">
                        {!! form_row($form->product_id) !!}
                    </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-7">
                <label class="d-block text-12 text-muted">{{ __('Responsavel') }}</label>
                    <div class="pr-0 mb-1">
                        {!! form_row($form->responsible_id) !!}
                    </div>
            </div>
            <div class="col-md-2">
                <label class="d-block text-12 text-muted">{{ __('Referência') }}</label>
                <div class="pr-0 mb-1">
                    {!! form_row($form->codigo) !!}
                </div>
           </div>
            <div class="col-md-3">
                <label class="d-block text-12 text-muted">{{ __('Data') }}</label>
                <div class="pr-0 mb-1">
                 {!! form_row($form->date) !!}
                </div>
           </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <label class="d-block text-12 text-muted">{{ __('Diferenciado') }}</label>
                <div class="pr-0 mb-1">
                 {!! form_row($form->differentiated) !!}
                </div>
            </div>
            <div class="col-md-4">
                <label class="d-block text-12 text-muted">{{ __('Cor Da Linha') }}</label>
                <div class="pr-0 mb-1">
                 {!! form_row($form->line_color) !!}
                </div>
           </div>
           <div class="col-md-4">
            <label class="d-block text-12 text-muted">{{ __('Lavado') }}</label>
            <div class="pr-0 mb-1">
             {!! form_row($form->washed) !!}
            </div>
       </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <label class="d-block text-12 text-muted">{{ __('Observações') }}</label>
                <div class="pr-0 mb-1">
                 {!! form_row($form->observation) !!}
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <label class="d-block text-12 text-muted">{{ __('Descrição') }}</label>
                <div class="pr-0 mb-1">
                 {!! form_row($form->description) !!}
                </div>
            </div>
        </div>

         {!! form_end($form) !!}
    </div>
</div>
@endsection


@push("styles")
    <link rel="stylesheet" href="{{ asset('_dist/admin/js/plugins/bootstrap-4-chosen/component-chosen.min.css') }}">
    <link rel="stylesheet" href="{{ asset('_dist/admin/js/plugins/Image-Select-master/src/ImageSelect.css') }}">
@endpush
@push("scripts")
    <script src="{{ asset('_dist/admin/js/plugins/chosen.jquery.js') }}" type="text/javascript"></script>
    <script src="{{ asset('_dist/admin/js/plugins/Image-Select-master/src/ImageSelect.jquery.js') }}" type="text/javascript"></script>
    <script>
        $(function () {

            $('select.form-control-chosen').chosen({
                allow_single_deselect: true,
                width: '100%'
            });
        })
    </script>
@endpush
