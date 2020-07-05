<?php


namespace App\Processors;


use Illuminate\Support\Str;

class AvatarProcessor
{
    public static function get($model)
    {
        $file = $model->file()->first();

        if (is_null($file)) {
            return asset('storage/default/no-image-available-grid.png');
        }

        return $file->fullPath;
    }
}
