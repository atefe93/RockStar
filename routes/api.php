<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('/login', 'Api\UserController@login');
Route::post('/register', 'Api\UserController@register');


Route::middleware('auth:api')->group(function () {
    Route::get('/user/details', 'Api\UserController@details');
    Route::get('/logout', 'Api\UserController@logout');
    Route::get('/product/View_Menu', 'Api\ProductController@View_Menu');
    Route::get('/product/View_Product_Options/{id}', 'Api\ProductController@View_Product_Options');
    Route::post('/product/store', 'Api\ProductController@store')->middleware('api.admin');
    Route::post('/order/store', 'Api\OrderController@store');
    Route::get('/order/{id}', 'Api\OrderController@show');
    Route::put('/order/{id}', 'Api\OrderController@update');
    Route::delete('/order/{id}', 'Api\OrderController@delete');
    Route::put('/order/change_status/{id}', 'Api\OrderController@change_status')->middleware('api.admin');


});
