<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Pelayan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function index()
    {
        $users = User::with('pelayan')->get();
        return view('users.index', compact('users'));
    }

    public function create()
    {
        $pelayans = Pelayan::doesntHave('user')->get();
        return view('users.create', compact('pelayans'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'pelayan_id' => 'required|exists:pelayans,id',
            'username'   => 'required|unique:users,username',
            'email'      => 'nullable|email|unique:users,email',
            'role'       => 'required|in:ADMIN,PELAYAN',
        ]);

        $pelayan = Pelayan::findOrFail($request->pelayan_id);

        // default password = tgl lahir pelayan (ddmmyyyy)
        $password = $pelayan->tgl_lahir
            ? date('dmY', strtotime($pelayan->tgl_lahir))
            : '12345678';

        User::create([
            'pelayan_id' => $pelayan->id,
            'username'   => $request->username,
            'email'      => $request->email,
            'role'       => $request->role,
            'password'   => Hash::make($password),
        ]);

        return redirect()->route('users.index')->with('success', 'User berhasil dibuat');
    }

    public function edit($id)
    {
        $user = User::with('pelayan')->findOrFail($id);
        $pelayans = Pelayan::all();
        return view('users.edit', compact('user', 'pelayans'));
    }

    public function update(Request $request, $id)
    {
        $user = User::findOrFail($id);

        $request->validate([
            'pelayan_id' => 'required|exists:pelayans,id',
            'username'   => 'required|unique:users,username,' . $user->id,
            'email'      => 'nullable|email|unique:users,email,' . $user->id,
            'role'       => 'required|in:ADMIN,PELAYAN',
        ]);

        $user->update([
            'pelayan_id' => $request->pelayan_id,
            'username'   => $request->username,
            'email'      => $request->email,
            'role'       => $request->role,
        ]);

        return redirect()->route('users.index')->with('success', 'User berhasil diupdate');
    }

    /**
     * Reset password user -> tgl lahir pelayan (ddmmyyyy)
     */
    public function resetPassword($id)
    {
        $user = User::with('pelayan')->findOrFail($id);

        if (!$user->pelayan || !$user->pelayan->tgl_lahir) {
            return redirect()->back()->with('error', 'Tanggal lahir pelayan tidak tersedia.');
        }

        $newPassword = date('dmY', strtotime($user->pelayan->tgl_lahir));

        $user->update([
            'password' => Hash::make($newPassword),
        ]);

        return redirect()->back()->with('success', 'Password berhasil direset ke ' . $newPassword);
    }
}
