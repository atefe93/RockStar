<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */


use App\Product;
use Faker\Generator as Faker;
use Illuminate\Database\Eloquent\Model;

$factory->define(Product::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
        'user_id' => random_int(\DB::table('users')->min('id'), \DB::table('users')->max('id')),
        'option_id' => random_int(0, \DB::table('options')->max('id')),
        'price' => random_int(1000,80000),

    ];
});
