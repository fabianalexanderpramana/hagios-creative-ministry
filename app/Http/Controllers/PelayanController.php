<?php

namespace App\Http\Controllers;

use App\Models\Pelayan;
use App\Models\Pelayanan;
use App\Models\Ibadah;
use Illuminate\Http\Request;

class PelayanController extends Controller
{
    public function index()
    {
        $pelayans = Pelayan::with(['pelayanans','ibadahs'])->get();
        return view('pelayans.index', compact('pelayans'));
    }

    public function create()
    {
        $pelayanans = Pelayanan::all();
        $ibadahs = Ibadah::all();
        return view('pelayans.create', compact('pelayanans','ibadahs'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama_pelayan' => 'required|max:64',
            'tgl_lahir' => 'nullable|date',
        ]);

        $pelayan = Pelayan::create($request->only('nama_pelayan','tgl_lahir'));

        $pelayan->pelayanans()->sync($request->input('pelayanans', []));
        $pelayan->ibadahs()->sync($request->input('ibadahs', []));

        return redirect()->route('pelayans.index')->with('success','Pelayan berhasil ditambahkan');
    }

    public function edit(Pelayan $pelayan)
    {
        $pelayanans = Pelayanan::all();
        $ibadahs = Ibadah::all();
        $pelayanan_ids = $pelayan->pelayanans->pluck('id')->toArray();
        $ibadah_ids = $pelayan->ibadahs->pluck('id')->toArray();

        return view('pelayans.edit', compact('pelayan','pelayanans','ibadahs','pelayanan_ids','ibadah_ids'));
    }

    public function update(Request $request, Pelayan $pelayan)
    {
        $request->validate([
            'nama_pelayan' => 'required|max:64',
            'tgl_lahir' => 'nullable|date',
        ]);

        $pelayan->update($request->only('nama_pelayan','tgl_lahir'));
        $pelayan->pelayanans()->sync($request->input('pelayanans', []));
        $pelayan->ibadahs()->sync($request->input('ibadahs', []));

        return redirect()->route('pelayans.index')->with('success','Pelayan berhasil diupdate');
    }

    public function destroy(Pelayan $pelayan)
    {
        $pelayan->delete();
        return redirect()->route('pelayans.index')->with('success','Pelayan berhasil dihapus');
    }

    public function getByIbadah($ibadahId)
{
    $pelayans = Pelayan::whereHas('ibadahs', function($query) use ($ibadahId) {
        $query->where('ibadahs.id', $ibadahId); // 👈 tambahkan nama tabel
    })->get();

    return response()->json($pelayans);
}

}
