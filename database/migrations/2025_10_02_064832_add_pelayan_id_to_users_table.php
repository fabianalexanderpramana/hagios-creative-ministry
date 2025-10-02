<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
            if (!Schema::hasColumn('users', 'pelayan_id')) {
                $table->unsignedBigInteger('pelayan_id')->nullable()->after('id');
                $table->foreign('pelayan_id')
                      ->references('id')
                      ->on('pelayans')
                      ->onDelete('cascade');
            }
        });
    }
    
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            if (Schema::hasColumn('users', 'pelayan_id')) {
                $table->dropForeign(['pelayan_id']);
                $table->dropColumn('pelayan_id');
            }
        });
    }    
};

