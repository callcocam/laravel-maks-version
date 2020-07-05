<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGridNumberTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('grid_number', function (Blueprint $table) {
            $table->uuid('grid_id')->index();
            $table->foreign('grid_id')->references('id')->on('grids')->onDelete('cascade');
            $table->uuid('number_id')->index();
            $table->foreign('number_id')->references('id')->on('numbers')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('grid_numbers');
    }
}
