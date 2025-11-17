<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('hcm_users', function (Blueprint $table) {
            $table->enum('role', ['ADMIN', 'PELAYAN'])->default('PELAYAN');
        });
        
    }

    public function down(): void
    {
        Schema::table('hcm_users', function (Blueprint $table) {
            $table->dropColumn('role');
        });
    }
};
