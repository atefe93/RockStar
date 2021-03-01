<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Option_detail extends Model
{
    protected $fillable = [
        'name','option_id'
    ];
    public function option(){
        return $this->belongsTo(Option::class);
    }


}
