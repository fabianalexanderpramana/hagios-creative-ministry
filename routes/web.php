<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;

use App\Http\Controllers\PelayanController;
use App\Http\Controllers\PelayananController;
use App\Http\Controllers\IbadahController;
use App\Http\Controllers\JadwalController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\DashboardController;

// auth routes dari Breeze
require __DIR__.'/auth.php';

// redirect root ke jadwals.index
Route::get('/', function () {
    return redirect()->route('jadwals.index');
});

// protected routes
Route::middleware(['auth'])->group(function () {
    Route::resource('pelayans', PelayanController::class);
    Route::resource('pelayanans', PelayananController::class);
    Route::resource('ibadahs', IbadahController::class);
    Route::resource('jadwals', JadwalController::class);
    Route::resource('users', UserController::class);

    Route::get('/dropdown-pelayan/{ibadahId}', function($id) {
        return DB::table('pelayans')
            ->join('pelayan_to_ibadahs', 'pelayans.id', '=', 'pelayan_to_ibadahs.id_pelayan')
            ->join('ibadahs', 'ibadahs.id', '=', 'pelayan_to_ibadahs.id_ibadah')
            ->where('ibadahs.id', $id)
            ->select('pelayans.*')
            ->get();
    });

    Route::get('/jadwals/export/pdf', [JadwalController::class, 'exportPdf'])->name('jadwals.export.pdf');

    Route::get('users/{id}/reset-password', [UserController::class, 'resetPassword'])->name('users.reset-password');

    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
    });

require __DIR__.'/auth.php';

// Route::middleware('auth')->group(function () {
//     Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
//     Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
//     Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
// });