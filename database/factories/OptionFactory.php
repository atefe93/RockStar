<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Model;
use App\Option;
use Faker\Generator as Faker;

$factory->define(Option::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
        'user_id' => random_int(\DB::table('users')->min('id'), \DB::table('users')->max('id')),
    ];
});
