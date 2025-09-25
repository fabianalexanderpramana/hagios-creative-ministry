<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Pelayan;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Buat pelayan baru
        $pelayan = Pelayan::create([
            'nama_pelayan' => 'ADMIN',
            'tgl_lahir' => '2000-01-01',
        ]);

        // Buat user yang terhubung ke pelayan
        User::create([
            'username' => 'adminhcm',
            'password' => Hash::make('admin123'), // password terenkripsi
            'pelayan_id' => $pelayan->id,
        ]);
    }
}
