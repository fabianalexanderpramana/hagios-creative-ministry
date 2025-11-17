<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('hcm_pelayan_to_pelayanans', function (Blueprint $table) {
            $table->id();
            $table->foreignId('id_pelayan')->constrained('hcm_pelayans')->onDelete('cascade');
            $table->foreignId('id_pelayanan')->constrained('hcm_pelayanans')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('hcm_pelayan_to_pelayanans');
    }
};
