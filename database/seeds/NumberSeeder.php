<?php

use Illuminate\Database\Seeder;

class NumberSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for ($i=6; $i<= 56; $i++){
            factory(\App\Number::class)->create([
                'name'=>str_pad($i, 2, '0', STR_PAD_LEFT),
                'slug'=>str_pad($i, 2, '0', STR_PAD_LEFT),
            ]);

        }
    }
}
