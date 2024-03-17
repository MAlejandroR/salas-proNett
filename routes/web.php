<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

use App\Http\Controllers\SalaController;

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



Route::get('/salas', [SalaController::class, 'index']);
Route::get('/addfavoritos/{user}/{sala}', [\App\Http\Controllers\FavoritosController::class, 'add_favorito']);
Route::get('/delfavoritos/{user}/{sala}', [\App\Http\Controllers\FavoritosController::class, 'del_favorito']);

Route::get('/salas/{id}', [SalaController::class, 'show'])->name('sala.show');


Route::get('/', function () {
    $salas = App\Models\Sala::all();
    $user = auth()->user();
    $salasFavoritas=[];
    if($user) {
        $salasFavoritas = $user->salas()->get();
        info("Salas favoritas de $user->id" . $salasFavoritas);
    }
    return Inertia::render('Welcome', compact("salas","user", "salasFavoritas"));
})->name('welcome');

//Route::get('/', function () {
//    return Inertia::render('Welcome', [
//        'canLogin' => Route::has('login'),
//        'canRegister' => Route::has('register'),
//        'laravelVersion' => Application::VERSION,
//        'phpVersion' => PHP_VERSION,
//    ]);
//});

Route::get('/dashboard', function () {
    $user = auth()->user();
    if ($user) {
        $salas = $user->salas()->get();
        info("valor de salas $salas");
    }

    return Inertia::render('Dashboard',compact('user','salas'));
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
