<?php

namespace App\Http\Controllers;

use App\Models\Jadwal;
use App\Models\Ibadah;
use App\Models\Pelayan;
use App\Models\Pelayanan;
use App\Models\Tim;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;

class JadwalController extends Controller
{
    public function index(Request $request)
    {
        $ibadahs = Ibadah::all();

        // Jika reset ditekan -> hapus session filter
        if ($request->has('reset')) {
            session()->forget(['filter_id_ibadah', 'filter_bulan', 'filter_tahun']);
            return redirect()->route('jadwals.index');
        }

        // Simpan ke session kalau ada request baru
        if ($request->filled('id_ibadah') || $request->filled('bulan') || $request->filled('tahun')) {
            session([
                'filter_id_ibadah' => $request->id_ibadah,
                'filter_bulan' => $request->bulan,
                'filter_tahun' => $request->tahun,
            ]);
        }

        // Ambil dari session atau pakai default
        $id_ibadah = session('filter_id_ibadah');
        $bulan = session('filter_bulan', now()->month);
        $tahun = session('filter_tahun', now()->year);

        $jadwals = Jadwal::with([
            'ibadah','tim','videotron','live_op','live_cam_1','live_cam_2',
            'live_cam_3','live_cam_4','live_cam_5','foto'
        ]);

        // Filter ibadah
        if ($id_ibadah) {
            $jadwals->where('id_ibadah', $id_ibadah);
        }

        // Selalu filter bulan & tahun
        $jadwals->whereMonth('tanggal', $bulan)
                ->whereYear('tanggal', $tahun)
                ->orderBy('tanggal', 'asc');

        $jadwals = $jadwals->get();

        return view('jadwals.index', compact('jadwals', 'ibadahs', 'id_ibadah', 'bulan', 'tahun'));
    }

    public function create()
    {
        $ibadahs = Ibadah::all();
        $pelayanans = Pelayanan::all();
        $pelayans = Pelayan::with(['pelayanans', 'ibadahs'])->get();
        $tims = Tim::all();

        return view('jadwals.create', compact('ibadahs', 'pelayans', 'pelayanans', 'tims'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'id_ibadah'  => 'required|exists:ibadahs,id',
            'tanggal'    => 'required|date',
            'id_tim'     => 'nullable|exists:tims,id',
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
        $tims = Tim::all();

        return view('jadwals.edit', compact('jadwal', 'ibadahs', 'pelayans', 'pelayanans', 'tims'));
    }

    public function update(Request $request, Jadwal $jadwal)
    {
        $request->validate([
            'id_ibadah'  => 'required|exists:ibadahs,id',
            'tanggal'    => 'required|date',
            'id_tim'     => 'nullable|exists:tims,id',
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
        $id_ibadah = session('filter_id_ibadah');
        $bulan = session('filter_bulan', now()->month);
        $tahun = session('filter_tahun', now()->year);

        $jadwals = Jadwal::with([
            'ibadah','tim','videotron','live_op',
            'live_cam_1','live_cam_2','live_cam_3',
            'live_cam_4','live_cam_5','foto'
        ]);

        if ($id_ibadah) {
            $jadwals->where('id_ibadah', $id_ibadah);
        }

        $jadwals->whereMonth('tanggal', $bulan)
                ->whereYear('tanggal', $tahun)
                ->orderBy('tanggal', 'asc');

        $jadwals = $jadwals->get();

        $bulanNama = \Carbon\Carbon::createFromDate($tahun, $bulan, 1)->translatedFormat('F');

        $pdf = Pdf::loadView('jadwals.pdf-export', [
            'jadwals' => $jadwals,
            'bulanNama' => $bulanNama,
            'tahun' => $tahun
        ])->setPaper('a4', 'landscape');

        $fileName = 'HCM.' . $bulanNama . '.' . $tahun . '.pdf';

        return $pdf->download($fileName);
    }

    public function getTimsByIbadah($id_ibadah)
    {
        $tims = Tim::where('id_ibadah', $id_ibadah)->get();
        return response()->json($tims);
    }

    public function getTimDetail($id)
    {
        $tim = Tim::find($id);
        return response()->json($tim);
    }
}
