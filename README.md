# Latihan 2 — Tarif Parkir

Program ini merupakan latihan Dart untuk menghitung tarif parkir berdasarkan **jenis kendaraan** dan **durasi parkir**.

Pada latihan ini digunakan konsep dasar Dart berupa:

- `enum`
- Function
- Operator `~/`
- Operator `%`
- `if`
- `switch`
- String interpolation

## Problem Statement

Tempat parkir membutuhkan program sederhana untuk menghitung tarif parkir berdasarkan jenis kendaraan dan durasi parkir.

Durasi parkir diberikan dalam satuan menit. Durasi tersebut kemudian dihitung menjadi jam, dengan sisa menit dibulatkan ke atas. Tarif parkir dibedakan berdasarkan jenis kendaraan, yaitu motor dan mobil.

## Business Rule

| Kode  | Business Rule                                                                       |
| ------ | ----------------------------------------------------------------------------------- |
| BR-01 | Durasi parkir dihitung per jam, sisa menit dibulatkan ke atas dengan minimal 1 jam. |
| BR-02 | Motor: Rp2.000 untuk jam pertama dan Rp1.000 untuk setiap jam berikutnya.           |
| BR-03 | Mobil: Rp5.000 untuk jam pertama dan Rp3.000 untuk setiap jam berikutnya.           |

## Input, Output, dan Abstraction

| Aspek       | Hasil Analisis                                |
| ----------- | --------------------------------------------- |
| Input       | Jenis kendaraan dan durasi parkir dalam menit |
| Output      | Tarif parkir                                  |
| Abstraction | `enum JenisKendaraan` dan function `hitungTarif()` |

### Input

Program menerima:

- Jenis kendaraan
- Durasi parkir dalam menit

Contoh:

```text
Jenis kendaraan : Motor
Durasi          : 150 menit
```

### Output

Program menghasilkan tarif parkir berdasarkan jenis kendaraan dan durasi.

Contoh:

```text
Tarif Parkir: Rp.4000
```

## Alur Program Step by Step

### 1. Menentukan Jenis Kendaraan

Program menggunakan `enum` untuk menentukan jenis kendaraan:

```dart
enum JenisKendaraan { motor, mobil }
```

Terdapat dua jenis kendaraan:

- `motor`
- `mobil`

### 2. Menerima Input

Function `hitungTarif()` menerima dua parameter:

```dart
int hitungTarif(JenisKendaraan jenis, int menit)
```

Parameter:

- `jenis` → menentukan jenis kendaraan.
- `menit` → menentukan durasi parkir dalam menit.

### 3. Menghitung Jumlah Jam

Program menggunakan operator `~/`:

```dart
int jam = menit ~/ 60;
```

Operator `~/` digunakan untuk mendapatkan jumlah jam penuh.

Contoh:

```text
150 ~/ 60 = 2
```

Artinya terdapat 2 jam penuh.

### 4. Menghitung Sisa Menit

Program menggunakan operator `%`:

```dart
int sisaMenit = menit % 60;
```

Contoh:

```text
150 % 60 = 30
```

Artinya terdapat sisa 30 menit.

### 5. Membulatkan Durasi ke Atas

Jika terdapat sisa menit, maka jumlah jam ditambah 1:

```dart
if (sisaMenit > 0) {
  jam++;
}
```

Contoh:

```text
150 menit
    ↓
2 jam + 30 menit
    ↓
Ada sisa menit
    ↓
2 + 1
    ↓
3 jam
```

Jadi, 150 menit dihitung sebagai **3 jam**.

### 6. Menentukan Jenis Kendaraan

Program menggunakan `switch`:

```dart
switch (jenis) {
```

Kemudian program menentukan tarif berdasarkan jenis kendaraan.

### 7. Menghitung Tarif Motor

Untuk kendaraan motor:

```dart
if (jam <= 1) {
  return 2000;
}

return 2000 + (jam - 1) * 1000;
```

Rumus:

```text
Rp2.000 + (jumlah jam - 1) × Rp1.000
```

### 8. Menghitung Tarif Mobil

Untuk kendaraan mobil:

```dart
if (jam <= 1) {
  return 5000;
}

return 5000 + (jam - 1) * 3000;
```

Rumus:

```text
Rp5.000 + (jumlah jam - 1) × Rp3.000
```

### 9. Menampilkan Tarif

Setelah tarif dihitung, hasil ditampilkan menggunakan `print()`:

```dart
print('Tarif Parkir: Rp.${hitungTarif(JenisKendaraan.motor, 30)}');
```

## Flowchart

```text
                         START
                           │
                           ▼
              Input jenis kendaraan
                 dan durasi menit
                           │
                           ▼
                Hitung jam = menit ~/ 60
                           │
                           ▼
             Hitung sisaMenit = menit % 60
                           │
                           ▼
                 ┌─────────────────┐
                 │ Sisa menit > 0? │
                 └─────────────────┘
                    │           │
                  Ya│           │Tidak
                    ▼           │
              jam = jam + 1     │
                    │           │
                    └─────┬─────┘
                          ▼
                 ┌───────────────────┐
                 │ Jenis kendaraan?  │
                 └───────────────────┘
                    │             │
                 Motor          Mobil
                    │             │
                    ▼             ▼
              ┌──────────┐   ┌──────────┐
              │ jam <= 1?│   │ jam <= 1?│
              └──────────┘   └──────────┘
                │     │        │     │
              Ya│     │Tidak  Ya│     │Tidak
                ▼     ▼        ▼     ▼
            Rp2.000  Rp2.000  Rp5.000 Rp5.000
                     +                 +
                 (jam-1)×          (jam-1)×
                  Rp1.000           Rp3.000
                    │                 │
                    └────────┬────────┘
                             ▼
                    Tampilkan tarif
                             │
                             ▼
                            END
```

## Source Code

```dart
enum JenisKendaraan { motor, mobil }

int hitungTarif(JenisKendaraan jenis, int menit) {
  int jam = menit ~/ 60;
  int sisaMenit = menit % 60;

  if (sisaMenit > 0) {
    jam++;
  }

  switch (jenis) {
    case JenisKendaraan.motor:
      if (jam <= 1) {
        return 2000;
      }
      return 2000 + (jam - 1) * 1000;

    case JenisKendaraan.mobil:
      if (jam <= 1) {
        return 5000;
      }
      return 5000 + (jam - 1) * 3000;
  }
}

void main() {
  print('Tarif Parkir: Rp.${hitungTarif(JenisKendaraan.motor, 30)}');
  print('Tarif Parkir: Rp.${hitungTarif(JenisKendaraan.motor, 150)}');
  print('Tarif Parkir: Rp.${hitungTarif(JenisKendaraan.mobil, 60)}');
  print('Tarif Parkir: Rp.${hitungTarif(JenisKendaraan.mobil, 181)}');
}
```

## Skenario Pengujian

| Skenario | Kendaraan | Durasi    | Expected Tarif | Hasil   |
| -------- | --------- | --------- | -------------- | ------- |
| 1        | Motor     | 30 menit  | Rp2.000        | Rp2.000 |
| 2        | Motor     | 150 menit | Rp4.000        | Rp4.000 |
| 3        | Mobil     | 60 menit  | Rp5.000        | Rp5.000 |
| 4        | Mobil     | 181 menit | Rp14.000       | Rp14.000 |

## Detail Perhitungan

### Skenario 1 — Motor 30 Menit

```text
30 ~/ 60 = 0
30 % 60 = 30
```

Karena terdapat sisa menit:

```text
0 + 1 = 1 jam
```

Tarif:

```text
Rp2.000
```

Hasil:

```text
Tarif Parkir: Rp.2000
```

### Skenario 2 — Motor 150 Menit

```text
150 ~/ 60 = 2
150 % 60 = 30
```

Karena terdapat sisa menit:

```text
2 + 1 = 3 jam
```

Tarif:

```text
Rp2.000 + (3 - 1) × Rp1.000
= Rp2.000 + Rp2.000
= Rp4.000
```

Hasil:

```text
Tarif Parkir: Rp.4000
```

### Skenario 3 — Mobil 60 Menit

```text
60 ~/ 60 = 1
60 % 60 = 0
```

Tidak terdapat sisa menit, sehingga durasi tetap:

```text
1 jam
```

Tarif:

```text
Rp5.000
```

Hasil:

```text
Tarif Parkir: Rp.5000
```

### Skenario 4 — Mobil 181 Menit

```text
181 ~/ 60 = 3
181 % 60 = 1
```

Karena terdapat sisa menit:

```text
3 + 1 = 4 jam
```

Tarif:

```text
Rp5.000 + (4 - 1) × Rp3.000
= Rp5.000 + Rp9.000
= Rp14.000
```

Hasil:

```text
Tarif Parkir: Rp.14000
```

## Output Program

```text
Tarif Parkir: Rp.2000
Tarif Parkir: Rp.4000
Tarif Parkir: Rp.5000
Tarif Parkir: Rp.14000
```

## Konsep Dart yang Digunakan

| Konsep | Penggunaan |
| ------- | --------- |
| `enum` | Menentukan jenis kendaraan |
| Function | Menghitung tarif parkir |
| `~/` | Menghitung jumlah jam penuh |
| `%` | Menghitung sisa menit |
| `if` | Membulatkan durasi ke atas |
| `switch` | Menentukan tarif berdasarkan kendaraan |
| String interpolation | Menampilkan hasil function ke dalam teks |
