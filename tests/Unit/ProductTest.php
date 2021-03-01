<?php

namespace Tests\Unit;

use App\Option;
use App\Option_detail;
use App\Order_detail;
use App\Product;
use App\User;
use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class ProductTest extends TestCase
{
    /**
     * A basic unit test example.
     *
     * @return void
     */
    public function  testProductCreatedSuccessfully()
    {
        $user = factory(User::class)->create();
        $user->role_id=2;
        $user->update();
        $this->actingAs($user, 'api');
        $product=[
            "name" => "Latte",
            "user_id" => "$user->id",
            "price" =>"9000",
            "option_id" =>"1"
        ];
        $this->json('POST', 'api/product/store', $product, ['Accept' => 'application/json'])
            ->assertStatus(201)
            ->assertJson([
                "product" => [
                    "name" => "Latte",
                    "price" =>"9000",
                    "option_id" =>"1"
                ],
                "success" => "true"
            ]);
    }
    public function  testProductWithKindCreatedSuccessfully()
    {
        $user = factory(User::class)->create();
        $user->role_id=2;
        $user->update();
        $this->actingAs($user, 'api');
        $product=[
            "name" => "Kooki",
            "user_id" => "$user->id",
            "price" =>"6000",
            "option_id" =>"4",
            "kinds"=>array(0=>array("name"=>"chocolate chip"),1=>array("name"=>"ginger")),


        ];

        $this->json('POST', 'api/product/store',$product, ['Accept' => 'application/json'])
            ->assertStatus(201)
            ->assertJson([
                "product" => [
                    "name" => "Kooki",
                    "user_id" => "$user->id",
                    "price" =>"6000",
                    "option_id" =>"4"
                ],
                "success" => "true"
            ]);
    }
    public function  testProductWithoutOptionCreatedSuccessfully()
    {
        $user = factory(User::class)->create();
        $user->role_id=2;
        $user->update();
        $this->actingAs($user, 'api');
        $product=[
            "name" => "Tea",
            "user_id" => "$user->id",
            "price" =>"2000",

        ];
        $this->json('POST', 'api/product/store', $product, ['Accept' => 'application/json'])
            ->assertStatus(201)
            ->assertJson([
                "product" => [
                    "name" => "Tea",
                    "price" =>"2000",

                ],
                "success" => "true"
            ]);
    }
    public function testViewProductOptionsSuccessfully(){

        $user = factory(User::class)->create();
        $this->actingAs($user, 'api');
        $option=factory(Option::class)->create([
            "name" => "Milk",
            "user_id" =>$user->id
        ]);
        factory(Option_detail::class)->create([
            "name" => "skim",
            "option_id" =>$option->id
        ]);
        factory(Option_detail::class)->create([
            "name" => "semi",
            "option_id" =>$option->id
        ]);
        factory(Option_detail::class)->create([
            "name" => "whole",
            "option_id" =>$option->id
        ]);
         $product=factory(Product::class)->create([
            "name" => "Latte",
            "user_id" => "$user->id",
            "price" =>"9000",
            "option_id" =>$option->id
        ]);


        $this->json('GET', 'api/product/View_Product_Options/' . $product->id, [], ['Accept' => 'application/json'])
            ->assertStatus(200)
            ->assertJson([
                "product" => [
                    "name" => "Latte",
                    "price" =>"9000",
                    "option_id" =>"1",
                    "option"=>[
                        "name" => "Milk",
                        "option_details"=>[
                            [
                                "name" => "skim",
                                "option_id" =>$option->id

                            ],
                            [
                                "name" => "semi",
                                "option_id" =>$option->id
                            ],
                            [
                                "name" => "whole",
                                "option_id" =>$option->id
                            ]

                        ]
                    ]
                ],
                "success" => true,
            ]);

    }
    public function testView_MenuSuccessfully(){
        $user = factory(User::class)->create();
        $this->actingAs($user, 'api');

        factory(Product::class)->create([
            "name" => "Latte",
            "user_id" => "$user->id",
            "price" =>"9000",
            "option_id" =>1
        ]);
        factory(Product::class)->create([
            "name" => "Cappuccino",
            "user_id" => "$user->id",
            "price" =>"8000",
            "option_id" =>2
        ]);

        $this->json('GET', 'api/product/View_Menu', ['Accept' => 'application/json'])
            ->assertStatus(200)
            ->assertJson([
                "product" =>[
                    [
                        "name" => "Latte",
                        "price" =>"9000",
                        "option_id" =>"1"
                    ],
                    [
                        "name" => "Cappuccino",
                        "price" =>"8000",
                        "option_id" =>2
                    ],
                ] ,"success" => true,


            ]);

    }
}
