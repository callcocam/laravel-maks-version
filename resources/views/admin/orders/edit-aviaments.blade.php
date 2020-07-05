@extends('layouts.admin')
@section('breadcrumb')
    <div class="breadcrumb">
        <h1>{{ $tenant->name }}</h1>
        <ul>
            <li><a href="{{ route('admin.admin.index') }}">{{ __('Painel') }}</a></li>
            <li><a href="{{ route('admin.orders.index', request()->query()) }}">{{ __('Ordem De Serviço') }}</a></li>
            <li>{{ str_pad($rows->codigo, 5, '0', STR_PAD_LEFT) }}</li>
        </ul>
    </div>
@endsection
@section('content')
    <div class="row mb-5">
        <div class="col-md-12">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item"><a class="nav-link" id="home-basic-tab" data-toggle="link" href="{{ route('admin.orders.edit',$rows->id) }}" role="tab" aria-controls="homeBasic" aria-selected="true">Home</a></li>
                <li class="nav-item"><a class="nav-link" id="profile-basic-tab" data-toggle="link" href="{{ route('admin.orders-grids.edit',$rows->id) }}" role="tab" aria-controls="profileBasic" aria-selected="false">Grades</a></li>
                <li class="nav-item"><a class="nav-link" id="contact-basic-tab" data-toggle="link" href="{{ route('admin.orders-fabrics.edit',$rows->id) }}" role="tab" aria-controls="contactBasic" aria-selected="false">Tecido</a></li>
                <li class="nav-item"><a class="nav-link active" id="contact-basic-tab" data-toggle="link" href="{{ route('admin.orders-aviaments.edit',$rows->id) }}" role="tab" aria-controls="contactBasic" aria-selected="false">Aviamento</a></li>
            </ul>

            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="grids" role="tabpanel" aria-labelledby="profile-basic-tab">
                    {!! form_start($form) !!}
                    <div class="row">
                        <div class="col-md-9">
                            {!! form_row($form->aviament->parent) !!}
                        </div>
                        <div class="col-md-3">
                            {!! form_row($form->aviament->submit) !!}
                        </div>
                        <div class="col-md-12">
                            {!! form_row($form->aviaments) !!}
                        </div>
                    </div>
                    {!! form_end($form) !!}
                </div>
            </div>

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

            $('.delete').click(function () {
                return confirm("Confirmar a operação!");
            })
        })
    </script>
@endpush
