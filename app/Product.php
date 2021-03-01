<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = [
        'name','user_id','price','option_id'
    ];
    public function user(){
        return $this->belongsTo(User::class);
    }
    public function order_details(){
        return $this->hasMany(Order_detail::class);
    }
    public function option(){
        return $this->belongsTo(Option::class);
    }
    public function kinds(){
        return $this->hasMany(kind::class);
    }

}
