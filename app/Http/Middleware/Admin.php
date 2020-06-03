<?php

namespace App\Http\Middleware;

use Closure;

class Admin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $user= $request->user();

        if ($user) {
            if ($user->role ==  1) 
                return $next($request);
            else return abort('403', 'Anda Bukan Admin');
        } else return redirect('/login');
        
    }
}
