# Proyek DBT + BI — Andreas Anditya Purnama (NIM 572392)

Proyek ini adalah lanjutan dari tugas ETL Airflow sebelumnya. Saya mengambil dataset Sample Superstore, lalu membersihkan dan menganalisis datanya menggunakan dbt, kemudian menampilkannya dalam dashboard BI sederhana.

## Tujuan proyek

- memproses data penjualan dari dataset Sample Superstore
- membuat model data di dbt
- membersihkan data dan mengecek kualitas data
- membuat ringkasan data untuk analisis bisnis
- menampilkan hasilnya dalam dashboard berbasis web

## Alur kerja proyek

1. Data sumber ada di folder `data/`.
2. Data dibawa ke warehouse DuckDB.
3. dbt membaca data dari warehouse dan membuat model staging serta marts.
4. Hasil analisis di-export menjadi file CSV.
5. Dashboard web membaca CSV tersebut dan menampilkan grafik.

## Struktur folder utama

```text
572392_Andreas_dbtBI/
├── README.md
├── data/
│   ├── warehouse.duckdb
│   └── raw/
│       └── superstore.csv
├── dbt_project/
│   ├── dbt_project.yml
│   ├── profiles.yml
│   ├── models/
│   │   ├── staging/
│   │   └── marts/
│   └── tests/
├── dashboard/
│   ├── index.html
│   └── data/
│       ├── mart_daily_sales.csv
│       └── mart_region_sales.csv
├── docs/
├── logs/
└── .venv/
```

## Teknologi yang dipakai

- Python
- DuckDB
- dbt
- HTML + JavaScript
- CSV untuk data dashboard

## Cara menjalankan proyek

### 1. Masuk ke folder proyek

```bash
cd /Users/andreasanditya/Downloads/tugas_airflow-main\ 2/572392_Andreas_dbtBI
```

### 2. Buat dan aktifkan virtual environment

```bash
python3 -m venv .venv
source .venv/bin/activate
```

### 3. Install library yang dibutuhkan

```bash
python -m pip install --upgrade pip
python -m pip install dbt-duckdb==1.8.3 duckdb==1.1.3 pandas numpy
```

### 4. Jalankan dbt

```bash
dbt run --project-dir dbt_project --profiles-dir dbt_project
dbt test --project-dir dbt_project --profiles-dir dbt_project
dbt docs generate --project-dir dbt_project --profiles-dir dbt_project
```

### 5. Jalankan dashboard

Buka dashboard langsung dari browser:

```bash
open dashboard/index.html
```

Atau jalankan server lokal:

```bash
cd /Users/andreasanditya/Downloads/tugas_airflow-main\ 2/572392_Andreas_dbtBI/dashboard
python3 -m http.server 8000
```

Setelah itu buka:

```text
http://localhost:8000/
```

## Yang bisa dilihat di dashboard

- total penjualan
- total keuntungan
- rata-rata diskon
- jumlah pesanan
- tren penjualan bulanan
- performa per wilayah

## Hasil proyek

Proyek ini menghasilkan dashboard yang menampilkan performa bisnis secara ringkas dan mudah dibaca. Data yang ditampilkan sudah berasal dari proses ETL + dbt sebelumnya, bukan data dummy.

## Catatan

README ini adalah satu-satunya dokumentasi utama untuk proyek ini. Semua penjelasan utama dan cara menjalankan proyek ada di file ini.
