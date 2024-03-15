<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Sala;

class FavoritosController extends Controller
{
    //

    public function add_favorito(Request $request,  User $user,Sala $sala){
        $user->salas()->attach($user->id);
        return response()->json("OK");
    }
    public function del_favorito(Request $request,  User $user,Sala $sala){
        $user->salas()->detach($user->id);
        return response()->json("OK");
    }
}
