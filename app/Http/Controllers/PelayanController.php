<?php

namespace App\Http\Controllers;

use App\Models\Pelayan;
use App\Models\Pelayanan;
use App\Models\Ibadah;
use Illuminate\Http\Request;

class PelayanController extends Controller
{
    public function index(Request $request)
    {
        $id_ibadah = $request->input('id_ibadah');
        $id_pelayanan = $request->input('id_pelayanan');

        $query = Pelayan::with(['pelayanans','ibadahs'])
                    ->orderBy('nama_pelayan', 'asc');

        if ($id_ibadah) {
            $query->whereHas('ibadahs', function($q) use ($id_ibadah) {
                $q->where('ibadahs.id', $id_ibadah);
            });
        }

        if ($id_pelayanan) {
            $query->whereHas('pelayanans', function($q) use ($id_pelayanan) {
                $q->where('pelayanans.id', $id_pelayanan);
            });
        }

        $pelayans = $query->get();

        $ibadahs = Ibadah::all();
        $pelayanans = Pelayanan::all();

        return view('pelayans.index', compact('pelayans','ibadahs','pelayanans','id_ibadah','id_pelayanan'));
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
            $query->where('ibadahs.id', $ibadahId);
        })->get();

        return response()->json($pelayans);
    }
}
