<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Jadwal extends Model
{
    protected $fillable = [
        'id_ibadah','tanggal','id_tim','id_videotron','id_live_op',
        'id_live_cam_1','id_live_cam_2','id_live_cam_3',
        'id_live_cam_4','id_live_cam_5','id_foto','keterangan'
    ];

    protected $casts = [
        'tanggal' => 'date',
    ];

    public function ibadah() {
        return $this->belongsTo(Ibadah::class, 'id_ibadah');
    }

    public function tim() {
        return $this->belongsTo(Tim::class, 'id_tim');
    }

    public function videotron() { return $this->belongsTo(Pelayan::class, 'id_videotron'); }
    public function live_op() { return $this->belongsTo(Pelayan::class, 'id_live_op'); }
    public function live_cam_1() { return $this->belongsTo(Pelayan::class, 'id_live_cam_1'); }
    public function live_cam_2() { return $this->belongsTo(Pelayan::class, 'id_live_cam_2'); }
    public function live_cam_3() { return $this->belongsTo(Pelayan::class, 'id_live_cam_3'); }
    public function live_cam_4() { return $this->belongsTo(Pelayan::class, 'id_live_cam_4'); }
    public function live_cam_5() { return $this->belongsTo(Pelayan::class, 'id_live_cam_5'); }
    public function foto() { return $this->belongsTo(Pelayan::class, 'id_foto'); }

    public function presensis()
    {
        return $this->hasMany(Presensi::class, 'id_jadwal');
    }

    public function jadwals()
    {
        return $this->hasMany(Jadwal::class, 'id_videotron')
            ->orWhere('id_live_op', $this->id)
            ->orWhere('id_live_cam_1', $this->id)
            ->orWhere('id_live_cam_2', $this->id)
            ->orWhere('id_live_cam_3', $this->id)
            ->orWhere('id_live_cam_4', $this->id)
            ->orWhere('id_live_cam_5', $this->id)
            ->orWhere('id_foto', $this->id);
    }
}

