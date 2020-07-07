<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use Faker\Generator as Faker;

$factory->define(\App\Fabric::class, function (Faker $faker) {
    $name = $faker->word;
    return [
        'name'=>$name,
        'slug'=>\Illuminate\Support\Str::slug($name),
        'assets'=>"fabrics",
        'reference'=>$faker->uuid,
        'metreage'=>$faker->numberBetween(10, 2000),
        'amount'=>$faker->numberBetween(10, 2000),
        'width'=>$faker->numberBetween(10, 2000),
        'price'=>$faker->numberBetween(10, 2000),
        'minimum_quantity'=>$faker->numberBetween(10, 100),
        'status' => (rand(10, 100) / 2) % 2 == 0 ? 'published' : 'draft',
        'description'=>$faker->sentence,
        'created_at' => $faker->dateTimeBetween('-5 month'),
        'updated_at' => $faker->dateTimeBetween('-5 month'),
    ];
});
