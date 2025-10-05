@extends('layouts.app')

@section('title', 'Daftar Tim')

@section('content')
<div class="max-w-7xl mx-auto px-6 mt-8 space-y-6">
    <!-- Header -->
    <div class="flex justify-between items-center">
        <h1 class="text-2xl font-bold text-gray-800 dark:text-gray-100">
            Daftar Tim
        </h1>
        @if(auth()->user()->role === 'ADMIN')
        <a href="{{ route('tims.create') }}" 
           class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg shadow transition">
           + Tambah Tim
        </a>
        @endif
    </div>

    <!-- Filter -->
    <div class="bg-white dark:bg-gray-800 rounded-xl shadow p-4 mb-4">
        <form id="filterForm" method="GET" action="{{ route('tims.index') }}" 
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

            <!-- Tombol Reset -->
            <div class="flex flex-wrap items-center gap-2 w-full lg:w-auto mt-2 lg:mt-0">
                <a href="{{ route('tims.index', ['reset' => 1]) }}" 
                    class="bg-gray-500 hover:bg-gray-600 text-white px-3 py-2 rounded-md text-sm shadow transition">
                    Reset
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
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Nama Tim</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Ibadah</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Videotron</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Live OP</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Live Camera</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Foto</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Keterangan</th>
                        @if(Auth::user()->isAdmin())
                            <th class="px-6 py-3 text-center text-sm font-semibold text-gray-700 dark:text-gray-200">Aksi</th>
                        @endif
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200 dark:divide-gray-700">
                    @forelse ($tims as $tim)
                        <tr class="hover:bg-gray-50 dark:hover:bg-gray-900 transition">
                            <td class="px-6 py-3 text-gray-800 dark:text-gray-100">
                                <span class="font-semibold">{{ $tim->nama_tim }}</span>
                            </td>

                            <td class="px-6 py-3 text-gray-800 dark:text-gray-100">
                                <span class="font-semibold">{{ $tim->ibadah->nama_ibadah }}</span><br>
                                <span class="text-sm text-gray-500 dark:text-gray-400">{{ $tim->ibadah->waktu }}</span>
                            </td>

                            <!-- Videotron -->
                            <td class="px-6 py-3 text-gray-800 dark:text-gray-100">
                                {{ $tim->videotron->nama_pelayan ?? '' }}
                            </td>

                            <!-- Live OP -->
                            <td class="px-6 py-3 text-gray-800 dark:text-gray-100">
                                {{ $tim->live_op->nama_pelayan ?? '' }}
                            </td>

                            <!-- Live Cam 1-5 -->
                            <td class="px-6 py-3 text-gray-800 dark:text-gray-100">
                                @for ($i = 1; $i <= 5; $i++)
                                    @php $cam = "live_cam_$i"; @endphp
                                    @if ($tim->$cam)
                                    <div class="flex">
                                        <span class="w-4">{{ $i }}</span>
                                        <span class="mx-1">:&nbsp;&nbsp;</span>
                                        <span>{{ $tim->$cam->nama_pelayan }}</span>
                                    </div>
                                    @endif
                                @endfor
                            </td>

                            <!-- Foto -->
                            <td class="px-6 py-3 text-gray-800 dark:text-gray-100">
                                {{ $tim->foto->nama_pelayan ?? '' }}
                            </td>

                            <!-- Keterangan -->
                            <td class="px-6 py-3 text-gray-800 dark:text-gray-100">
                                {{ $tim->keterangan ?? '' }}
                            </td>

                            <!-- Aksi -->
                            @if(Auth::user()->isAdmin())
                            <td class="px-6 py-3 text-center">
                                <div class="flex justify-center gap-2">
                                    <a href="{{ route('tims.edit', $tim->id) }}" 
                                    class="bg-yellow-500 hover:bg-yellow-600 text-white px-3 py-1 rounded-lg text-sm shadow transition">
                                        Edit
                                    </a>
                                    <form action="{{ route('tims.destroy', $tim->id) }}" method="POST" 
                                        onsubmit="return confirm('Yakin ingin menghapus tim ini?');">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" 
                                                class="bg-red-600 hover:bg-red-700 text-white px-3 py-1 rounded-lg text-sm shadow transition">
                                            Hapus
                                        </button>
                                    </form>
                                </div>
                            </td>
                            @endif
                        </tr>
                    @empty
                        <tr>
                            <td colspan="8" class="px-6 py-6 text-center text-gray-500 dark:text-gray-400">
                                Belum ada tim
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Script auto submit filter -->
<script>
    document.querySelectorAll('.auto-submit').forEach(el => {
        el.addEventListener('change', () => {
            document.getElementById('filterForm').submit();
        });
    });
</script>

@endsection
