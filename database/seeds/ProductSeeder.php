<?php

use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(\App\Product::class, 500)->create()->each(function ($product){

            //$product->file()->save(factory(\App\File::class)->make());

        });
    }
}
