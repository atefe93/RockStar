<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Option extends Model
{
    protected $fillable = [
        'name','user_id'
    ];
    public function products(){
        return $this->hasMany(Product::class);
    }
    public function option_details(){
        return $this->hasMany(Option_detail::class);
    }
}
