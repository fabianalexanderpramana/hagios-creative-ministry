@extends('layouts.app')

@section('title', 'Edit Pelayan')

@section('content')
<div class="max-w-3xl mx-auto px-6 mt-8 space-y-4">
    <!-- Header -->
    <div class="flex justify-between items-center">
        <h1 class="text-2xl font-bold text-gray-800 dark:text-gray-100">
            Edit Pelayan
        </h1>
    </div>

    <!-- Form Card -->
    <div class="bg-white dark:bg-gray-800 rounded-xl shadow p-6">
        <form action="{{ route('pelayans.update', $pelayan->id) }}" method="POST" class="space-y-4"> 
            @csrf
            @method('PUT')

            <!-- Nama -->
            <div>
                <label for="nama_pelayan" class="block font-medium text-gray-700 dark:text-gray-200 mb-1">
                    Nama Pelayan
                </label>
                <input type="text" name="nama_pelayan" id="nama_pelayan"
                       value="{{ old('nama_pelayan', $pelayan->nama_pelayan) }}"
                       class="w-full border-gray-300 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-100 
                              rounded-lg px-3 py-2 focus:ring focus:ring-blue-200"
                       required>
            </div>

            <!-- Tanggal Lahir -->
            <div>
                <label for="tgl_lahir" class="block font-medium text-gray-700 dark:text-gray-200 mb-1">
                    Tanggal Lahir
                </label>
                <input type="date" name="tgl_lahir" id="tgl_lahir"
                       value="{{ old('tgl_lahir', $pelayan->tgl_lahir) }}"
                       class="w-full border-gray-300 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-100 
                              rounded-lg px-3 py-2 focus:ring focus:ring-blue-200 appearance-none">
            </div>

            <!-- Pelayanan -->
            <div>
                <label class="block font-medium text-gray-700 dark:text-gray-200 mb-2">
                    Pelayanan yang Bisa
                </label>
                <div class="grid grid-cols-2 md:grid-cols-3 gap-2">
                    @foreach ($pelayanans as $pelayanan)
                        <label class="flex items-center space-x-2 bg-gray-50 dark:bg-gray-700 px-2 py-1 rounded">
                            <input type="checkbox" name="pelayanans[]" value="{{ $pelayanan->id }}"
                                   {{ in_array($pelayanan->id, $pelayanan_ids) ? 'checked' : '' }}>
                            <span class="text-gray-700 dark:text-gray-200">{{ $pelayanan->nama_pelayanan }}</span>
                        </label>
                    @endforeach
                </div>
            </div>

            <!-- Ibadah -->
            <div>
                <label class="block font-medium text-gray-700 dark:text-gray-200 mb-2">
                    Ibadah yang Bisa
                </label>
                <div class="grid grid-cols-2 md:grid-cols-3 gap-2">
                    @foreach ($ibadahs as $ibadah)
                        <label class="flex items-center space-x-2 bg-gray-50 dark:bg-gray-700 px-2 py-1 rounded">
                            <input type="checkbox" name="ibadahs[]" value="{{ $ibadah->id }}"
                                   {{ in_array($ibadah->id, $ibadah_ids) ? 'checked' : '' }}>
                            <span class="text-gray-700 dark:text-gray-200">{{ $ibadah->nama_ibadah }}</span>
                        </label>
                    @endforeach
                </div>
            </div>

            <!-- Tombol -->
            <div class="flex items-center gap-3 mt-5">
                <button type="submit"
                        class="bg-blue-600 hover:bg-blue-700 text-white px-5 py-2 rounded-lg shadow">
                    Update
                </button>
                <a href="{{ route('pelayans.index') }}"
                   class="text-gray-600 dark:text-gray-300 hover:underline">
                    Batal
                </a>
            </div>
        </form>
    </div>
</div>

<style>
    input[type="date"]::-webkit-calendar-picker-indicator {
        filter: invert(1); 
    }
</style>
@endsection
