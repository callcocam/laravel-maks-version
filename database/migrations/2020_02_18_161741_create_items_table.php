<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('items', function (Blueprint $table) {
            $table->id();
            $table->tenant();
            $table->user();
            $table->uuid('order_id')->nullable();
            $table->uuid('fabric_id')->nullable();
            $table->uuid('aviament_id')->nullable();
            $table->string('assets')->default('fabrics')->nullable();
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
                ->foreign("fabric_id")
                ->references('id')
                ->on('stocks')
                ->onUpdate('cascade')
                ->onDelete('cascade');
           
                $table
                ->foreign("aviament_id")
                ->references('id')
                ->on('stocks')
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
        Schema::dropIfExists('items');
    }
}
