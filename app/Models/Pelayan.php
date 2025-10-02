<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pelayan extends Model
{
    protected $fillable = ['nama_pelayan','tgl_lahir'];

    public function pelayanans()
    {
        return $this->belongsToMany(Pelayanan::class, 'pelayan_to_pelayanans', 'id_pelayan', 'id_pelayanan')->orderBy('id_pelayanan', 'asc');
    }

    public function ibadahs()
    {
        return $this->belongsToMany(Ibadah::class, 'pelayan_to_ibadahs', 'id_pelayan', 'id_ibadah')->orderBy('id_ibadah', 'asc');
    }

    public function user()
    {
        return $this->hasOne(User::class, 'pelayan_id', 'id');
    }
}

