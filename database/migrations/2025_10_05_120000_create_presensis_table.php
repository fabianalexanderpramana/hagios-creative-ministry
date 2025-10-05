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
        Schema::create('presensis', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_pelayan');
            $table->unsignedBigInteger('id_jadwal');
            $table->enum('status_kehadiran', ['hadir','terlambat','izin','tidak hadir']);
            $table->timestamps();

            $table->foreign('id_pelayan')->references('id')->on('pelayans')->onDelete('cascade');
            $table->foreign('id_jadwal')->references('id')->on('jadwals')->onDelete('cascade');
            $table->unique(['id_pelayan','id_jadwal']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('presensis');
    }
};


