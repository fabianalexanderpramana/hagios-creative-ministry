<?php

namespace App\Http\Controllers;

use App\Models\Jadwal;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    public function index()
    {
        $user = Auth::user();

        if (!$user || !$user->pelayan) {
            return view('dashboard.index', [
                'jadwals' => collect(),
            ]);
        }

        $pelayanId = $user->pelayan->id;

        // jadwal pelayan ini bertugas
        $jadwals = Jadwal::with(['ibadah'])
            ->where('id_videotron', $pelayanId)
            ->orWhere('id_live_op', $pelayanId)
            ->orWhere('id_live_cam_1', $pelayanId)
            ->orWhere('id_live_cam_2', $pelayanId)
            ->orWhere('id_live_cam_3', $pelayanId)
            ->orWhere('id_live_cam_4', $pelayanId)
            ->orWhere('id_live_cam_5', $pelayanId)
            ->orWhere('id_foto', $pelayanId)
            ->orderBy('tanggal', 'asc')
            ->get();

        return view('dashboard.index', compact('jadwals'));
    }
}
