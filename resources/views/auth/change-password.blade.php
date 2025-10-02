@extends('layouts.app')

@section('title', 'Ganti Password')

@section('content')
<div class="max-w-3xl mx-auto px-6 mt-8 space-y-4">
    <!-- Header -->
    <div class="flex justify-between items-center">
        <h1 class="text-2xl font-bold text-gray-800 dark:text-gray-100">
            Ganti Password
        </h1>
    </div>

    <!-- Form Card -->
    <div class="bg-white dark:bg-gray-800 rounded-xl shadow p-6">
        <form action="{{ route('password.change') }}" method="POST" class="space-y-4">
            @csrf

            <!-- Password Lama -->
            <div>
                <label for="current_password" class="block font-medium text-gray-700 dark:text-gray-200 mb-1">
                    Password Lama
                </label>
                <input id="current_password" type="password" name="current_password"
                       class="w-full border-gray-300 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-100
                              rounded-lg px-3 py-2 focus:ring focus:ring-blue-200"
                       required>
                @error('current_password')
                    <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
                @enderror
            </div>

            <!-- Password Baru -->
            <div>
                <label for="password" class="block font-medium text-gray-700 dark:text-gray-200 mb-1">
                    Password Baru
                </label>
                <input id="password" type="password" name="password"
                       class="w-full border-gray-300 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-100
                              rounded-lg px-3 py-2 focus:ring focus:ring-blue-200"
                       required>
                @error('password')
                    <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
                @enderror
            </div>

            <!-- Konfirmasi Password -->
            <div>
                <label for="password_confirmation" class="block font-medium text-gray-700 dark:text-gray-200 mb-1">
                    Konfirmasi Password
                </label>
                <input id="password_confirmation" type="password" name="password_confirmation"
                       class="w-full border-gray-300 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-100
                              rounded-lg px-3 py-2 focus:ring focus:ring-blue-200"
                       required>
                @error('password_confirmation')
                    <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
                @enderror
            </div>

            <!-- Tombol -->
            <div class="flex items-center gap-3 mt-5">
                <button type="submit"
                        class="bg-blue-600 hover:bg-blue-700 text-white px-5 py-2 rounded-lg shadow">
                    Simpan
                </button>
                <a href="{{ route('dashboard') }}"
                   class="text-gray-600 dark:text-gray-300 hover:underline">
                    Batal
                </a>
            </div>
        </form>
    </div>
</div>
@endsection
