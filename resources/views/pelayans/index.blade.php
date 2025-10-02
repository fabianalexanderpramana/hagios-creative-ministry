@extends('layouts.app')

@section('title', 'Daftar Pelayan')

@section('content')
<div class="max-w-7xl mx-auto px-6 mt-8 space-y-6">
    <!-- Header -->
    <div class="flex justify-between items-center">
        <h1 class="text-2xl font-bold text-gray-800 dark:text-gray-100">
            Daftar Pelayan
        </h1>
        <a href="{{ route('pelayans.create') }}" 
           class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg shadow transition">
           + Tambah Pelayan
        </a>
    </div>

    <!-- Filter -->
    <div class="bg-white dark:bg-gray-800 rounded-xl shadow p-4 mb-4">
        <form id="filterForm" method="GET" action="{{ route('pelayans.index') }}" 
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

            <!-- Filter Pelayanan -->
            <div class="w-full sm:w-48">
                <label class="block text-sm font-medium text-gray-700 dark:text-gray-300">Pelayanan</label>
                <select name="id_pelayanan" 
                    class="auto-submit mt-1 block w-full rounded-lg border-gray-300 dark:border-gray-600 dark:bg-gray-700 dark:text-white">
                    <option value="">Semua</option>
                    @foreach($pelayanans as $pelayanan)
                        <option value="{{ $pelayanan->id }}" {{ ($id_pelayanan == $pelayanan->id) ? 'selected' : '' }}>
                            {{ $pelayanan->nama_pelayanan }}
                        </option>
                    @endforeach
                </select>
            </div>

            <!-- Tombol Reset -->
            <div class="flex flex-wrap items-center gap-2 w-full lg:w-auto mt-2 lg:mt-0">
                <a href="{{ route('pelayans.index', ['reset' => 1]) }}" 
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
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Nama Pelayan</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Tanggal Lahir</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Pelayanan</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">Ibadah</th>
                        <th class="px-6 py-3 text-center text-sm font-semibold text-gray-700 dark:text-gray-200">Aksi</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200 dark:divide-gray-700">
                    @forelse ($pelayans as $pelayan)
                        <tr class="hover:bg-gray-50 dark:hover:bg-gray-900 transition">
                            <td class="px-6 py-3 text-gray-800 dark:text-gray-100">
                                {{ $pelayan->nama_pelayan }}
                            </td>
                            <td class="px-6 py-3 text-gray-600 dark:text-gray-300">
                                {{ $pelayan->tgl_lahir ?? '-' }}
                            </td>
                            <td class="px-6 py-3 text-gray-800 dark:text-gray-100">
                                @forelse ($pelayan->pelayanans as $p)
                                    <div class="flex">
                                        <li class="before:content-['•'] before:mr-2 before:text-gray-700">{{ $p->nama_pelayanan }}</li>
                                    </div>
                                @empty
                                    <span class="text-gray-800 dark:text-gray-100">-</span>
                                @endforelse
                            </td>
                            <td class="px-6 py-3 text-gray-800 dark:text-gray-100">
                                @forelse ($pelayan->ibadahs as $i)
                                    <div class="flex">
                                        <li class="before:content-['•'] before:mr-2 before:text-gray-700">{{ $i->nama_ibadah }}</li>
                                    </div>
                                @empty
                                    <span class="text-gray-800 dark:text-gray-100">-</span>
                                @endforelse
                            </td>
                            <td class="px-6 py-3 text-center">
                                <div class="flex justify-center gap-2">
                                    <a href="{{ route('pelayans.edit', $pelayan->id) }}" 
                                       class="bg-yellow-500 hover:bg-yellow-600 text-white px-3 py-1 rounded-lg text-sm shadow transition">
                                        Edit
                                    </a>
                                    <form action="{{ route('pelayans.destroy', $pelayan->id) }}" method="POST" 
                                          onsubmit="return confirm('Yakin ingin menghapus pelayan ini?');">
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
                            <td colspan="5" class="px-6 py-4 text-center text-gray-500 dark:text-gray-400">
                                Belum ada data pelayan.
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
