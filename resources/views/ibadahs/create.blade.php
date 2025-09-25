@extends('layouts.app')

@section('title', 'Create Ibadah')

@section('content')
<div class="max-w-3xl mx-auto px-6 mt-8 space-y-4">
    <!-- Header -->
    <div class="flex justify-between items-center">
        <h1 class="text-2xl font-bold text-gray-800 dark:text-gray-100">
            Tambah Ibadah
        </h1>
    </div>

    <!-- Form Card -->
    <div class="bg-white dark:bg-gray-800 rounded-xl shadow p-6">
        <form action="{{ route('ibadahs.store') }}" method="POST" class="space-y-4">
            @csrf

            <!-- Nama Ibadah -->
            <div>
                <label for="nama_ibadah" class="block font-medium text-gray-700 dark:text-gray-200 mb-1">
                    Nama Ibadah
                </label>
                <input type="text" name="nama_ibadah" id="nama_ibadah"
                       value="{{ old('nama_ibadah') }}"
                       class="w-full border-gray-300 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-100 
                              rounded-lg px-3 py-2 focus:ring focus:ring-blue-200"
                       required>
            </div>

            <!-- Waktu -->
            <div>
                <label for="waktu" class="block font-medium text-gray-700 dark:text-gray-200 mb-1">
                    Waktu
                </label>
                <input type="text" name="waktu" id="waktu"
                       value="{{ old('waktu') }}"
                       class="w-full border-gray-300 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-100 
                              rounded-lg px-3 py-2 focus:ring focus:ring-blue-200"
                       required>
            </div>

            <!-- Tombol -->
            <div class="flex items-center gap-3 mt-5">
                <button type="submit"
                        class="bg-blue-600 hover:bg-blue-700 text-white px-5 py-2 rounded-lg shadow">
                    Simpan
                </button>
                <a href="{{ route('ibadahs.index') }}"
                   class="text-gray-600 dark:text-gray-300 hover:underline">
                    Batal
                </a>
            </div>
        </form>
    </div>
</div>
@endsection
