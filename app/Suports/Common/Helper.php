<?php

/**
 * Created by Claudio Campos.
 * User: callcocam@gmail.com
 * https://www.sigasmart.com.br
 */

namespace App\Suports\Common;

use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

trait Helper
{

    public $slug_fixed = false;
    public $floats = ['price'];

    protected function slug(&$input)
    {

        if (!$this->slug_fixed) {

            if (isset($input[Options::DEFAULT_COLUMN_SLUG_ORIGEM])) {

                $input[Options::DEFAULT_COLUMN_SLUG] = Str::slug($input[Options::DEFAULT_COLUMN_SLUG_ORIGEM]);
            }
        }

        return $input;
    }

    protected function convert_date(&$input)
    {
        if (isset($input['date'])) {

            $input['date'] = date_carbom_format($input['date'])->format('Y-m-d');
        }
        if (!isset($input['id'])) {

            $input['created_at'] = date("Y-m-d H:i:s");
            $input['updated_at'] = date("Y-m-d H:i:s");
        } else {
            unset($input['created_at']);
            $input['updated_at'] = date("Y-m-d H:i:s");
        }

        return $input;
    }

    protected function convert_password(&$input)
    {

        if (isset($input['password']) && !empty($input['password'])) {

            $input['password'] = Hash::make($input['password']);

            return $input;
        }

        unset($input['password']);

        return $input;
    }

    protected function initCover(&$input)
    {

        if (!isset($input[Options::DEFAULT_COLUMN_COVER])) {

            return $input;
        }
        if (!request()->hasFile(Options::DEFAULT_COLUMN_COVER) && !request()->file(Options::DEFAULT_COLUMN_COVER)->isValid()) {

            return $input;
        }
        $image = $input[Options::DEFAULT_COLUMN_COVER];

        return $this->initFile($input, $image);
    }

    protected function initAvatar(&$input)
    {

        if (!isset($input[Options::DEFAULT_COLUMN_AVATAR])) {

            return $input;
        }

        if (!request()->hasFile(Options::DEFAULT_COLUMN_AVATAR) && !request()->file(Options::DEFAULT_COLUMN_AVATAR)->isValid()) {

            return $input;
        }
        $image = $input[Options::DEFAULT_COLUMN_AVATAR];

        return $this->initFile($input, $image);
    }

    protected function initFiles(&$input)
    {

        if (!isset($input[Options::DEFAULT_COLUMN_FILE])) {

            return $input;
        }

        if (is_array($input[Options::DEFAULT_COLUMN_FILE])) {
            $files = $input[Options::DEFAULT_COLUMN_FILE];

            foreach ($files as $file) {

                $this->initFile($input, $file, true);
            }
            unset($input[Options::DEFAULT_COLUMN_FILE]);

            return $input;
        }
        if (!request()->hasFile(Options::DEFAULT_COLUMN_FILE) && !request()->file(Options::DEFAULT_COLUMN_FILE)->isValid()) {

            return $input;
        }
        $image = $input[Options::DEFAULT_COLUMN_FILE];

        return $this->initFile($input, $image);
    }

    protected function initFile(&$input, UploadedFile  $image, $ignore = false)
    {


        array_push($this->fillable, 'company_id', 'uuid');

        $date = Str::slug(date("Y|m"));

        $extension = $image->clientExtension();

        $original = explode('.', $image->getClientOriginalName());

        $name = sprintf("%s-%s-%s.%s", rand(), time(), Str::slug(reset($original)), $extension);

        $result = $image->storePubliclyAs(sprintf("%s/%s", $this->getTable(), $date), $name);

        $data = [
            'company_id' => get_tenant_id(),
            'name' => $name,
            'fullPath' => sprintf("storage/%s", $result),
            'dir' => '/dist/upload/images',
            'fileType' => $image->getMimeType(),
            'ext' => $image->getExtension(),
            'size' => $image->getSize()
        ];

        /**
         * @var $fileExist MorphOne
         */
        $fileExist = $this->model->file();

        if ($ignore) {
            $fileExist->create($data);
        } else {
            if ($fileExist->first()) :
                $fileExist->update($data);
            else :
                $fileExist->create($data);
            endif;
        }

        return $input;
    }

    protected function initTags(&$input)
    {
        if (!isset($input['tag'])) {

            return $input;
        }

        //REMOVE TODAS AS TAGS
        $this->model->untag();
        //CADASTARS AS NOVAS
        $this->model->tag($input['tag']);

        return $input;
    }


    protected function initMenuss(&$input)
    {
        if (!isset($input['submenus'])) {

            return $input;
        }

        //ADD PERMISSIONS
        $this->model->submenus()->sync($input['submenus']);

        return $input;
    }

    protected function initPermissions(&$input)
    {
        if (!isset($input['privilege'])) {

            return $input;
        }

        //ADD PERMISSIONS
        $this->model->permissions()->sync($input['privilege']);

        return $input;
    }

    protected function initRoles(&$input)
    {
        if (!isset($input['role'])) {

            return $input;
        }
        //REMOVE TODAS AS TAGS
        $this->model->roles()->sync($input['role']);

        return $input;
    }

    protected function initTasks(&$input)
    {


        $data = $input;

        unset($data['id']);

        foreach ($data as $key => $value) {

            if (Str::contains($key, "tasks")) {

                $task = array_filter($value);

                if ($task) :
                    array_push($this->fillable, 'company_id', 'uuid');
                    /**
                     * @var $fileExist MorphOne
                     */
                    $tasksExist = $this->model->tasks();

                    if ($current = $tasksExist->where('name', $task['name'])->first()) :
                        $tasksExist->update(array_merge($current->toArray(), $task));
                    else :
                        $tasksExist->create($task);
                    endif;
                endif;
            }
        }


        return $input;
    }
    protected function initCategorizable(&$input)
    {
        if (!isset($input['category'])) {

            return $input;
        }

        if (isset($input['id'])) {

            //UPDATE AT CATEGORIA
            $this->model->recategorize($input['category']);

            return $input;
        }

        //CADASTARS AS NOVAS
        $this->model->categorize($input['category']);

        return $input;
    }
    protected function initVideozable(&$input)
    {
        if (!isset($input['video'])) {

            return $input;
        }

        if (isset($input['id'])) {

            //UPDATE AT VIDEO
            $this->model->revideoze($input['video']);

            return $input;
        }

        //CADASTARS AS NOVOS
        $this->model->videoze($input['video']);

        return $input;
    }

    protected function initAddress(&$input)
    {

        if (!isset($input['address'])) {

            return $input;
        }

        $data = $input;

        unset($data['id']);

        array_push($this->fillable, 'company_id', 'uuid');
        /**
         * @var $fileExist MorphOne
         */
        $addressExist = $this->model->address();

        $data = $input['address'];

        if ($addressExist->first()) :
            $current = $addressExist->first()->toArray();
            $addressExist->update(array_merge($current, $data));
        else :
            $addressExist->create($data);
        endif;

        return $input;
    }


    public function initArray(&$input)
    {

        if ($input) :

            foreach ($input as $key => $value) :

                if (is_array($value)) :

                    if (in_array($key, ['tag'])) :

                    //$input[$key] = json_encode($value);

                    endif;

                endif;

            endforeach;

        endif;

        return $input;
    }

    public function initCod(&$input)
    {

        if (!array_key_exists('codigo', $input)) :

            return $input;

        endif;
        if (empty($input['codigo'])) :
            $cod =  static::withTrashed()->max('codigo');
            if (!$cod) {

                $cod = 0;
            }
            $input['codigo'] = ($cod += 1);
        endif;
        return $input;
    }


    public function initFloat(&$input)
    {

        if ($this->floats) :

            foreach ($this->floats as  $value) {
                if (array_key_exists($value, $input)) :

                    $input[$value] = form_w($input[$value]);

                endif;
            }

        endif;

        return $input;
    }


    protected $titile = 'Lista de Company';

    protected $messages =  'Operação finalizada com sucesso!!';

    /**
     * @return array
     */
    public function getMessage(): string
    {
        return $this->messages;
    }
}
