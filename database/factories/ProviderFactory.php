<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */


use Faker\Generator as Faker;

$factory->define(\App\Provider::class, function (Faker $faker) {
    $name = $faker->name;
    return [
        'name' => $name,
        'fantasy' => $name,
        'slug' => \Illuminate\Support\Str::slug($name),
        'email' => sprintf("%s@%s", \Illuminate\Support\Str::slug($name),request()->getHost()),
        'phone' => $faker->phoneNumber,
        'document' => preg_replace("/\D+/", "", $faker->phoneNumber),
        'ie' => preg_replace("/\D+/", "", $faker->phoneNumber),
        'description' => $faker->sentence,
        'status' => (rand(10, 100) / 2) % 2 == 0 ? 'published' : 'draft',
        'created_at' => $faker->dateTimeBetween('-5 month'),
        'updated_at' => $faker->dateTimeBetween('-5 month'),
    ];
});
