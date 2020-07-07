<?php

use Illuminate\Database\Seeder;

class AviamentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(\App\Aviament::class, 100)->create();
    }
}
