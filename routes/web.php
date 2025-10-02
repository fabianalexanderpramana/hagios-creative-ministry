<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;

// auth routes dari Breeze
require __DIR__.'/auth.php';

// redirect root ke jadwals.index
Route::get('/', function () {
    return redirect()->route('jadwals.index');
});

// protected routes
Route::middleware(['auth'])->group(function () {
    Route::resource('pelayans', App\Http\Controllers\PelayanController::class);
    Route::resource('pelayanans', App\Http\Controllers\PelayananController::class);
    Route::resource('ibadahs', App\Http\Controllers\IbadahController::class);
    Route::resource('jadwals', App\Http\Controllers\JadwalController::class);
    Route::resource('users', App\Http\Controllers\UserController::class);

    Route::get('/dropdown-pelayan/{ibadahId}', function($id) {
        return DB::table('pelayans')
            ->join('pelayan_to_ibadahs', 'pelayans.id', '=', 'pelayan_to_ibadahs.id_pelayan')
            ->join('ibadahs', 'ibadahs.id', '=', 'pelayan_to_ibadahs.id_ibadah')
            ->where('ibadahs.id', $id)
            ->select('pelayans.*')
            ->get();
    });

    Route::get('/jadwals/export/pdf', [App\Http\Controllers\JadwalController::class, 'exportPdf'])->name('jadwals.export.pdf');

    Route::get('users/{id}/reset-password', [App\Http\Controllers\UserController::class, 'resetPassword'])->name('users.reset-password');
});

require __DIR__.'/auth.php';

// Route::middleware('auth')->group(function () {
//     Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
//     Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
//     Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
// });