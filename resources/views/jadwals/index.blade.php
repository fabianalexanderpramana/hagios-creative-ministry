@extends('layouts.app')

@section('title', 'Daftar Jadwal')

@section('content')
<div class="max-w-7xl mx-auto px-6 mt-8 space-y-6">
    <!-- Header -->
    <div class="flex justify-between items-center">
        <h1 class="text-2xl font-bold text-gray-800 dark:text-gray-100">
            Daftar Jadwal
        </h1>
        <a href="{{ route('jadwals.create') }}" 
           class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg shadow transition">
           + Tambah Jadwal
        </a>
    </div>

    <!-- Filter -->
    <div class="bg-white dark:bg-gray-800 rounded-xl shadow p-4 mb-4">
        <form method="GET" action="{{ route('jadwals.index') }}" 
            class="flex flex-wrap gap-6 items-end">
            
            <!-- Filter Ibadah -->
            <div>
                <label class="block text-sm font-medium text-gray-700 dark:text-gray-300">Ibadah</label>
                <select name="id_ibadah" 
                        class="mt-1 block w-48 rounded-lg border-gray-300 dark:border-gray-600 dark:bg-gray-700 dark:text-white">
                    <option value="">Semua</option>
                    @foreach($ibadahs as $ibadah)
                        <option value="{{ $ibadah->id }}" {{ request('id_ibadah') == $ibadah->id ? 'selected' : '' }}>
                            {{ $ibadah->nama_ibadah }}
                        </option>
                    @endforeach
                </select>
            </div>

            <!-- Filter Bulan -->
            <div>
                <label class="block text-sm font-medium text-gray-700 dark:text-gray-300">Bulan</label>
                <select name="bulan" 
                        class="mt-1 block w-32 rounded-lg border-gray-300 dark:border-gray-600 dark:bg-gray-700 dark:text-white">
                    <option value="">Semua</option>
                    @for ($m = 1; $m <= 12; $m++)
                        <option value="{{ $m }}" {{ request('bulan') == $m ? 'selected' : '' }}>
                            {{ \Carbon\Carbon::create()->month($m)->translatedFormat('F') }}
                        </option>
                    @endfor
                </select>
            </div>

            <!-- Filter Tahun -->
            <div>
                <label class="block text-sm font-medium text-gray-700 dark:text-gray-300">Tahun</label>
                <input type="number" name="tahun" value="{{ request('tahun', now()->year) }}" 
                    class="mt-1 block w-28 rounded-lg border-gray-300 dark:border-gray-600 dark:bg-gray-700 dark:text-white">
            </div>

            <!-- Tombol Filter, Reset, Export -->
            <div class="flex items-center gap-2">
                <button type="submit" 
                    class="bg-blue-600 hover:bg-blue-700 text-white px-3 py-1.5 rounded-md text-sm shadow transition">
                    Filter
                </button>
                <a href="{{ route('jadwals.index') }}" 
                class="bg-gray-500 hover:bg-gray-600 text-white px-3 py-1.5 rounded-md text-sm shadow transition">
                    Reset
                </a>
                <a href="{{ route('jadwals.export.pdf', request()->query()) }}"
                class="bg-red-600 hover:bg-red-700 text-white px-3 py-1.5 rounded-md text-sm shadow transition">
                    Export PDF
                </a>
            </div>
        </form>
    </div>

    <!-- Table Card -->
    <div class="bg-white dark:bg-gray-800 rounded-xl shadow overflow-hidden">
        <div class="overflow-x-auto">
            <table class="min-w-full border-collapse">
                <thead class="bg-gray-100 dark:bg-gray-700">
                    <tr>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Ibadah</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Tanggal</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Videotron</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Live OP</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Live Camera</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Foto</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Keterangan</th>
                        <th class="px-6 py-3 text-center text-sm font-semibold text-gray-700 dark:text-gray-200">Aksi</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200 dark:divide-gray-700">
                    @forelse ($jadwals as $jadwal)
                        <tr class="hover:bg-gray-50 dark:hover:bg-gray-900 transition">
                            <td class="px-6 py-3 text-gray-800 dark:text-gray-100">
                                <span class="font-semibold">{{ $jadwal->ibadah->nama_ibadah }}</span><br>
                                <span class="text-sm text-gray-500 dark:text-gray-400">{{ $jadwal->ibadah->waktu }}</span>
                            </td>

                            <!-- Tanggal -->
                            <td class="px-6 py-3 text-gray-800 dark:text-gray-100">
                                {{ $jadwal->tanggal ? $jadwal->tanggal->format('d-m-Y') : '-' }}
                            </td>

                            <!-- Videotron -->
                            <td class="px-6 py-3 text-gray-800 dark:text-gray-100">
                                {{ $jadwal->videotron->nama_pelayan ?? '-' }}
                            </td>

                            <!-- Live OP -->
                            <td class="px-6 py-3 text-gray-800 dark:text-gray-100">
                                {{ $jadwal->live_op->nama_pelayan ?? '-' }}
                            </td>

                            <!-- Live Cam 1-5 -->
                            <td class="px-6 py-3 text-gray-800 dark:text-gray-100">
                                @for ($i = 1; $i <= 5; $i++)
                                    @php $cam = "live_cam_$i"; @endphp
                                    @if ($jadwal->$cam)
                                    <div class="flex">
                                        <span class="w-4">{{ $i }}</span>
                                        <span class="mx-1">:&nbsp;&nbsp;</span>
                                        <span>{{ $jadwal->$cam->nama_pelayan }}</span>
                                    </div>
                                    @endif
                                @endfor
                            </td>

                            <!-- Foto -->
                            <td class="px-6 py-3 text-gray-800 dark:text-gray-100">
                                {{ $jadwal->foto->nama_pelayan ?? '-' }}
                            </td>

                            <!-- Keterangan -->
                            <td class="px-6 py-3 text-gray-800 dark:text-gray-100">
                                {{ $jadwal->keterangan ?? '-' }}
                            </td>

                            <!-- Aksi -->
                            <td class="px-6 py-3 text-center">
                                <div class="flex justify-center gap-2">
                                    <a href="{{ route('jadwals.edit', $jadwal->id) }}" 
                                       class="bg-yellow-500 hover:bg-yellow-600 text-white px-3 py-1 rounded-lg text-sm shadow transition">
                                        Edit
                                    </a>
                                    <form action="{{ route('jadwals.destroy', $jadwal->id) }}" method="POST" 
                                          onsubmit="return confirm('Yakin ingin menghapus jadwal ini?');">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" 
                                                class="bg-red-600 hover:bg-red-700 text-white px-3 py-1 rounded-lg text-sm shadow transition">
                                            Hapus
                                        </button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="8" class="px-6 py-6 text-center text-gray-500 dark:text-gray-400">
                                Belum ada jadwal
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
