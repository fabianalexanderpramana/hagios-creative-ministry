<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

use App\Http\Controllers\PelayanController;
use App\Http\Controllers\PelayananController;
use App\Http\Controllers\IbadahController;
use App\Http\Controllers\JadwalController;
use App\Http\Controllers\TimController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ChangePasswordController;
use App\Http\Controllers\PresensiController;

// auth routes dari Breeze
require __DIR__.'/auth.php';

// redirect root: guest ke jadwal, user login ke dashboard
Route::get('/', function () {
    if (Auth::check()) {
        return redirect()->route('dashboard');
    }
    return redirect()->route('jadwals.index');
});

Route::get('/change-password', [ChangePasswordController::class, 'index'])->name('password.change.form');
Route::post('/change-password', [ChangePasswordController::class, 'update'])->name('password.change');

// Route yang bisa diakses guest
Route::get('/jadwals', [JadwalController::class, 'index'])->name('jadwals.index');

// Semua user login
Route::middleware(['auth'])->group(function () {

    // akses semua user
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
    Route::get('/tims', [TimController::class, 'index'])->name('tims.index');
    Route::get('/ibadahs', [IbadahController::class, 'index'])->name('ibadahs.index');

    // Routes untuk dropdown (akses semua user yang login)
    Route::get('/dropdown-pelayan/{id}', function($id) {
        return DB::table('pelayans')
            ->join('pelayan_to_ibadahs', 'pelayans.id', '=', 'pelayan_to_ibadahs.id_pelayan')
            ->join('ibadahs', 'ibadahs.id', '=', 'pelayan_to_ibadahs.id_ibadah')
            ->where('ibadahs.id', $id)
            ->select('pelayans.*')
            ->get();
    });
    Route::get('/dropdown-tim/{id}', [JadwalController::class, 'getTimsByIbadah']);
    Route::get('/api/tim/{id}', [JadwalController::class, 'getTimDetail']);

    // khusus admin
    Route::middleware('admin')->group(function () {
        Route::resource('pelayans', PelayanController::class);
        Route::resource('pelayanans', PelayananController::class);
        Route::resource('ibadahs', IbadahController::class)->except(['index']);
        Route::resource('jadwals', JadwalController::class)->except(['index']);
        Route::resource('tims', TimController::class)->except(['index']);
        Route::resource('users', UserController::class);
        Route::resource('presensis', PresensiController::class)->except(['show','destroy']);

        Route::get('/jadwals/export/pdf', [JadwalController::class, 'exportPdf'])->name('jadwals.export.pdf');
        Route::get('users/{id}/reset-password', [UserController::class, 'resetPassword'])->name('users.reset-password');
    });
});

require __DIR__.'/auth.php';

// Route::middleware('auth')->group(function () {
//     Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
//     Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
//     Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
// });