@extends('layouts.app')

@section('title', 'Daftar Ibadah')

@section('content')
<div class="max-w-7xl mx-auto px-6 mt-8 space-y-6">
    <!-- Header -->
    <div class="flex justify-between items-center">
        <h1 class="text-2xl font-bold text-gray-800 dark:text-gray-100">
            Daftar Ibadah
        </h1>
        <a href="{{ route('ibadahs.create') }}" 
           class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg shadow transition">
           + Tambah Ibadah
        </a>
    </div>

    <!-- Table Card -->
    <div class="bg-white dark:bg-gray-800 rounded-xl shadow overflow-hidden">
        <div class="overflow-x-auto">
            <table class="min-w-full border-collapse">
                <thead class="bg-gray-100 dark:bg-gray-700">
                    <tr>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">
                            Nama Ibadah
                        </th>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700 dark:text-gray-200">
                            Waktu
                        </th>
                        <th class="px-6 py-3 text-center text-sm font-semibold text-gray-700 dark:text-gray-200">
                            Aksi
                        </th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200 dark:divide-gray-700">
                    @forelse ($ibadahs as $ibadah)
                        <tr class="hover:bg-gray-50 dark:hover:bg-gray-900 transition">
                            <td class="px-6 py-3 text-gray-800 dark:text-gray-100">
                                {{ $ibadah->nama_ibadah }}
                            </td>
                            <td class="px-6 py-3 text-gray-600 dark:text-gray-300">
                                {{ $ibadah->waktu }}
                            </td>
                            <td class="px-6 py-3 text-center">
                                <div class="flex justify-center gap-2">
                                    <a href="{{ route('ibadahs.edit', $ibadah->id) }}" 
                                       class="bg-yellow-500 hover:bg-yellow-600 text-white px-3 py-1 rounded-lg text-sm shadow transition">
                                        Edit
                                    </a>
                                    <form action="{{ route('ibadahs.destroy', $ibadah->id) }}" method="POST" 
                                          onsubmit="return confirm('Yakin ingin menghapus ibadah ini?');">
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
                            <td colspan="3" class="px-6 py-6 text-center text-gray-500 dark:text-gray-400">
                                Belum ada data ibadah
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
