<!DOCTYPE html>
<html>
<head>
    <title>Jadwal Multimedia</title>
    <style>
        body { font-family: DejaVu Sans, sans-serif; font-size: 12px; }
        table { border-collapse: collapse; width: 100%; }
        th, td {
            border: 1px solid #444;
            padding: 6px;
            text-align: left;
        }
        th { background: #f2f2f2; }
    </style>
</head>
<body>
    <h3 style="text-align:center;">Jadwal Hagios Creative Ministry</h3>
    <table>
        <thead>
            <tr>
                <th>Ibadah</th>
                <th>Tanggal</th>
                <th>Videotron</th>
                <th>Live OP</th>
                <th>Live Cam</th>
                <th>Foto</th>
                <th>Keterangan</th>
            </tr>
        </thead>
        <tbody>
        @foreach($jadwals as $jadwal)
            <tr>
                <td>{{ $jadwal->ibadah->nama_ibadah }}</td>
                <td>{{ $jadwal->tanggal ? $jadwal->tanggal->format('d-m-Y') : '' }}</td>
                <td>{{ $jadwal->videotron->nama_pelayan ?? '' }}</td>
                <td>{{ $jadwal->live_op->nama_pelayan ?? '' }}</td>
                <td>
                    @php
                        $camList = [];
                        for ($i=1; $i<=5; $i++) {
                            $prop = "live_cam_{$i}";
                            if ($jadwal->$prop) {
                                $camList[] = $i.': '.$jadwal->$prop->nama_pelayan;
                            }
                        }
                    @endphp
                    {{ implode(', ', $camList) }}
                </td>
                <td>{{ $jadwal->foto->nama_pelayan ?? '' }}</td>
                <td>{{ $jadwal->keterangan }}</td>
            </tr>
        @endforeach
        </tbody>
    </table>
</body>
</html>
