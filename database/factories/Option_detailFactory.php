<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Model;
use App\Option_detail;
use Faker\Generator as Faker;

$factory->define(Option_detail::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
        'option_id' => random_int(0, \DB::table('options')->max('id')),
    ];
});
