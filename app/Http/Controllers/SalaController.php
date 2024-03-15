<?php

namespace App\Http\Controllers;

use App\Models\Sala;
use Illuminate\Http\Request;
use Inertia\Inertia;

class SalaController extends Controller
{
    public function index()
    {
        $salas = Sala::all();
        $user = auth()->user();
        return (Inertia::render("Welcome", compact("salas", "user")));
    }

    public function show($id)
    {
        $sala = Sala::findOrFail($id);
        return Inertia::render('Sala', ['sala' => $sala]);
    }
}

