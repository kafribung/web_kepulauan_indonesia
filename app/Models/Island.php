<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

// Import Db yg login
use Auth;

class Island extends Model
{
    protected $touches = ['user'];
    protected $guarded = ['created_at', 'updated_at'];

    // Realtion Many to One (user)
    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

    // Mutator
    public function getImgAttribute($value)
    {
        return url('images', $value);
    }

    // Author
    public function author()
    {
        if (Auth::check()) {
            return Auth::user()->id == $this->user_id;
        } return false;
    }
}
