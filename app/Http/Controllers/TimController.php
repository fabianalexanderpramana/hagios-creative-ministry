<?php

namespace App\Http\Controllers;

use App\Models\Tim;
use App\Models\Ibadah;
use App\Models\Pelayan;
use App\Models\Pelayanan;
use Illuminate\Http\Request;

class TimController extends Controller
{
    public function index(Request $request)
    {
        $ibadahs = Ibadah::all();

        // Jika reset ditekan -> hapus session filter
        if ($request->has('reset')) {
            session()->forget(['filter_id_ibadah']);
            return redirect()->route('tims.index');
        }

        // Simpan ke session kalau ada request baru
        if ($request->filled('id_ibadah')) {
            session([
                'filter_id_ibadah' => $request->id_ibadah,
            ]);
        }

        // Ambil dari session atau pakai default
        $id_ibadah = session('filter_id_ibadah');

        $tims = Tim::with([
            'ibadah','videotron','live_op','live_cam_1','live_cam_2',
            'live_cam_3','live_cam_4','live_cam_5','foto'
        ]);

        // Filter ibadah
        if ($id_ibadah) {
            $tims->where('id_ibadah', $id_ibadah);
        }

        $tims = $tims->orderBy('nama_tim', 'asc')->get();

        return view('tims.index', compact('tims', 'ibadahs', 'id_ibadah'));
    }

    public function create()
    {
        $ibadahs = Ibadah::all();
        $pelayanans = Pelayanan::all();
        $pelayans = Pelayan::with(['pelayanans', 'ibadahs'])->get();

        return view('tims.create', compact('ibadahs', 'pelayans', 'pelayanans'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama_tim'    => 'required|string|max:16',
            'id_ibadah'   => 'required|exists:ibadahs,id',
            'keterangan'  => 'nullable|max:256',
        ]);

        Tim::create($request->all());

        return redirect()->route('tims.index')
            ->with('success','Tim berhasil ditambahkan');
    }

    public function edit(Tim $tim)
    {
        $ibadahs = Ibadah::all();
        $pelayanans = Pelayanan::all();
        $pelayans = Pelayan::with(['pelayanans', 'ibadahs'])->get();

        return view('tims.edit', compact('tim', 'ibadahs', 'pelayans', 'pelayanans'));
    }

    public function update(Request $request, Tim $tim)
    {
        $request->validate([
            'nama_tim'    => 'required|string|max:16',
            'id_ibadah'   => 'required|exists:ibadahs,id',
            'keterangan'  => 'nullable|max:256',
        ]);

        $tim->update($request->all());

        return redirect()->route('tims.index')
            ->with('success','Tim berhasil diupdate');
    }

    public function destroy(Tim $tim)
    {
        $tim->delete();

        return redirect()->route('tims.index')
            ->with('success','Tim berhasil dihapus');
    }
}
