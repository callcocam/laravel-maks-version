<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInputProcessStepsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('input_process_steps', function (Blueprint $table) {
            $table->id();
            $table->tenant();
            $table->user();
            $table->uuid('stage_id')->nullable();
            $table->uuid('provider_id')->nullable();
            $table->uuid('order_id')->nullable();
            $table->date('date')->nullable();
            $table->integer('number_of_pieces')->nullable();
            $table->date('delivery_date')->nullable();
            $table->date('expected_delivery_date')->nullable();
            $table->integer('number_of_damaged_pieces')->default('0')->nullable();
            $table->decimal('piece_value')->nullable();
            $table->text('description')->nullable();
            $table->status([ 'pause','feedstock','payment']);
            $table->softDeletes();
            $table->timestamps();
            $table
                ->foreign("stage_id")
                ->references('id')
                ->on('stages')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table
                ->foreign("provider_id")
                ->references('id')
                ->on('providers')
                ->onUpdate('cascade')
                ->onDelete('cascade');
            $table
                ->foreign("order_id")
                ->references('id')
                ->on('orders')
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
        Schema::dropIfExists('input_process_steps');
    }
}
