@if ($options['wrapper'] !== false)
    <div {!! $options['wrapperAttrs'] !!}>
        @endif
        {!! Form::button(__($options['label']), $options['attr']) !!}
        @include('laravel-form-builder::help_block')

        @if ($options['wrapper'] !== false)
    </div>
@endif
