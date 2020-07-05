<?php


namespace App\Forms\Fields;


use Kris\LaravelFormBuilder\Fields\ChoiceType;

class StokeType extends ChoiceType
{
    /**
     * @var string
     */
    protected $choiceType = 'stoke-select';
    /**
     * Get the template, can be config variable or view path.
     *
     * @return string
     */
    protected function getTemplate()
    {
        return 'laravel-form-builder::stoke';
    }

    /**
     * @inheritdoc
     */
    protected function createChildren()
    {
        if ($this->getOption('choices')) {
            return parent::createChildren();
        }

        $entity = $this->getOption('class');
        $queryBuilder = $this->getOption('query_builder');
        $key = $this->getOption('property_key');
        $value = explode(",",$this->getOption('property'));

        if (!$entity || !class_exists($entity)) {
            throw new \InvalidArgumentException(sprintf(
                'Please provide valid "class" option for entity field [%s] in form class [%s]',
                $this->getRealName(),
                get_class($this->parent)
            ));
        }

        $entity = new $entity();

        if ($key === null) {
            $key = $entity->getKeyName();
        }

        $data = $entity->get();



        $parts = [];
        foreach ($data as $items) {
            $items->append('cover');
            $part = [];
            foreach ($value as $item) {

                $part[$item] = $items->__get($item);

            }
            $parts[$items->__get($key)] = $part;
        }

        $data = $parts;

        $this->options['choices'] = $data;

        return parent::createChildren();
    }
}
