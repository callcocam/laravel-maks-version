<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('payments', function (Blueprint $table) {
            $table->id();
            $table->tenant();
            $table->user();
            $table->uuid('input_process_step_id')->nullable();
            $table->uuid('provider_id')->nullable();
            $table->date('payment_date')->nullable();
            $table->decimal('price')->nullable();
            $table->text('description')->nullable();
            $table->status();
            $table->timestamps();
            $table->softDeletes();
            $table
                ->foreign("input_process_step_id")
                ->references('id')
                ->on('input_process_steps')
                ->onUpdate('cascade')
                ->onDelete('cascade');
            $table
                ->foreign("provider_id")
                ->references('id')
                ->on('providers')
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
        Schema::dropIfExists('payments');
    }
}
