@extends('layouts.app')
@section('title', 'Pulau  Nusantara')
@section('content')
<div class="container">

    @if (session('msg'))
        <p class="alert alert-info">{{session('msg')}}</p>
    @endif

    <div class="row">

        @foreach ($datas as $data)
            
        <div class="col-sm-6 mb-4">
            <div class="card border-dark">
                <div class="card-img-body">
                    <img class="card-img" src="{{ url($data->img) }}" width="200" height="200" alt="Pulau {{$data->island}}">
                </div>
                <div class="card-body">
                    <h4 class="card-title"><a href="/beranda/{{$data->slug}}">{{$data->island}}</a></h4>
                    <p class="card-text">{{Str::limit($data->description, 300) }}</p>
                    
                    @if ($data->author())
                        
                        <a href="/beranda/{{$data->slug}}/edit" class="btn btn-warning btn-sm">Edit</a>

                        <form  action="/beranda/{{$data->id}}" method="POST" class="d-inline-flex">
                            @csrf
                            @method('DELETE')
                            <button type="submit" onclick="return confirm('Hapus Data {{$data->island}} ')" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    @endif

                </div>
            </div>
        </div>

        @endforeach

        <div class="col-sm-12">
            {{$datas->links()}}
        </div>


    </div>

</div>
@endsection
