@extends('layouts.app')

@section('title', 'Edit Presensi')

@section('content')
<div class="max-w-3xl mx-auto px-6 mt-8 space-y-4">
    <div class="flex justify-between items-center">
        <h1 class="text-2xl font-bold text-gray-800 dark:text-gray-100">Edit Presensi - {{ $jadwal->ibadah->nama_ibadah ?? '' }} ({{ optional($jadwal->tanggal)->format('d-m-Y') }})</h1>
    </div>

    <div class="bg-white dark:bg-gray-800 rounded-xl shadow p-6">
        <form action="{{ route('presensis.update', $jadwal->id) }}" method="POST" class="space-y-4">
            @csrf
            @method('PUT')

            @php
                $pelayanList = [
                    'Videotron' => $jadwal->videotron,
                    'Live OP' => $jadwal->live_op,
                    'Live Cam 1' => $jadwal->live_cam_1,
                    'Live Cam 2' => $jadwal->live_cam_2,
                    'Live Cam 3' => $jadwal->live_cam_3,
                    'Live Cam 4' => $jadwal->live_cam_4,
                    'Live Cam 5' => $jadwal->live_cam_5,
                    'Fotografer' => $jadwal->foto,
                ];
                $options = ['hadir' => 'Hadir', 'terlambat' => 'Terlambat', 'izin' => 'Izin', 'tidak hadir' => 'Tidak Hadir'];
            @endphp

            <div class="overflow-x-auto">
                <table class="min-w-full border-collapse">
                    <thead class="bg-gray-100 dark:bg-gray-700">
                        <tr>
                            <th class="px-4 py-2 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Bidang</th>
                            <th class="px-4 py-2 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Pelayan</th>
                            <th class="px-4 py-2 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Status Kehadiran</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-200 dark:divide-gray-700">
                    @foreach ($pelayanList as $label => $pelayan)
                        @if ($pelayan)
                        <tr>
                            <td class="px-4 py-2 text-gray-700 dark:text-gray-200">{{ $label }}</td>
                            <td class="px-4 py-2 text-gray-800 dark:text-gray-100 font-medium">{{ $pelayan->nama_pelayan }}</td>
                            <td class="px-4 py-2">
                                <select name="presensi[{{ $pelayan->id }}]" class="w-48 border-gray-300 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-100 rounded-lg px-3 py-2">
                                    <option value="">-- Pilih Status --</option>
                                    @foreach($options as $val => $text)
                                        <option value="{{ $val }}" {{ optional($existing[$pelayan->id])->status_kehadiran === $val ? 'selected' : '' }}>{{ $text }}</option>
                                    @endforeach
                                </select>
                            </td>
                        </tr>
                        @endif
                    @endforeach
                    </tbody>
                </table>
            </div>

            <div class="flex items-center gap-3 mt-5">
                <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white px-5 py-2 rounded-lg shadow">Simpan</button>
                <a href="{{ route('presensis.index') }}" class="text-gray-600 dark:text-gray-300 hover:underline">Batal</a>
            </div>
        </form>
    </div>
</div>
@endsection


