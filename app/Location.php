<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Location extends Model
{
    protected $fillable = [
        'name'
    ];
    public function order_details(){
        return $this->hasMany(Order_detail::class);
    }
}
