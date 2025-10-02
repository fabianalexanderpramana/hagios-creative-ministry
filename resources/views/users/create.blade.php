@extends('layouts.app')

@section('title', 'Create User')

@section('content')
<div class="max-w-3xl mx-auto px-6 mt-8 space-y-4">
    <!-- Header -->
    <div class="flex justify-between items-center">
        <h1 class="text-2xl font-bold text-gray-800 dark:text-gray-100">
            Tambah User
        </h1>
    </div>

    <!-- Form Card -->
    <div class="bg-white dark:bg-gray-800 rounded-xl shadow p-6">
        <form action="{{ route('users.store') }}" method="POST" class="space-y-4">
            @csrf

            <!-- Pilih Pelayan -->
            <div>
                <label for="pelayan_id" class="block font-medium text-gray-700 dark:text-gray-200 mb-1">
                    Pelayan
                </label>
                <select name="pelayan_id" id="pelayan_id"
                        class="w-full border-gray-300 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-100 
                            rounded-lg px-3 py-2 focus:ring focus:ring-blue-200"
                        required>
                    <option value="">-- Pilih Pelayan --</option>
                    @foreach($pelayans as $pelayan)
                        <option value="{{ $pelayan->id }}">{{ $pelayan->nama_pelayan }}</option>
                    @endforeach
                </select>
            </div>

            <!-- Username -->
            <div>
                <label for="username" class="block font-medium text-gray-700 dark:text-gray-200 mb-1">
                    Username
                </label>
                <input type="text" name="username" id="username"
                       class="w-full border-gray-300 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-100 
                              rounded-lg px-3 py-2 focus:ring focus:ring-blue-200"
                       required>
            </div>

            <!-- Email -->
            <div>
                <label for="email" class="block font-medium text-gray-700 dark:text-gray-200 mb-1">
                    Email
                </label>
                <input type="email" name="email" id="email"
                       class="w-full border-gray-300 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-100 
                              rounded-lg px-3 py-2 focus:ring focus:ring-blue-200"
                       required>
            </div>

            <!-- Role -->
            <div>
                <label for="role" class="block font-medium text-gray-700 dark:text-gray-200 mb-1">
                    Role
                </label>
                <select name="role" id="role"
                        class="w-full border-gray-300 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-100 
                               rounded-lg px-3 py-2 focus:ring focus:ring-blue-200"
                        required>
                    <option value="ADMIN">ADMIN</option>
                    <option value="PELAYAN">PELAYAN</option>
                </select>
            </div>

            <!-- Tombol -->
            <div class="flex items-center gap-3 mt-5">
                <button type="submit"
                        class="bg-blue-600 hover:bg-blue-700 text-white px-5 py-2 rounded-lg shadow">
                    Simpan
                </button>
                <a href="{{ route('users.index') }}"
                   class="text-gray-600 dark:text-gray-300 hover:underline">
                    Batal
                </a>
            </div>
        </form>
    </div>
</div>
@endsection
