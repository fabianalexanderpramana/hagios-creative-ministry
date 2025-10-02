<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use HasFactory, Notifiable;

    protected $fillable = [
        'username',
        'email',
        'password',
        'pelayan_id',
        'role'
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function pelayan()
    {
        return $this->belongsTo(Pelayan::class, 'pelayan_id', 'id');
    }

    public function isAdmin()
    {
        return $this->role === 'ADMIN';
    }

    public function isPelayan()
    {
        return $this->role === 'PELAYAN';
    }
}
