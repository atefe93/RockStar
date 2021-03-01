<?php

namespace App\Http\Controllers\Api;

use App\Kind;
use App\Option_detail;
use App\Order;
use App\Order_detail;
use App\Product;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;

class OrderController extends Controller
{
    public function store(Request $request){

        $this->validate($request, [

            'order_details.*.product_id' => 'required',
            'order_details.*.location_id' => 'required',
            'order_details.*.count' => 'required',
            'order_details.*.kindOrdetail_id' => 'required',


        ]);
        $order =Order::create([
            'user_id' => auth()->user()->id,
            'status_id' =>1

        ]);
        $details=$request->order_details;


        $sum=0;

        foreach ($details as $detail){


            $product=Product::find($detail['product_id']);

            $price=$product->price*$detail['count'];
            $sum+=$price;

            $order_detail = Order_detail::create([
                'order_id' => $order->id,
                'product_id' => $detail['product_id'],
                'location_id'=> $detail['location_id'],
                'count'=>$detail['count'],
                'price'=>$price,
                'kindOrdetail_id'=>$detail['kindOrdetail_id']

            ]);
            if (!$order_detail) {
                return response()->json([
                    'success' => false,
                    'message' => 'order_detail could not be added'
                ], 500);
            }

        }
        $order->totalPrice=$sum;
        $order->update();
        $order['status']=$order->status->name;
        return response()->json([
            'success' => true,
            'order' => $order->toArray(),
        ],201);



    }
    public function show($id){

        $order = auth()->user()->orders()->find($id);
        if (!$order) {
            return response()->json([
                'success' => false,
                'message' => 'Order with id ' . $id . ' not found'
            ], 400);
        }
        $order['username'] =auth()->user()->name;
        $order['status'] =$order->status->name;

        foreach ($order->order_details as $detail){

            $product=Product::find($detail->product_id);
            $detail['name']=$product->name;
            if ($product->option_id==4 && $detail->kindOrdetail_id!=0){
                $det=Kind::find($detail->kindOrdetail_id)->name;
            }
            elseif ($product->option_id!=0 && $detail->kindOrdetail_id!=0){
                $det = Option_detail::find($detail->kindOrdetail_id)->name;

            }else{
                $det =0;
            }

            if ($product->option_id!=0){
                $detail['option']=$product->option->name.' : '.$det ;
            }

            $detail['location']=$detail->location->name;



        }

        return response()->json([
            'success' => true,
            'data' => $order->toArray(),
        ]);

    }
    public function update(Request $request, $id){

        $order = auth()->user()->orders()->find($id);
        if (!$order) {
            return response()->json([
                'success' => false,
                'message' => 'Order with id ' . $id . ' not found'
            ], 400);
        }
        if ($order->status_id==1){


            $details=$request->order_details;
             $i=0;
            foreach ($details as $detail){
                if (key_exists('id', $detail)) {

                    $order_det = $order->Order_details()->find($detail['id']);
                    if (key_exists('delete',$detail)&& $detail['delete']) {
                        $order_det->delete();
                    }
                    else{
                       if (key_exists('product_id', $detail)) {
                        if ($detail['product_id'] != null) {

                            $product = Product::find($detail['product_id']);

                            if (!key_exists('kindOrdetail_id', $detail) or $detail['kindOrdetail_id'] == null) {
                                return response()->json([
                                    'success' => false,
                                    'message' => 'please inter kindOrdetail_id'
                                ]);

                            }

                            if (key_exists('count', $detail)) {
                                if ($detail['count'] != null) {
                                    $detail['price'] = $product->price * $detail['count'];
                                } else {
                                    return response()->json([
                                        'success' => false,
                                        'message' => 'please inter count'
                                    ]);
                                }
                            } else {
                                $detail['price'] = $product->price * $order_det->count;
                            }

                        } else {
                            return response()->json([
                                'success' => false,
                                'message' => 'please inter product_id'
                            ]);
                        }


                    }
                       elseif (key_exists('count', $detail)) {
                        if ($detail['count'] != null) {
                            $detail['price'] = $order_det->product->price * $detail['count'];
                        }
                        else {
                            return response()->json([
                                'success' => false,
                                'message' => 'please inter count'
                            ]);
                        }
                    }

                        $updated = $order_det->update($detail);
                    }

                }

            else {
                    $this->validate($request, [

                        'order_details.' . $i . '.product_id' => 'required',
                        'order_details.' . $i . '.location_id' => 'required',
                        'order_details.' . $i . '.count' => 'required',
                        'order_details.' . $i . '.kindOrdetail_id' => 'required',

                    ]);
                    $product = Product::find($detail['product_id']);

                    $price = $product->price * $detail['count'];


                    $order_detail = Order_detail::create([
                        'order_id' => $order->id,
                        'product_id' => $detail['product_id'],
                        'location_id' => $detail['location_id'],
                        'count' => $detail['count'],
                        'price' => $price,
                        'kindOrdetail_id' => $detail['kindOrdetail_id']

                    ]);
                    if (!$order_detail) {
                        return response()->json([
                            'success' => false,
                            'message' => 'order_detail could not be added'
                        ], 500);
                    }
                }
             $i++;
            }
            $sum=0;
            foreach ($order->order_details as $det){
                $sum+=$det->price;
            }
            $order->totalPrice=$sum;
            $order->update();
            $order['status']=$order->status->name;
            return response()->json([
                'success' => true,
                'order' => $order->toArray(),
            ]);


        }
        else{
            return response()->json([
                'success' => false,
                'message' => 'This order is in ' . $order->status->name . '. It is not possible to change'
            ]);

        }

    }
    public function delete($id)
    {
        $order = auth()->user()->orders()->find($id);

        if (!$order) {
            return response()->json([
                'success' => false,
                'message' => 'Order with id ' . $id . ' not found'
            ], 400);
        }
        if ($order->status_id==1){


            if ($order->delete() && $order->order_details()->delete()) {
                return response()->json([
                    'success' => true,
                    'message' => 'Your order has been canceled'
                ]);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Order could not be deleted'
                ], 500);
            }

        }
        else{
            return response()->json([
                'success' => false,
                'message' => 'This order is in ' . $order->status->name . '. It is not possible to cancel'
            ]);

        }



    }
    public function change_status(Request $request, $id){

        $order=Order::find($id);
        if (!$order) {
            return response()->json([
                'success' => false,
                'message' => 'Order with id ' . $id . ' not found'
            ], 400);
        }
        $order->status_id=$request->status_id;
        $order->update();
        $user=$order->user;
       if(Mail::to($user)->send(new \App\Mail\StatusNotification())) {
           return response()->json([
               'success' => true,
               'message' => 'your email has been sent'

           ]);
       }
       else{
           return response()->json([
               'success' => false,
               'message' => 'Email failed'
           ], 500);

       }



    }
}
