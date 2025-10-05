<?php

namespace App\Http\Controllers;

use App\Models\Presensi;
use App\Models\Jadwal;
use App\Models\Pelayan;
use Illuminate\Http\Request;

class PresensiController extends Controller
{
    public function index(Request $request)
    {
        $ibadahs = \App\Models\Ibadah::all();

        if ($request->has('reset')) {
            session()->forget(['presensi_filter_id_ibadah', 'presensi_filter_bulan', 'presensi_filter_tahun']);
            return redirect()->route('presensis.index');
        }

        if ($request->filled('id_ibadah') || $request->filled('bulan') || $request->filled('tahun')) {
            session([
                'presensi_filter_id_ibadah' => $request->id_ibadah,
                'presensi_filter_bulan' => $request->bulan,
                'presensi_filter_tahun' => $request->tahun,
            ]);
        }

        $id_ibadah = session('presensi_filter_id_ibadah');
        $bulan = session('presensi_filter_bulan', now()->month);
        $tahun = session('presensi_filter_tahun', now()->year);

        $jadwals = Jadwal::with(['ibadah','videotron','live_op','live_cam_1','live_cam_2','live_cam_3','live_cam_4','live_cam_5','foto'])
            ->whereHas('presensis')
            ->when($id_ibadah, fn($q) => $q->where('id_ibadah', $id_ibadah))
            ->whereMonth('tanggal', $bulan)
            ->whereYear('tanggal', $tahun)
            ->orderBy('tanggal', 'asc')
            ->get();

        // Preload presensi keyed by [id_jadwal][id_pelayan]
        $presensiByJadwalPelayan = Presensi::whereIn('id_jadwal', $jadwals->pluck('id'))
            ->get()
            ->groupBy(['id_jadwal', 'id_pelayan']);

        return view('presensis.index', compact('jadwals', 'ibadahs', 'id_ibadah', 'bulan', 'tahun', 'presensiByJadwalPelayan'));
    }

    public function create(Request $request)
    {
        // Jadwal yang belum dibuat presensi dan tanggal <= today
        $today = now()->toDateString();
        $jadwals = Jadwal::with(['ibadah'])
            ->whereDate('tanggal', '<=', $today)
            ->whereDoesntHave('presensis')
            ->orderBy('tanggal', 'desc')
            ->get();

        $selectedJadwal = null;
        if ($request->filled('id_jadwal')) {
            $selectedJadwal = Jadwal::with(['videotron','live_op','live_cam_1','live_cam_2','live_cam_3','live_cam_4','live_cam_5','foto','ibadah'])
                ->find($request->id_jadwal);
        }

        return view('presensis.create', compact('jadwals', 'selectedJadwal'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'id_jadwal' => 'required|exists:jadwals,id',
            'presensi' => 'nullable|array', // key: id_pelayan, value: status
        ]);

        $idJadwal = $request->input('id_jadwal');
        $entries = $request->input('presensi', []);

        foreach ($entries as $idPelayan => $status) {
            if (!$status) { continue; }
            Presensi::updateOrCreate(
                ['id_pelayan' => $idPelayan, 'id_jadwal' => $idJadwal],
                ['status_kehadiran' => $status]
            );
        }

        return redirect()->route('presensis.index')->with('success', 'Presensi berhasil disimpan');
    }

    public function edit($id)
    {
        $jadwal = Jadwal::with(['videotron','live_op','live_cam_1','live_cam_2','live_cam_3','live_cam_4','live_cam_5','foto'])
            ->findOrFail($id);

        $existing = Presensi::where('id_jadwal', $jadwal->id)->get()->keyBy('id_pelayan');

        return view('presensis.edit', compact('jadwal', 'existing'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'presensi' => 'required|array',
        ]);

        $entries = $request->input('presensi');

        foreach ($entries as $idPelayan => $status) {
            if (!$status) { continue; }
            Presensi::updateOrCreate(
                ['id_pelayan' => $idPelayan, 'id_jadwal' => $id],
                ['status_kehadiran' => $status]
            );
        }

        return redirect()->route('presensis.index')->with('success', 'Presensi berhasil diupdate');
    }
}


