@extends('layouts.app')

@section('title', 'Edit User')

@section('content')
<div class="max-w-3xl mx-auto px-6 mt-8 space-y-4">
    <!-- Header -->
    <div class="flex justify-between items-center">
        <h1 class="text-2xl font-bold text-gray-800 dark:text-gray-100">
            Edit User
        </h1>
    </div>

    <!-- Form Card -->
    <div class="bg-white dark:bg-gray-800 rounded-xl shadow p-6">
        <form action="{{ route('users.update', $user->id) }}" method="POST" class="space-y-4"> 
            @csrf
            @method('PUT')

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
                        <option value="{{ $pelayan->id }}" 
                            {{ old('pelayan_id', $user->pelayan_id) == $pelayan->id ? 'selected' : '' }}>
                            {{ $pelayan->nama_pelayan }}
                        </option>
                    @endforeach
                </select>
            </div>

            <!-- Username -->
            <div>
                <label for="username" class="block font-medium text-gray-700 dark:text-gray-200 mb-1">
                    Username
                </label>
                <input type="text" name="username" id="username"
                       value="{{ old('username', $user->username) }}"
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
                       value="{{ old('email', $user->email) }}"
                       class="w-full border-gray-300 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-100 
                              rounded-lg px-3 py-2 focus:ring focus:ring-blue-200">
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
                    <option value="ADMIN" {{ old('role', $user->role) == 'ADMIN' ? 'selected' : '' }}>ADMIN</option>
                    <option value="PELAYAN" {{ old('role', $user->role) == 'PELAYAN' ? 'selected' : '' }}>PELAYAN</option>
                </select>
            </div>

            <!-- Tombol -->
            <div class="flex items-center gap-3 mt-5">
                <button type="submit"
                        class="bg-blue-600 hover:bg-blue-700 text-white px-5 py-2 rounded-lg shadow">
                    Update
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
