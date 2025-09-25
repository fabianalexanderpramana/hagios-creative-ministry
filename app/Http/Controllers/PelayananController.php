<?php

namespace App\Http\Controllers;

use App\Models\Pelayanan;
use Illuminate\Http\Request;

class PelayananController extends Controller
{
    public function index()
    {
        $pelayanans = Pelayanan::all();
        return view('pelayanans.index', compact('pelayanans'));
    }

    public function create()
    {
        return view('pelayanans.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama_pelayanan' => 'required|max:64',
        ]);

        Pelayanan::create($request->only('nama_pelayanan'));
        return redirect()->route('pelayanans.index')->with('success','Pelayanan berhasil ditambahkan');
    }

    public function edit(Pelayanan $pelayanan)
    {
        return view('pelayanans.edit', compact('pelayanan'));
    }

    public function update(Request $request, Pelayanan $pelayanan)
    {
        $request->validate([
            'nama_pelayanan' => 'required|max:64',
        ]);

        $pelayanan->update($request->only('nama_pelayanan'));
        return redirect()->route('pelayanans.index')->with('success','Pelayanan berhasil diupdate');
    }

    public function destroy(Pelayanan $pelayanan)
    {
        $pelayanan->delete();
        return redirect()->route('pelayanans.index')->with('success','Pelayanan berhasil dihapus');
    }
}
