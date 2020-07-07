@if ($showLabel && $showField)
    @if ($options['wrapper'] !== false)
        <div {!! $options['wrapperAttrs'] !!} >
            @endif
            @endif

            @if ($showLabel && $options['label'] !== false && $options['label_show'])
                {!! Form::customLabel(__($name), __($options['label']), $options['label_attr']) !!}
            @endif
            @if ($showField)
            
                @isset ($options['items'])
                
               {!! $options['items'] !!}
                
                @endif
            
            @endif
            @if ($showLabel && $showField)
                @if ($options['wrapper'] !== false)
        </div>
    @endif
@endif
