<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Jadwal;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class DashboardController extends Controller
{
    public function index(Request $request)
    {
        $user = Auth::user();

        if (!$user || !$user->pelayan) {
            return view('dashboard.index', [
                'jadwals' => collect(),
                'filter' => 'future', // default filter
            ]);
        }

        $pelayanId = $user->pelayan->id;

        // Ambil filter dari query
        $filter = $request->query('filter', 'future'); // default 'future'

        $jadwals = Jadwal::with(['ibadah'])
            ->where(function ($q) use ($pelayanId) {
                $q->where('id_videotron', $pelayanId)
                  ->orWhere('id_live_op', $pelayanId)
                  ->orWhere('id_live_cam_1', $pelayanId)
                  ->orWhere('id_live_cam_2', $pelayanId)
                  ->orWhere('id_live_cam_3', $pelayanId)
                  ->orWhere('id_live_cam_4', $pelayanId)
                  ->orWhere('id_live_cam_5', $pelayanId)
                  ->orWhere('id_foto', $pelayanId);
            });

        $today = Carbon::today();

        if ($filter === 'future') {
            $jadwals->where('tanggal', '>=', $today);
        } elseif ($filter === 'current_month') {
            $jadwals->whereMonth('tanggal', $today->month)
                     ->whereYear('tanggal', $today->year);
        }
        // 'all' => tidak ada filter tanggal

        $jadwals = $jadwals->orderBy('tanggal', 'asc')->get();

        return view('dashboard.index', compact('jadwals', 'filter'));
    }
}
