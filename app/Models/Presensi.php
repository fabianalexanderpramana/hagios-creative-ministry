<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Presensi extends Model
{
    protected $fillable = [
        'id_pelayan',
        'id_jadwal',
        'status_kehadiran',
    ];

    public function pelayan()
    {
        return $this->belongsTo(Pelayan::class, 'id_pelayan');
    }

    public function jadwal()
    {
        return $this->belongsTo(Jadwal::class, 'id_jadwal');
    }
}


