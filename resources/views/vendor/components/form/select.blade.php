<?php
if (!function_exists('attributes')) {
    function attributes($attributes){
        $attrs = [];
        foreach ($attributes as $key => $value){
            $attrs[] = sprintf('%s="%s" ', $key, $value);
        }
        return implode(" ", $attrs);
    }
}

if (!function_exists('value_options')) {
    function value_options($value_options){
        $value_option = [];
        foreach ($value_options as $key => $value){
                $value_option[] = $value;
        }
        return implode(" ", $value_option);
    }
}
if (!function_exists('options')) {
    function options($choices, $selected){
        $options = [];
        $cover="";
        foreach ($choices as $key => $value){
            if(isset($value['cover'])){
                $cover = $value['cover'];
                unset($value['cover']);
            }
            if($selected == $key)
                $options[] = sprintf('<option  data-img-src="%s" value="%s" selected>%s</option>', $cover, $key, value_options($value));
            else
                $options[] = sprintf('<option  data-img-src="%s" value="%s">%s</option>',$cover, $key, value_options( $value));
        }
        return implode(" ", $options);
    }
}
?>
<select name="{{ $name }}" {!! attributes($attributes) !!}>
    {!! options($choices, $selected) !!}
</select>


