<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        $driver = DB::getDriverName();
        
        // Disable foreign key checks untuk MySQL/MariaDB
        if ($driver === 'mysql' || $driver === 'mariadb') {
            DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        }

        // Urutan rename: tabel yang direferensi dulu, baru tabel yang mereferensi
        $tables = [
            // Tabel sistem Laravel
            'migrations' => 'hcm_migrations',
            // Tabel independen (tidak ada foreign key ke tabel lain)
            'users' => 'hcm_users',
            'password_reset_tokens' => 'hcm_password_reset_tokens',
            'sessions' => 'hcm_sessions',
            'cache' => 'hcm_cache',
            'cache_locks' => 'hcm_cache_locks',
            'jobs' => 'hcm_jobs',
            'job_batches' => 'hcm_job_batches',
            'failed_jobs' => 'hcm_failed_jobs',
            'pelayans' => 'hcm_pelayans',
            'pelayanans' => 'hcm_pelayanans',
            'ibadahs' => 'hcm_ibadahs',
            // Tabel yang memiliki foreign key
            'tims' => 'hcm_tims',
            'jadwals' => 'hcm_jadwals',
            'pelayan_to_pelayanans' => 'hcm_pelayan_to_pelayanans',
            'pelayan_to_ibadahs' => 'hcm_pelayan_to_ibadahs',
            'presensis' => 'hcm_presensis',
        ];

        foreach ($tables as $oldName => $newName) {
            if (Schema::hasTable($oldName) && !Schema::hasTable($newName)) {
                if ($driver === 'mysql' || $driver === 'mariadb') {
                    DB::statement("RENAME TABLE `{$oldName}` TO `{$newName}`");
                } elseif ($driver === 'sqlite') {
                    DB::statement("ALTER TABLE `{$oldName}` RENAME TO `{$newName}`");
                } elseif ($driver === 'pgsql') {
                    DB::statement("ALTER TABLE \"{$oldName}\" RENAME TO \"{$newName}\"");
                } else {
                    // Fallback untuk driver lain
                    Schema::rename($oldName, $newName);
                }
            }
        }

        // Enable kembali foreign key checks untuk MySQL/MariaDB
        if ($driver === 'mysql' || $driver === 'mariadb') {
            DB::statement('SET FOREIGN_KEY_CHECKS=1;');
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        $driver = DB::getDriverName();
        
        // Disable foreign key checks untuk MySQL/MariaDB
        if ($driver === 'mysql' || $driver === 'mariadb') {
            DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        }

        // Urutan reverse: tabel yang mereferensi dulu, baru tabel yang direferensi
        $tables = [
            // Tabel yang memiliki foreign key (rename dulu)
            'hcm_presensis' => 'presensis',
            'hcm_pelayan_to_ibadahs' => 'pelayan_to_ibadahs',
            'hcm_pelayan_to_pelayanans' => 'pelayan_to_pelayanans',
            'hcm_jadwals' => 'jadwals',
            'hcm_tims' => 'tims',
            // Tabel independen
            'hcm_ibadahs' => 'ibadahs',
            'hcm_pelayanans' => 'pelayanans',
            'hcm_pelayans' => 'pelayans',
            'hcm_failed_jobs' => 'failed_jobs',
            'hcm_job_batches' => 'job_batches',
            'hcm_jobs' => 'jobs',
            'hcm_cache_locks' => 'cache_locks',
            'hcm_cache' => 'cache',
            'hcm_sessions' => 'sessions',
            'hcm_password_reset_tokens' => 'password_reset_tokens',
            'hcm_users' => 'users',
            // Tabel sistem Laravel
            'hcm_migrations' => 'migrations',
        ];

        foreach ($tables as $oldName => $newName) {
            if (Schema::hasTable($oldName) && !Schema::hasTable($newName)) {
                if ($driver === 'mysql' || $driver === 'mariadb') {
                    DB::statement("RENAME TABLE `{$oldName}` TO `{$newName}`");
                } elseif ($driver === 'sqlite') {
                    DB::statement("ALTER TABLE `{$oldName}` RENAME TO `{$newName}`");
                } elseif ($driver === 'pgsql') {
                    DB::statement("ALTER TABLE \"{$oldName}\" RENAME TO \"{$newName}\"");
                } else {
                    // Fallback untuk driver lain
                    Schema::rename($oldName, $newName);
                }
            }
        }

        // Enable kembali foreign key checks untuk MySQL/MariaDB
        if ($driver === 'mysql' || $driver === 'mariadb') {
            DB::statement('SET FOREIGN_KEY_CHECKS=1;');
        }
    }
};
