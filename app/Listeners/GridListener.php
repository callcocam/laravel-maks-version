<?php

namespace App\Listeners;

use App\Http\Requests\GridStore;

class GridListener
{
    /**
     * @var GridStore
     */
    private $store;

    /**
     * GridListener constructor.
     * @param GridStore $store
     */
    public function __construct(GridStore $store)
    {
        $this->store = $store;
    }

    /**
     * Handle the event.
     *
     * @param  object  $event
     * @return void
     */
    public function handle($event)
    {
        $event = $event->grid;

       
    }
}
