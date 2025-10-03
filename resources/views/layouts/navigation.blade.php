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

<nav x-data="{ 
    open: false,
    darkMode: false,
    toggleTheme() {
        this.darkMode = !this.darkMode;
        localStorage.setItem('darkMode', this.darkMode);
        if (this.darkMode) {
            document.documentElement.classList.add('dark');
        } else {
            document.documentElement.classList.remove('dark');
        }
    },
    init() {
        // Check localStorage first, then system preference
        const savedMode = localStorage.getItem('darkMode');
        if (savedMode !== null) {
            this.darkMode = savedMode === 'true';
        } else {
            this.darkMode = window.matchMedia('(prefers-color-scheme: dark)').matches;
        }
        
        // Apply the theme
        if (this.darkMode) {
            document.documentElement.classList.add('dark');
        } else {
            document.documentElement.classList.remove('dark');
        }
    }
}" class="bg-white dark:bg-gray-800 border-b border-gray-100 dark:border-gray-700">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between h-16">

            <!-- Logo -->
            <div class="shrink-0 flex items-center">
                <a href="{{ url('/') }}">
                    <!-- Light mode logo (dark colored) -->
                    <img src="{{ asset('assets/images/logo HCM-01.png') }}" alt="Logo HCM" class="h-8 w-auto dark:hidden">
                    <!-- Dark mode logo (white/light colored) -->
                    <img src="{{ asset('assets/images/logo_hcm_white.png') }}" alt="Logo HCM" class="h-8 w-auto hidden dark:block">
                </a>
            </div>

            <!-- Theme Toggle - Always visible -->
            <div class="flex items-center">
                <button @click="toggleTheme()" class="p-2 rounded-md text-gray-500 dark:text-gray-400 hover:text-gray-700 dark:hover:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-900 focus:outline-none focus:bg-gray-100 dark:focus:bg-gray-900 transition duration-150 ease-in-out">
                    <!-- Sun icon for light mode -->
                    <svg x-show="!darkMode" class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z" clip-rule="evenodd"></path>
                    </svg>
                    <!-- Moon icon for dark mode -->
                    <svg x-show="darkMode" class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"></path>
                    </svg>
                </button>
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
    <div :class="{'block': open, 'hidden': ! open}" class="hidden sm:hidden">
        <!-- Theme Toggle for Mobile - Always visible -->
        <div class="pt-2 pb-3">
            <button @click="toggleTheme()" class="flex items-center w-full px-3 py-2 rounded-md text-base font-medium text-gray-500 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-900 hover:text-gray-700 dark:hover:text-gray-300">
                <!-- Sun icon for light mode -->
                <svg x-show="!darkMode" class="h-5 w-5 mr-3" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z" clip-rule="evenodd"></path>
                </svg>
                <!-- Moon icon for dark mode -->
                <svg x-show="darkMode" class="h-5 w-5 mr-3" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"></path>
                </svg>
                <span x-text="darkMode ? 'Mode Gelap' : 'Mode Terang'"></span>
            </button>
        </div>

        @auth
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
        @endauth
    </div>
</nav>
