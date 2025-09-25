@extends('layouts.app')

@section('title', 'Edit Pelayanan')

@section('content')
<div class="max-w-3xl mx-auto px-6 mt-8 space-y-4">
    <!-- Header -->
    <div class="flex justify-between items-center">
        <h1 class="text-2xl font-bold text-gray-800 dark:text-gray-100">
            Edit Pelayanan
        </h1>
    </div>

    <!-- Form Card -->
    <div class="bg-white dark:bg-gray-800 rounded-xl shadow p-6">
        <form action="{{ route('pelayanans.update', $pelayanan->id) }}" method="POST" class="space-y-4">
            @csrf
            @method('PUT')

            <!-- Nama Pelayanan -->
            <div>
                <label for="nama_pelayanan" class="block font-medium text-gray-700 dark:text-gray-200 mb-1">
                    Nama Pelayanan
                </label>
                <input type="text" name="nama_pelayanan" id="nama_pelayanan"
                       value="{{ old('nama_pelayanan', $pelayanan->nama_pelayanan) }}"
                       class="w-full border-gray-300 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-100
                              rounded-lg px-3 py-2 focus:ring focus:ring-blue-200"
                       required>
            </div>

            <!-- Tombol -->
            <div class="flex items-center gap-3 mt-5">
                <button type="submit"
                        class="bg-blue-600 hover:bg-blue-700 text-white px-5 py-2 rounded-lg shadow">
                    Update
                </button>
                <a href="{{ route('pelayanans.index') }}"
                   class="text-gray-600 dark:text-gray-300 hover:underline">
                    Batal
                </a>
            </div>
        </form>
    </div>
</div>
@endsection
