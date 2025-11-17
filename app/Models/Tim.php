<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Tim extends Model
{
    protected $table = 'hcm_tims';
    
    protected $fillable = [
        'nama_tim','id_ibadah','id_videotron','id_live_op',
        'id_live_cam_1','id_live_cam_2','id_live_cam_3',
        'id_live_cam_4','id_live_cam_5','id_foto','keterangan'
    ];

    public function ibadah() {
        return $this->belongsTo(Ibadah::class, 'id_ibadah');
    }

    public function videotron() { return $this->belongsTo(Pelayan::class, 'id_videotron'); }
    public function live_op() { return $this->belongsTo(Pelayan::class, 'id_live_op'); }
    public function live_cam_1() { return $this->belongsTo(Pelayan::class, 'id_live_cam_1'); }
    public function live_cam_2() { return $this->belongsTo(Pelayan::class, 'id_live_cam_2'); }
    public function live_cam_3() { return $this->belongsTo(Pelayan::class, 'id_live_cam_3'); }
    public function live_cam_4() { return $this->belongsTo(Pelayan::class, 'id_live_cam_4'); }
    public function live_cam_5() { return $this->belongsTo(Pelayan::class, 'id_live_cam_5'); }
    public function foto() { return $this->belongsTo(Pelayan::class, 'id_foto'); }
}
