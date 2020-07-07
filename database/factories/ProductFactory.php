<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Product;
use Faker\Generator as Faker;

$factory->define(Product::class, function (Faker $faker) {

    $name = $faker->text(191);
    return [
        'company_id'=>get_tenant_id(),
        'name'=>$name,
        'reference'=>$faker->uuid,
        'slug'=>\Illuminate\Support\Str::slug($name),
        'information'=>$faker->sentence,
        'details'=>$faker->sentence,
        'description'=>$faker->sentence,
        'status' => (rand(10, 100) / 2) % 2 == 0 ? 'published' : 'draft',
        'created_at' => $faker->dateTimeBetween('-5 month'),
        'updated_at' => $faker->dateTimeBetween('-5 month'),
    ];
});
