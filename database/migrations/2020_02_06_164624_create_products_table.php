<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void'
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->tenant();
            $table->user();
            $table->string('name');
            $table->string('reference')->nullable();
            $table->string('slug')->nullable();
            $table->integer('stoke')->nullable();
            $table->text('information')->nullable();
            $table->text('details')->nullable();
            $table->text('description')->nullable();
            $table->status();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
