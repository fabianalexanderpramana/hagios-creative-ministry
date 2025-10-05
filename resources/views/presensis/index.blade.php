@extends('layouts.app')

@section('title', 'Presensi')

@section('content')
<div class="max-w-7xl mx-auto px-6 mt-8 space-y-6">
    <div class="flex justify-between items-center">
        <h1 class="text-2xl font-bold text-gray-800 dark:text-gray-100">Presensi</h1>
        @if(auth()->user()->role === 'ADMIN')
        <a href="{{ route('presensis.create') }}" class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg shadow transition">
            + Buat Presensi
        </a>
        @endif
    </div>

    <!-- Filter -->
    <div class="bg-white dark:bg-gray-800 rounded-xl shadow p-4 mb-4">
        <form id="filterForm" method="GET" action="{{ route('presensis.index') }}" 
            class="flex flex-col lg:flex-row flex-wrap gap-4 lg:gap-6 items-stretch lg:items-end">

            <!-- Filter Ibadah -->
            <div class="w-full sm:w-48">
                <label class="block text-sm font-medium text-gray-700 dark:text-gray-300">Ibadah</label>
                <select name="id_ibadah" 
                    class="auto-submit mt-1 block w-full rounded-lg border-gray-300 dark:border-gray-600 dark:bg-gray-700 dark:text-white">
                    <option value="">Semua</option>
                    @foreach($ibadahs as $ibadah)
                        <option value="{{ $ibadah->id }}" {{ ($id_ibadah == $ibadah->id) ? 'selected' : '' }}>
                            {{ $ibadah->nama_ibadah }}
                        </option>
                    @endforeach
                </select>
            </div>

            <!-- Filter Bulan -->
            <div class="w-full sm:w-32">
                <label class="block text-sm font-medium text-gray-700 dark:text-gray-300">Bulan</label>
                <select name="bulan" 
                    class="auto-submit mt-1 block w-full rounded-lg border-gray-300 dark:border-gray-600 dark:bg-gray-700 dark:text-white">
                    @for ($m = 1; $m <= 12; $m++)
                        <option value="{{ $m }}" {{ ($bulan == $m) ? 'selected' : '' }}>
                            {{ \Carbon\Carbon::create()->month($m)->translatedFormat('F') }}
                        </option>
                    @endfor
                </select>
            </div>

            <!-- Filter Tahun -->
            <div class="w-full sm:w-28">
                <label class="block text-sm font-medium text-gray-700 dark:text-gray-300">Tahun</label>
                <select name="tahun" 
                    class="auto-submit mt-1 block w-full rounded-lg border-gray-300 dark:border-gray-600 dark:bg-gray-700 dark:text-white">
                    @for ($y = 2025; $y <= now()->year + 1; $y++)
                        <option value="{{ $y }}" {{ ($tahun == $y) ? 'selected' : '' }}>
                            {{ $y }}
                        </option>
                    @endfor
                </select>
            </div>

            <!-- Tombol Reset -->
            <div class="flex flex-wrap items-center gap-2 w-full lg:w-auto mt-2 lg:mt-0">
                <a href="{{ route('presensis.index', ['reset' => 1]) }}" 
                    class="bg-gray-500 hover:bg-gray-600 text-white px-3 py-2 rounded-md text-sm shadow transition">
                    Reset
                </a>
            </div>
        </form>
    </div>

    <div class="bg-white dark:bg-gray-800 rounded-xl shadow overflow-hidden">
        <div class="overflow-x-auto">
            <table class="min-w-full border-collapse">
                <thead class="bg-gray-100 dark:bg-gray-700">
                    <tr>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Ibadah</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Tanggal</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Pelayan</th>
                        @if(Auth::user()->isAdmin())
                            <th class="px-6 py-3 text-center text-sm font-semibold text-gray-700 dark:text-gray-200">Aksi</th>
                        @endif
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200 dark:divide-gray-700">
                    @forelse ($jadwals as $jadwal)
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
                        @endphp
                        <tr class="hover:bg-gray-50 dark:hover:bg-gray-900 transition">
                            <td class="px-6 py-3 text-gray-800 dark:text-gray-100">
                                <span class="font-semibold">{{ $jadwal->ibadah->nama_ibadah }}</span><br>
                                <span class="text-sm text-gray-500 dark:text-gray-400">{{ $jadwal->ibadah->waktu }}</span>
                            </td>
                            <td class="px-6 py-3 text-gray-800 dark:text-gray-100">
                                {{ $jadwal->tanggal ? $jadwal->tanggal->format('d-m-Y') : '' }}
                            </td>
                            <td class="px-6 py-3">
                                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-2">
                                    @foreach ($pelayanList as $label => $pelayan)
                                        @if ($pelayan)
                                            @php
                                                $statusItem = optional(optional($presensiByJadwalPelayan[$jadwal->id] ?? collect())[$pelayan->id])->first();
                                                $status = optional($statusItem)->status_kehadiran;
                                                $textColor = 'text-gray-600 dark:text-gray-400';
                                                if ($status === 'hadir') $textColor = 'text-green-600 dark:text-green-400';
                                                elseif ($status === 'terlambat') $textColor = 'text-blue-600 dark:text-blue-400';
                                                elseif ($status === 'tidak hadir') $textColor = 'text-red-600 dark:text-red-400';
                                                elseif ($status === 'izin') $textColor = 'text-gray-500 dark:text-gray-400';
                                            @endphp
                                            <div class="flex items-center gap-2">
                                                <span class="text-xs text-gray-500 dark:text-gray-400 w-28">{{ $label }}</span>
                                                <span class="font-semibold {{ $textColor }} text-sm">{{ $pelayan->nama_pelayan }}</span>
                                            </div>
                                        @endif
                                    @endforeach
                                </div>
                            </td>
                            @if(Auth::user()->isAdmin())
                            <td class="px-6 py-3 text-center">
                                <a href="{{ route('presensis.edit', $jadwal->id) }}" 
                                class="bg-yellow-500 hover:bg-yellow-600 text-white px-3 py-1 rounded-lg text-sm shadow transition">
                                Edit
                                </a>
                            </td>
                            @endif
                        </tr>
                    @empty
                        <tr>
                            <td colspan="4" class="px-6 py-6 text-center text-gray-500 dark:text-gray-400">
                                Belum ada presensi
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        document.querySelectorAll('.auto-submit').forEach(function (el) {
            el.addEventListener('change', function () {
                const form = document.getElementById('filterForm');
                if (form) form.submit();
            });
        });
    });
    </script>
@endsection