<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order_detail extends Model
{
    protected $fillable = [
        'order_id','product_id','kindOrdetail_id','location_id','count','price'
    ];
    public function product(){
        return $this->belongsTo(Product::class);
    }

    public function order(){
        return $this->belongsTo(Order::class);
    }
    public function location(){
        return $this->belongsTo(Location::class);
    }
}
