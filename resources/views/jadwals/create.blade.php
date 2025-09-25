@extends('layouts.app')

@section('title', 'Create Jadwal')

@section('content')
<div class="max-w-3xl mx-auto px-6 mt-8 space-y-4">
    <!-- Header -->
    <div class="flex justify-between items-center">
        <h1 class="text-2xl font-bold text-gray-800 dark:text-gray-100">
            Tambah Jadwal Multimedia
        </h1>
    </div>

    <!-- Form Card -->
    <div class="bg-white dark:bg-gray-800 rounded-xl shadow p-6">
        <form action="{{ route('jadwals.store') }}" method="POST" class="space-y-4">
            @csrf

            <!-- Pilih Ibadah -->
            <div>
                <label for="id_ibadah" class="block font-medium text-gray-700 dark:text-gray-200 mb-1">
                    Ibadah
                </label>
                <select name="id_ibadah" id="id_ibadah"
                        class="w-full border-gray-300 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-100 
                               rounded-lg px-3 py-2 focus:ring focus:ring-blue-200"
                        required>
                    <option value="">-- Pilih Ibadah --</option>
                    @foreach($ibadahs as $ibadah)
                        <option value="{{ $ibadah->id }}">
                            {{ $ibadah->nama_ibadah }} ({{ $ibadah->waktu }})
                        </option>
                    @endforeach
                </select>
            </div>

            <!-- Tanggal -->
            <div>
                <label for="tanggal" class="block font-medium text-gray-700 dark:text-gray-200 mb-1">
                    Tanggal
                </label>
                <input type="date" name="tanggal" id="tanggal"
                    value="{{ old('tanggal') }}"
                    class="w-full border-gray-300 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-100 
                            rounded-lg px-3 py-2 focus:ring focus:ring-blue-200" required>
            </div>

            @php
                $rolePelayanan = [
                    'id_videotron' => 'Videotron',
                    'id_live_op'   => 'Live OP',
                    'id_live_cam_1'=> 'Live Cam 1',
                    'id_live_cam_2'=> 'Live Cam 2',
                    'id_live_cam_3'=> 'Live Cam 3',
                    'id_live_cam_4'=> 'Live Cam 4',
                    'id_live_cam_5'=> 'Live Cam 5',
                    'id_foto'      => 'Fotografer',
                ];
            @endphp

            @foreach($rolePelayanan as $field => $label)
            <div>
                <label for="{{ $field }}" class="block font-medium text-gray-700 dark:text-gray-200 mb-1">
                    {{ $label }}
                </label>
                <select name="{{ $field }}" id="{{ $field }}" data-role="{{ $label }}"
                        class="w-full border-gray-300 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-100 
                            rounded-lg px-3 py-2 focus:ring focus:ring-blue-200">
                    <option value="">-- Pilih Pelayan --</option>
                    {{-- preload data jika edit --}}
                    @if(isset($jadwal))
                        @foreach($pelayans as $pelayan)
                            @if($pelayan->ibadahs->contains('id', $jadwal->id_ibadah))
                                <option value="{{ $pelayan->id }}" {{ $jadwal->$field == $pelayan->id ? 'selected' : '' }}>
                                    {{ $pelayan->nama_pelayan }}
                                </option>
                            @endif
                        @endforeach
                    @endif
                </select>
            </div>
            @endforeach
            <!-- Keterangan -->
            <div>
                <label for="keterangan" class="block font-medium text-gray-700 dark:text-gray-200 mb-1">
                    Keterangan
                </label>
                <textarea name="keterangan" id="keterangan" rows="3"
                          class="w-full border-gray-300 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-100 
                                 rounded-lg px-3 py-2 focus:ring focus:ring-blue-200"
                          placeholder="Tambahkan catatan jika diperlukan...">{{ old('keterangan', $jadwal->keterangan ?? '') }}</textarea>
            </div>

            <!-- Tombol -->
            <div class="flex items-center gap-3 mt-5">
                <button type="submit"
                        class="bg-blue-600 hover:bg-blue-700 text-white px-5 py-2 rounded-lg shadow">
                    Simpan
                </button>
                <a href="{{ route('jadwals.index') }}"
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

<!-- Script filter pelayan berdasarkan ibadah -->
<script>
document.addEventListener('DOMContentLoaded', function () {
    const ibadahSelect = document.getElementById('id_ibadah');

    ibadahSelect.addEventListener('change', function () {
        const ibadahId = this.value;
        if (!ibadahId) return;

        document.querySelectorAll('select[data-role]').forEach(select => {
            const role = select.getAttribute('data-role');

            fetch(`/dropdown-pelayan/${ibadahId}`)
                .then(res => {
                    if (!res.ok) throw new Error('Network response was not ok');
                    return res.json();
                })
                .then(data => {
                    select.innerHTML = '<option value="">-- Pilih Pelayan --</option>';
                    data.forEach(pelayan => {
                        const option = document.createElement('option');
                        option.value = pelayan.id;
                        option.textContent = pelayan.nama_pelayan;
                        select.appendChild(option);
                    });
                })
                .catch(err => console.error('Fetch error:', err));
        });
    });
});
</script>

@endsection
