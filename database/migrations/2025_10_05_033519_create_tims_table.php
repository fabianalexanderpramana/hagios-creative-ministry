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
        Schema::create('hcm_tims', function (Blueprint $table) {
            $table->id();
            $table->string('nama_tim', 16);
            $table->foreignId('id_ibadah')->constrained('hcm_ibadahs')->onDelete('cascade');

            $table->foreignId('id_videotron')->nullable()->constrained('hcm_pelayans')->onDelete('set null');
            $table->foreignId('id_live_op')->nullable()->constrained('hcm_pelayans')->onDelete('set null');
            $table->foreignId('id_live_cam_1')->nullable()->constrained('hcm_pelayans')->onDelete('set null');
            $table->foreignId('id_live_cam_2')->nullable()->constrained('hcm_pelayans')->onDelete('set null');
            $table->foreignId('id_live_cam_3')->nullable()->constrained('hcm_pelayans')->onDelete('set null');
            $table->foreignId('id_live_cam_4')->nullable()->constrained('hcm_pelayans')->onDelete('set null');
            $table->foreignId('id_live_cam_5')->nullable()->constrained('hcm_pelayans')->onDelete('set null');
            $table->foreignId('id_foto')->nullable()->constrained('hcm_pelayans')->onDelete('set null');

            $table->string('keterangan', 256)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('hcm_tims');
    }
};
