<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect('/beranda');
});

Route::group(['middleware'=> 'admin'], function(){
    Route::resource('/beranda', 'BerandaController')->except(['index', 'show']);
});

Route::resource('/beranda', 'BerandaController')->only(['index', 'show']);
Route::get('/about', 'BerandaController@about');


Auth::routes(['register' => false]);

Route::get('/home', 'HomeController@index')->name('home');
