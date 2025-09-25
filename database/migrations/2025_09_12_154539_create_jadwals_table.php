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
        Schema::create('jadwals', function (Blueprint $table) {
            $table->id();
            $table->foreignId('id_ibadah')->constrained('ibadahs')->onDelete('cascade');

            $table->foreignId('id_videotron')->nullable()->constrained('pelayans')->onDelete('set null');
            $table->foreignId('id_live_op')->nullable()->constrained('pelayans')->onDelete('set null');
            $table->foreignId('id_live_cam_1')->nullable()->constrained('pelayans')->onDelete('set null');
            $table->foreignId('id_live_cam_2')->nullable()->constrained('pelayans')->onDelete('set null');
            $table->foreignId('id_live_cam_3')->nullable()->constrained('pelayans')->onDelete('set null');
            $table->foreignId('id_live_cam_4')->nullable()->constrained('pelayans')->onDelete('set null');
            $table->foreignId('id_live_cam_5')->nullable()->constrained('pelayans')->onDelete('set null');
            $table->foreignId('id_foto')->nullable()->constrained('pelayans')->onDelete('set null');

            $table->string('keterangan', 256)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('jadwals');
    }
};
