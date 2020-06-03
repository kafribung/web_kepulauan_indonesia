@extends('layouts.app')
@section('title', 'Edit Data')
@section('content')
<div class="container">
    <div class="row">
        <div class="col-sm-8 offset-sm-2">
            <form action="/beranda/{{$data->id}}" method="POST" enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <div class="form-group">
                  <label for="island">Island</label>
                  <input type="text" class="form-control  @error('island') is-invalid @enderror" id="island" name="island" autocomplete="off" autofocus placeholder="Input Island" value="{{old('island') ? old('island') : $data->island}}" >

                  @error('island')
                      <p class="alert alert-danger">{{$message}}</p>
                  @enderror
                </div>

                <div class="form-group">
                    <label for="img">Image</label>
                    <img src="{{url($data->img)}}" width="100" height="100" alt=" Gamber Pulau{{$data->island}}">
                    <input type="file" class="form-control @error('img') is-invalid @enderror" id="img" name="img" autocomplete="off">
               
                    @error('img')
                        <p class="alert alert-danger">{{$message}}</p>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea class="form-control @error('description') is-invalid @enderror" id="description" name="description" > {{old('description') ? old('description') : $data->description}}</textarea>
                    
                    @error('description')
                        <p class="alert alert-danger">{{$message}}</p>
                    @enderror
                </div>
                <button type="submit" class="btn btn-warning btn-block">Update</button>
            </form>
        </div>
    </div>
</div>

@endsection
