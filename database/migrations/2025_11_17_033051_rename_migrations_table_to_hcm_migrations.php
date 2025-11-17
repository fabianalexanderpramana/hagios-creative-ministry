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
        
        // Rename tabel migrations ke hcm_migrations
        if (Schema::hasTable('migrations') && !Schema::hasTable('hcm_migrations')) {
            if ($driver === 'mysql' || $driver === 'mariadb') {
                DB::statement('RENAME TABLE `migrations` TO `hcm_migrations`');
            } elseif ($driver === 'sqlite') {
                DB::statement('ALTER TABLE `migrations` RENAME TO `hcm_migrations`');
            } elseif ($driver === 'pgsql') {
                DB::statement('ALTER TABLE "migrations" RENAME TO "hcm_migrations"');
            } else {
                Schema::rename('migrations', 'hcm_migrations');
            }
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        $driver = DB::getDriverName();
        
        // Rename kembali hcm_migrations ke migrations
        if (Schema::hasTable('hcm_migrations') && !Schema::hasTable('migrations')) {
            if ($driver === 'mysql' || $driver === 'mariadb') {
                DB::statement('RENAME TABLE `hcm_migrations` TO `migrations`');
            } elseif ($driver === 'sqlite') {
                DB::statement('ALTER TABLE `hcm_migrations` RENAME TO `migrations`');
            } elseif ($driver === 'pgsql') {
                DB::statement('ALTER TABLE "hcm_migrations" RENAME TO "migrations"');
            } else {
                Schema::rename('hcm_migrations', 'migrations');
            }
        }
    }
};
