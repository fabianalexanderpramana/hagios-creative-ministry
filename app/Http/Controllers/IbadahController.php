<?php

namespace App\Http\Controllers;

use App\Models\Ibadah;
use Illuminate\Http\Request;

class IbadahController extends Controller
{
    public function index()
    {
        $ibadahs = Ibadah::all();
        return view('ibadahs.index', compact('ibadahs'));
    }

    public function create()
    {
        return view('ibadahs.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama_ibadah' => 'required|max:64',
            'waktu' => 'required|max:128',
        ]);

        Ibadah::create($request->only('nama_ibadah','waktu'));
        return redirect()->route('ibadahs.index')->with('success','Ibadah berhasil ditambahkan');
    }

    public function edit(Ibadah $ibadah)
    {
        return view('ibadahs.edit', compact('ibadah'));
    }

    public function update(Request $request, Ibadah $ibadah)
    {
        $request->validate([
            'nama_ibadah' => 'required|max:64',
            'waktu' => 'required|max:128',
        ]);

        $ibadah->update($request->only('nama_ibadah','waktu'));
        return redirect()->route('ibadahs.index')->with('success','Ibadah berhasil diupdate');
    }

    public function destroy(Ibadah $ibadah)
    {
        $ibadah->delete();
        return redirect()->route('ibadahs.index')->with('success','Ibadah berhasil dihapus');
    }
}
