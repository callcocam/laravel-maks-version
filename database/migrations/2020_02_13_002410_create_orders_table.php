<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->tenant();
            $table->user();
            $table->uuid('responsible_id')->nullable();
            $table->bigInteger('codigo')->nullable()->unique();
            $table->uuid('grid_id')->nullable();
            $table->uuid('fabric_id')->nullable();
            $table->date('date')->nullable();
            $table->string('differentiated')->nullable();
            $table->string('line_color')->nullable();
            $table->string('washed')->nullable();
            $table->text('observation')->nullable();
            $table->text('description')->nullable();
            $table->status();
            $table->timestamps();
            $table->softDeletes();

            $table
                ->foreign("responsible_id")
                ->references('id')
                ->on('users')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table
                ->foreign("grid_id")
                ->references('id')
                ->on('grids')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table
                ->foreign("fabric_id")
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
        Schema::dropIfExists('orders');
    }
}
