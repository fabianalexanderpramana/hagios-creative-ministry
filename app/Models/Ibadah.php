<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Ibadah extends Model
{
    protected $table = 'hcm_ibadahs';
    
    protected $fillable = ['nama_ibadah','waktu'];

    public function pelayans()
    {
        return $this->belongsToMany(Pelayan::class, 'hcm_pelayan_to_ibadahs', 'id_ibadah', 'id_pelayan');
    }
}

