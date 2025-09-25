<?php

namespace App\Http\Controllers;

use App\Models\Jadwal;
use App\Models\Ibadah;
use App\Models\Pelayan;
use App\Models\Pelayanan;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;

class JadwalController extends Controller
{
    public function index(Request $request)
{
    $ibadahs = Ibadah::all();

    $jadwals = Jadwal::with([
        'ibadah','videotron','live_op','live_cam_1','live_cam_2',
        'live_cam_3','live_cam_4','live_cam_5','foto'
    ]);

    // Filter berdasarkan ibadah
    if ($request->filled('id_ibadah')) {
        $jadwals->where('id_ibadah', $request->id_ibadah);
    }

    // Filter berdasarkan bulan & tahun
    if ($request->filled('bulan')) {
        $bulan = $request->bulan;
        $tahun = $request->tahun ?? now()->year;

        $jadwals->whereMonth('tanggal', $bulan)
                ->whereYear('tanggal', $tahun);
    }

    $jadwals = $jadwals->get();

    return view('jadwals.index', compact('jadwals', 'ibadahs'));
}


    public function create()
    {
        $ibadahs = Ibadah::all();
        $pelayanans = Pelayanan::all();
        $pelayans = Pelayan::with(['pelayanans', 'ibadahs'])->get();

        return view('jadwals.create', compact('ibadahs', 'pelayans', 'pelayanans'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'id_ibadah'  => 'required|exists:ibadahs,id',
            'tanggal'    => 'required|date',
            'keterangan' => 'nullable|max:256',
        ]);

        Jadwal::create($request->all());

        return redirect()->route('jadwals.index')
            ->with('success','Jadwal berhasil ditambahkan');
    }

    public function edit(Jadwal $jadwal)
    {
        $ibadahs = Ibadah::all();
        $pelayanans = Pelayanan::all();
        $pelayans = Pelayan::with(['pelayanans', 'ibadahs'])->get();

        return view('jadwals.edit', compact('jadwal', 'ibadahs', 'pelayans', 'pelayanans'));
    }

    public function update(Request $request, Jadwal $jadwal)
    {
        $request->validate([
            'id_ibadah'  => 'required|exists:ibadahs,id',
            'tanggal'    => 'required|date',
            'keterangan' => 'nullable|max:256',
        ]);

        $jadwal->update($request->all());

        return redirect()->route('jadwals.index')
            ->with('success','Jadwal berhasil diupdate');
    }

    public function destroy(Jadwal $jadwal)
    {
        $jadwal->delete();

        return redirect()->route('jadwals.index')
            ->with('success','Jadwal berhasil dihapus');
    }

    public function exportPdf(Request $request)
    {
        $jadwals = Jadwal::with([
            'ibadah','videotron','live_op',
            'live_cam_1','live_cam_2','live_cam_3',
            'live_cam_4','live_cam_5','foto'
        ]);

        // sesuai filter
        if ($request->filled('id_ibadah')) {
            $jadwals->where('id_ibadah', $request->id_ibadah);
        }
        if ($request->filled('bulan')) {
            $bulan = $request->bulan;
            $tahun = $request->tahun ?? now()->year;
            $jadwals->whereMonth('tanggal', $bulan)
                    ->whereYear('tanggal', $tahun);
        }

        $jadwals = $jadwals->get();

        $pdf = Pdf::loadView('jadwals.pdf-export', compact('jadwals'))
                ->setPaper('a4', 'landscape');

        return $pdf->download('jadwal_hagioscreativeministry.pdf');
    }
}
