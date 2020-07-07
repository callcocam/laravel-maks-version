<?php $emptyVal = $options['empty_value'] ? ['' => [$options['empty_value']]] : null; ?>
{!! Form::bsChosen($name, (array)$emptyVal + $options['choices'], $options['selected'], $options['attr']) !!}
