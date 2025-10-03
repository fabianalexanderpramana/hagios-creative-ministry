@extends('layouts.app')

@section('title', 'Login')

@section('content')
<div class="min-h-auto flex items-center justify-center py-12">
    <div class="w-full max-w-xs sm:max-w-lg md:max-w-md lg:max-w-sm xl:max-w-sm px-6 space-y-6 py-12">
        <!-- Form Card -->
        <div class="bg-white dark:bg-gray-800 rounded-xl shadow p-6">
            <!-- Session Status -->
            <x-auth-session-status class="mb-4" :status="session('status')" />

            <div class="flex justify-center">
                <!-- Light mode logo (dark colored) -->
                <img src="{{ asset('assets/images/logo HCM-01.png') }}" alt="Logo HCM" class="h-16 w-auto dark:hidden">
                <!-- Dark mode logo (white/light colored) -->
                <img src="{{ asset('assets/images/logo_hcm_white.png') }}" alt="Logo HCM" class="h-16 w-auto hidden dark:block">
            </div>

            <h1 class="text-2xl font-bold text-gray-800 dark:text-gray-100 text-center mt-4">
                Login
            </h1>

            <form method="POST" action="{{ route('login') }}" class="space-y-4">
                @csrf

                <!-- Username -->
                <div>
                    <label for="username" class="block font-medium text-gray-700 dark:text-gray-200 mb-1">
                        Username
                    </label>
                    <input id="username" type="text" name="username"
                           value="{{ old('username') }}"
                           class="w-full border-gray-300 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-100
                                  rounded-lg px-3 py-2 focus:ring focus:ring-blue-200"
                           required autofocus>
                    @error('username')
                        <p class="text-red-600 text-sm mt-1">{{ $message }}</p>
                    @enderror
                </div>

                <!-- Password -->
                <div>
                    <label for="password" class="block font-medium text-gray-700 dark:text-gray-200 mb-1">
                        Password
                    </label>
                    <input id="password" type="password" name="password"
                           class="w-full border-gray-300 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-100
                                  rounded-lg px-3 py-2 focus:ring focus:ring-blue-200"
                           required autocomplete="current-password">
                    @error('password')
                        <p class="text-red-600 text-sm mt-1">{{ $message }}</p>
                    @enderror
                </div>

                <!-- Remember Me -->
                <div class="flex items-center">
                    <input id="remember_me" type="checkbox" name="remember"
                           class="rounded border-gray-300 dark:border-gray-700 text-blue-600 shadow-sm focus:ring-blue-500 dark:focus:ring-blue-600 dark:focus:ring-offset-gray-800">
                    <label for="remember_me" class="ml-2 text-sm text-gray-600 dark:text-gray-400">
                        Remember me
                    </label>
                </div>

                <!-- Tombol -->
                <div class="flex justify-end mt-6">
                    <button type="submit"
                            class="bg-blue-600 hover:bg-blue-700 text-white px-5 py-2 rounded-lg shadow">
                        Login
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

@endsection
