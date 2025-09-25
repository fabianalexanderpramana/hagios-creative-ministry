<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pelayanan extends Model
{
    protected $fillable = ['nama_pelayanan'];

    public function pelayans()
    {
        return $this->belongsToMany(Pelayan::class, 'pelayan_to_pelayanans', 'id_pelayanan', 'id_pelayan');
    }
}

