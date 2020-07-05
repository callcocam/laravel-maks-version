<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProvidersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('providers', function (Blueprint $table) {
            $table->id();
            $table->tenant();
            $table->user();
            $table->string('name');
            $table->string('fantasy')->nullable();
            $table->string('slug')->nullable();
            $table->string('email')->unique();
            $table->string('phone', 20)->nullable();
            $table->string('document', 20)->nullable();
            $table->string('ie', 20)->nullable();
            $table->text('description')->nullable();
            $table->status();
            $table->rememberToken();
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
        Schema::dropIfExists('providers');
    }
}
