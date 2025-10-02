@extends('layouts.app')

@section('title', 'Jadwal Saya')

@section('content')
<div class="max-w-7xl mx-auto px-6 mt-8 space-y-6">
    <!-- Header -->
    <div class="flex flex-col gap-1">
        <h2 class="text-lg font-medium text-gray-600 dark:text-gray-300 mb-3">
            Selamat melayani, {{ Auth::user()->pelayan->nama_pelayan ?? '-' }} 👋
        </h2>

        <h1 class="text-2xl font-bold text-gray-800 dark:text-gray-100">
            Jadwal Saya
        </h1>
    </div>

    <!-- Table Card -->
    <div class="bg-white dark:bg-gray-800 rounded-xl shadow overflow-hidden">
        <div class="overflow-x-auto">
            <table class="min-w-full border-collapse">
                <thead class="bg-gray-100 dark:bg-gray-700">
                    <tr>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Tanggal</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Ibadah</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Pelayanan</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Keterangan</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200 dark:divide-gray-700">
                    @forelse ($jadwals as $jadwal)
                        <tr class="hover:bg-gray-50 dark:hover:bg-gray-900 transition">
                            <!-- Tanggal -->
                            <td class="px-6 py-3 text-gray-800 dark:text-gray-100">
                                {{ $jadwal->tanggal ? $jadwal->tanggal->format('d-m-Y') : '-' }}
                            </td>

                            <!-- Ibadah -->
                            <td class="px-6 py-3 text-gray-800 dark:text-gray-100">
                                <span class="font-semibold">{{ $jadwal->ibadah->nama_ibadah ?? '-' }}</span><br>
                                <span class="text-sm text-gray-500 dark:text-gray-400">
                                    {{ $jadwal->ibadah->waktu ?? '' }}
                                </span>
                            </td>

                            <!-- Pelayanan -->
                            <td class="px-6 py-3 text-gray-800 dark:text-gray-100">
                                @php
                                    $role = '';
                                    $pelayanId = auth()->user()->pelayan->id ?? null;
                                    if ($jadwal->id_videotron == $pelayanId) $role = 'Videotron';
                                    elseif ($jadwal->id_live_op == $pelayanId) $role = 'Live Operator';
                                    elseif ($jadwal->id_live_cam_1 == $pelayanId) $role = 'Live Cam 1';
                                    elseif ($jadwal->id_live_cam_2 == $pelayanId) $role = 'Live Cam 2';
                                    elseif ($jadwal->id_live_cam_3 == $pelayanId) $role = 'Live Cam 3';
                                    elseif ($jadwal->id_live_cam_4 == $pelayanId) $role = 'Live Cam 4';
                                    elseif ($jadwal->id_live_cam_5 == $pelayanId) $role = 'Live Cam 5';
                                    elseif ($jadwal->id_foto == $pelayanId) $role = 'Fotografer';
                                @endphp
                                {{ $role }}
                            </td>

                            <!-- Keterangan -->
                            <td class="px-6 py-3 text-gray-800 dark:text-gray-100">
                                {{ $jadwal->keterangan ?? '-' }}
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="4" class="px-6 py-6 text-center text-gray-500 dark:text-gray-400">
                                Belum ada jadwal untuk Anda
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
