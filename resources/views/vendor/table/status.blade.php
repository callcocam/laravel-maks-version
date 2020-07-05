@isset($options)
    <span class="status text-{{check_status($context)}}">&bull;</span>{{check_status_text($context,$options)}}
@else
    <span class="status text-{{check_status($context)}}">&bull;</span>{{check_status_text($context)}}
@endisset