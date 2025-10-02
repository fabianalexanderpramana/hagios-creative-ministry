<nav x-data="{ open: false }" class="bg-white dark:bg-gray-800 border-b border-gray-100 dark:border-gray-700">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between h-16">
            
            <div class="shrink-0 flex items-center">
                <a href="{{ url('/') }}">
                    <img src="{{ asset('assets/images/logo_hcm_white.png') }}" alt="Logo HCM" class="h-8 w-auto">
                </a>
            </div>

            @auth
                <div class="flex">
                    <!-- Navigation Links -->
                    <div class="hidden space-x-8 sm:-my-px sm:ms-10 sm:flex">
                        <x-nav-link :href="route('dashboard')" :active="request()->routeIs('dashboard.*')">
                            {{ __('Dashboard') }}
                        </x-nav-link>

                        <x-nav-link :href="route('jadwals.index')" :active="request()->routeIs('jadwals.*')">
                            {{ __('Jadwal') }}
                        </x-nav-link>

                        <x-nav-link :href="route('ibadahs.index')" :active="request()->routeIs('ibadahs.*')">
                            {{ __('Ibadah') }}
                        </x-nav-link>

                        @if(Auth::user()->isAdmin())
                            <x-nav-link :href="route('pelayans.index')" :active="request()->routeIs('pelayans.*')">
                                {{ __('Pelayan') }}
                            </x-nav-link>

                            <x-nav-link :href="route('pelayanans.index')" :active="request()->routeIs('pelayanans.*')">
                                {{ __('Pelayanan') }}
                            </x-nav-link>

                            <x-nav-link :href="route('users.index')" :active="request()->routeIs('users.*')">
                                {{ __('User') }}
                            </x-nav-link>
                        @endif
                    </div>
                </div>

                <!-- Settings Dropdown -->
                <div class="hidden sm:flex sm:items-center sm:ms-6">
                    <x-dropdown align="right" width="48">
                        <x-slot name="trigger">
                            <button class="inline-flex items-center px-3 py-2 border border-transparent text-sm leading-4 font-medium rounded-md text-gray-500 dark:text-gray-400 bg-white dark:bg-gray-800 hover:text-gray-700 dark:hover:text-gray-300 focus:outline-none transition ease-in-out duration-150">
                                <!-- Username & Nama Pelayan -->
                                <div class="flex flex-col text-left">
                                    <span class="font-semibold text-gray-700 dark:text-gray-200">
                                        {{ Auth::user()->username }}
                                    </span>
                                    <span class="text-xs text-gray-500 dark:text-gray-400">
                                        {{ Auth::user()->pelayan->nama_pelayan ?? '-' }}
                                    </span>
                                </div>
                                <div class="ms-1">
                                    <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                                        <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0-1.414z" clip-rule="evenodd" />
                                    </svg>
                                </div>
                            </button>
                        </x-slot>

                        <x-slot name="content">
                            <x-dropdown-link :href="route('password.change.form')">
                                {{ __('Ganti Password') }}
                            </x-dropdown-link>
                            <form method="POST" action="{{ route('logout') }}">
                                @csrf
                                <x-dropdown-link :href="route('logout')"
                                        onclick="event.preventDefault();
                                                    this.closest('form').submit();">
                                    {{ __('Log Out') }}
                                </x-dropdown-link>
                            </form>
                        </x-slot>
                    </x-dropdown>
                </div>
            @endauth

            @guest
                <div></div>
            @endguest
        </div>
    </div>
</nav>
