<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStocksTable extends Migration
{
    /**
     * Run the migrations.
     *Referência   digitável - ex 1232
    nome
    Descrição
    Quantidade
    Largura
    Metragem
    Valor
    quantidade mínima - estoque - aviso de falta de produto.
    Foto

     * @return void
     */
    public function up()
    {
        Schema::create('stocks', function (Blueprint $table) {
            $table->id();
            $table->tenant();
            $table->user();
            $table->string('assets',50)->nullable()->default('fabrics');
            $table->string('name',255);
            $table->string('slug',255)->nullable();
            $table->string('reference')->nullable();
            $table->string('metreage')->nullable();
            $table->string('amount')->nullable();
            $table->string('width')->nullable();
            $table->string('price')->nullable();
            $table->string('minimum_quantity')->nullable();
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
        Schema::dropIfExists('stocks');
    }
}
