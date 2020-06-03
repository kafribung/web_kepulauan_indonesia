<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
// Import Class Request
use App\Http\Requests\BerandaRequest;
// Import Class Str;
use Illuminate\Support\Str;

// Import Db Island
use App\Models\Island;

use Auth;



class BerandaController extends Controller
{
    //READ
    public function index()
    {
        $datas = Island::orderBy('id', 'desc')->paginate(4);
        return view('pages.beranda', compact('datas'));
    }

    //CREATE URL
    public function create()
    {
        return view('pages.create_beranda');
    }

    //CREATE
    public function store(BerandaRequest $request)
    {
        $data = $request->all();

        $data['slug'] = Str::slug($request->island);
        
        if ($request->has('img')) {
            $img  = $request->file('img');
            $name = time() . '.' . $img->getClientOriginalExtension();
            $img->move(public_path('images'), $name);

            $data['img'] = $name;
        }


        if (Auth::check()) {
            $data['user_id'] = Auth::user()->id;
        } else  $data['user_id'] = 1;
        
        Island::create($data);
        
        return redirect('/beranda')->with('msg', 'Data Berhasil Ditambahkan');

        
    }

    //SHOW
    public function show($slug)
    {
        $data = Island::with('user')->where('slug', $slug)->first();

        return view('pages.show_beranda', compact('data'));
    }

    //EDIT
    public function edit($slug)
    {
        $data = Island::where('slug', $slug)->first();

        return view('pages.edit_beranda', compact('data'));
    }

    //UPDATE
    public function update(Request $request, $id)
    {
        $data = $request->validate([
            'island'       => ['required', 'string', 'min:3', 'max:30'],
            'img'          => ['mimes:png,jpg,jpeg'],
            'description'  => ['required', 'string']
        ]);

        $data['slug'] = Str::slug($request->island);
        
        if ($request->has('img')) {
            $img  = $request->file('img');
            $name = time() . '.' . $img->getClientOriginalExtension();
            $img->move(public_path('images'), $name);

            $data['img'] = $name;
        }

        Island::findOrFail($id)->update($data);

        return redirect('/beranda')->with('msg', 'Data Berhasil Diperbaruhi');
    }

    //DELETE
    public function destroy($id)
    {
        Island::destroy($id);

        return redirect('/beranda')->with('msg', 'Data Berhasil Dihapus');

    }

    public function about()
    {
        return view('pages.about');
    }
}
