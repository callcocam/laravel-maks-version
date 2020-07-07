<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGridOrderItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('grid_order_items', function (Blueprint $table) {
            $table->id();
            $table->tenant();
            $table->user();
            $table->uuid('order_id')->nullable();
            $table->uuid('grid_id')->nullable();
            $table->decimal('amount')->nullable();
            $table->text('description')->nullable();
            $table->status();
            $table->timestamps();
            $table->softDeletes();
            $table
                ->foreign("order_id")
                ->references('id')
                ->on('orders')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table
                ->foreign("grid_id")
                ->references('id')
                ->on('grids')
                ->onUpdate('cascade')
                ->onDelete('cascade');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('grid_order_items');
    }
}
