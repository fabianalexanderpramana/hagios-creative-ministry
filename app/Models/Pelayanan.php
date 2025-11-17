<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pelayanan extends Model
{
    protected $table = 'hcm_pelayanans';
    
    protected $fillable = ['nama_pelayanan'];

    public function pelayans()
    {
        return $this->belongsToMany(Pelayan::class, 'hcm_pelayan_to_pelayanans', 'id_pelayanan', 'id_pelayan');
    }
}

