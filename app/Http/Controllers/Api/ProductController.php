<?php

namespace App\Http\Controllers\Api;

use App\Kind;
use App\Product;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ProductController extends Controller
{
    public function store(Request $request)
    {

        $this->validate($request, [

            'name' => 'required|unique:products',
            'price' => 'required|integer'
        ]);

        if ($request->option_id==4){

            $this->validate($request, [

                'kinds' => 'required',

            ]);
        }

        $product = new Product();
        $product->name = $request->name;
        $product->price = $request->price;
        $product->user_id = auth()->user()->id;
        if($request->option_id){
            $product->option_id = $request->option_id;
        }


        if ($temp=auth()->user()->products()->save($product)){

            if ($request->option_id==4){

                $kinds=$request->kinds;

                foreach ($kinds as $kind){

                    $kind['product_id']=$temp->id;
                    Kind::create($kind);

                }
            }

            return response()->json([

                'product' => $product->toArray(),
                'success' => true
            ],201);
        }
        else
            return response()->json([
                'success' => false,
                'message' => 'Product could not be added'
            ], 500);
    }

    public function View_Menu(){

            $products=Product::all();
            return response()->json([
                'success' => true,
                'product' => $products
            ],200);

    }
    public function View_Product_Options($id){

        $product = Product::find($id);

        if (!$product) {
            return response()->json([
                'success' => false,
                'message' => 'Product with id ' . $id . ' not found'
            ], 400);
        }
        $product['option']=$product->option;
        if($product->option_id==4){
            $product->kinds;
        }
        elseif ($product->option_id!=0){
            $product->option->option_details;
        }




        return response()->json([
            'success' => true,
            'product' => $product->toArray()
        ], 200);

    }


}
