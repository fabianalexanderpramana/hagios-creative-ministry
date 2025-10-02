@php
    $navLinks = [
        ['label' => 'Dashboard', 'route' => 'dashboard', 'adminOnly' => false],
        ['label' => 'Jadwal', 'route' => 'jadwals.index', 'adminOnly' => false],
        ['label' => 'Ibadah', 'route' => 'ibadahs.index', 'adminOnly' => false],
        ['label' => 'Pelayan', 'route' => 'pelayans.index', 'adminOnly' => true],
        ['label' => 'Pelayanan', 'route' => 'pelayanans.index', 'adminOnly' => true],
        ['label' => 'User', 'route' => 'users.index', 'adminOnly' => true],
    ];
@endphp

<nav x-data="{ open: false }" class="bg-white dark:bg-gray-800 border-b border-gray-100 dark:border-gray-700">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between h-16">

            <!-- Logo -->
            <div class="shrink-0 flex items-center">
                <a href="{{ url('/') }}">
                    <img src="{{ asset('assets/images/logo_hcm_white.png') }}" alt="Logo HCM" class="h-8 w-auto">
                </a>
            </div>

            @auth
            <!-- Desktop Menu -->
            <div class="hidden sm:flex sm:items-center sm:space-x-8 sm:ms-10">
                @foreach($navLinks as $link)
                    @if(!$link['adminOnly'] || (optional(Auth::user())->isAdmin() && $link['adminOnly']))
                        <a href="{{ route($link['route']) }}"
                           class="px-3 py-2 rounded-md text-sm font-medium
                                  {{ request()->routeIs($link['route'].'*') 
                                      ? 'bg-gray-200 dark:bg-gray-700 text-gray-900 dark:text-white' 
                                      : 'text-gray-500 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-900 hover:text-gray-700 dark:hover:text-gray-300' }}">
                            {{ __($link['label']) }}
                        </a>
                    @endif
                @endforeach
            </div>

            <!-- User Dropdown -->
            <div class="hidden sm:flex sm:items-center sm:ms-6">
                <x-dropdown align="right" width="48">
                    <x-slot name="trigger">
                        <button class="inline-flex items-center px-3 py-2 border border-transparent text-sm font-medium rounded-md text-gray-500 dark:text-gray-400 bg-white dark:bg-gray-800 hover:text-gray-700 dark:hover:text-gray-300 focus:outline-none transition ease-in-out duration-150">
                            <div class="flex flex-col text-left">
                                <span class="font-semibold text-gray-700 dark:text-gray-200">{{ Auth::user()->username }}</span>
                                <span class="text-xs text-gray-500 dark:text-gray-400">{{ Auth::user()->pelayan->nama_pelayan ?? '-' }}</span>
                            </div>
                            <div class="ms-1">
                                <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0-1.414z" clip-rule="evenodd" />
                                </svg>
                            </div>
                        </button>
                    </x-slot>

                    <x-slot name="content">
                        <x-dropdown-link :href="route('password.change.form')">{{ __('Ganti Password') }}</x-dropdown-link>
                        <form method="POST" action="{{ route('logout') }}">
                            @csrf
                            <x-dropdown-link :href="route('logout')" onclick="event.preventDefault(); this.closest('form').submit();">
                                {{ __('Log Out') }}
                            </x-dropdown-link>
                        </form>
                    </x-slot>
                </x-dropdown>
            </div>

            <!-- Hamburger -->
            <div class="-me-2 flex items-center sm:hidden">
                <button @click="open = ! open" class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 dark:text-gray-500 hover:text-gray-500 dark:hover:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-900 focus:outline-none focus:bg-gray-100 dark:focus:bg-gray-900 focus:text-gray-500 dark:focus:text-gray-400 transition duration-150 ease-in-out">
                    <svg class="h-6 w-6" stroke="currentColor" fill="none" viewBox="0 0 24 24">
                        <path :class="{'hidden': open, 'inline-flex': ! open }" class="inline-flex" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
                        <path :class="{'hidden': ! open, 'inline-flex': open }" class="hidden" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                    </svg>
                </button>
            </div>
            @endauth
        </div>
    </div>

    <!-- Responsive Menu -->
    @auth
    <div :class="{'block': open, 'hidden': ! open}" class="hidden sm:hidden">
        <div class="pt-2 pb-3 space-y-1">
            @foreach($navLinks as $link)
                @if(!$link['adminOnly'] || (optional(Auth::user())->isAdmin() && $link['adminOnly']))
                    <a href="{{ route($link['route']) }}"
                       class="block px-3 py-2 rounded-md text-base font-medium
                              {{ request()->routeIs($link['route'].'*') 
                                  ? 'bg-gray-200 dark:bg-gray-700 text-gray-900 dark:text-white' 
                                  : 'text-gray-500 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-900 hover:text-gray-700 dark:hover:text-gray-300' }}">
                        {{ __($link['label']) }}
                    </a>
                @endif
            @endforeach
        </div>

        <!-- Responsive User -->
        <div class="pt-4 pb-1 border-t border-gray-200 dark:border-gray-600">
            <div class="px-4">
                <div class="font-medium text-base text-gray-800 dark:text-gray-200">{{ Auth::user()->username }}</div>
                <div class="font-medium text-sm text-gray-500">{{ Auth::user()->pelayan->nama_pelayan ?? '-' }}</div>
            </div>
            <div class="mt-3 space-y-1">
                <a href="{{ route('password.change.form') }}" class="block px-3 py-2 rounded-md text-base font-medium text-gray-500 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-900 hover:text-gray-700 dark:hover:text-gray-300">
                    {{ __('Ganti Password') }}
                </a>
                <form method="POST" action="{{ route('logout') }}">
                    @csrf
                    <a href="{{ route('logout') }}" onclick="event.preventDefault(); this.closest('form').submit();"
                       class="block px-3 py-2 rounded-md text-base font-medium text-gray-500 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-900 hover:text-gray-700 dark:hover:text-gray-300">
                        {{ __('Log Out') }}
                    </a>
                </form>
            </div>
        </div>
    </div>
    @endauth
</nav>
