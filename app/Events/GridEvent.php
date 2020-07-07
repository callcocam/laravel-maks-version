<?php
namespace App\Events;

use App\Grid;
use Illuminate\Queue\SerializesModels;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;

class GridEvent
{
  use Dispatchable, InteractsWithSockets, SerializesModels;

    /**
     * @var Grid
     */
    public $grid;

    /**
     * GradEvent constructor.
     * @param Grid $grid
     */
    public function __construct(Grid $grid)
  {
      $this->grid = $grid;
  }
}
