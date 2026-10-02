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

## Business Rule

| Kode  | Business Rule                                                                       |
|-------|-------------------------------------------------------------------------------------|
| BR-01 | Durasi parkir dihitung per jam, sisa menit dibulatkan ke atas dengan minimal 1 jam. |
| BR-02 | Motor: Rp2.000 untuk jam pertama dan Rp1.000 untuk setiap jam berikutnya.           |
| BR-03 | Mobil: Rp5.000 untuk jam pertama dan Rp3.000 untuk setiap jam berikutnya.           |

## Petunjuk

Program menggunakan:

```dart
enum JenisKendaraan { motor, mobil }
```

Selain itu digunakan operator `~/` dan `%` untuk menghitung durasi parkir serta `switch` untuk menentukan tarif berdasarkan jenis kendaraan.

## Alur Program

Alur program secara umum adalah sebagai berikut:

1. Program menentukan jenis kendaraan menggunakan `enum`.
2. Function `hitungTarif()` menerima jenis kendaraan dan durasi parkir dalam menit.
3. Durasi menit dibagi dengan 60 menggunakan operator `~/` untuk mendapatkan jumlah jam.
4. Operator `%` digunakan untuk mendapatkan sisa menit.
5. Jika terdapat sisa menit, jumlah jam ditambah 1.
6. `switch` digunakan untuk menentukan perhitungan tarif berdasarkan jenis kendaraan.
7. Jika kendaraan adalah motor, tarif dihitung berdasarkan aturan tarif motor.
8. Jika kendaraan adalah mobil, tarif dihitung berdasarkan aturan tarif mobil.
9. Function mengembalikan hasil tarif parkir.
10. Hasil tarif ditampilkan menggunakan `print()`.

## Flowchart

Flowchart program dibuat dalam bentuk gambar PNG.

screenshoot/flowchart.png

## Source Code

```dart
enum JenisKendaraan {motor,mobil}

int hitungTarif(JenisKendaraan jenis,int menit){
  int jam = menit ~/ 60;
  final int sisaMenit = menit % 60;
  
  if (sisaMenit > 0){
    jam = jam + 1;
  };
  
  switch(jenis){
    case JenisKendaraan.motor:
      if(jam<=1){
        return 2000;
      }
      return 2000 + (jam-1) * 1000;
     case JenisKendaraan.mobil:
      if(jam<=1){
        return 5000;
      }
      return 5000 + (jam-1) * 3000;
  }
}

void main(){
  print('Tarif Parkir: Rp.${hitungTarif(JenisKendaraan.motor, 30)}');
  print('Tarif Parkir: Rp.${hitungTarif(JenisKendaraan.motor, 150)}');
  print('Tarif Parkir: Rp.${hitungTarif(JenisKendaraan.mobil, 60)}');
  print('Tarif Parkir: Rp.${hitungTarif(JenisKendaraan.mobil, 181)}');
}
```

## Penjelasan Source Code

### 1. Enum `JenisKendaraan`

```dart
enum JenisKendaraan {motor,mobil}
```

`enum` digunakan untuk menentukan jenis kendaraan yang digunakan dalam program.

Terdapat dua pilihan:

- `motor`
- `mobil`

Dengan menggunakan enum, parameter `jenis` pada function hanya dapat menggunakan jenis kendaraan yang telah ditentukan.

### 2. Function `hitungTarif()`

```dart
int hitungTarif(JenisKendaraan jenis,int menit)
```

Function `hitungTarif()` digunakan untuk menghitung tarif parkir.

Function menerima dua parameter:

- `jenis` → jenis kendaraan.
- `menit` → durasi parkir dalam menit.

Function mengembalikan nilai bertipe `int` yang merupakan tarif parkir.

### 3. Menghitung Jam dengan Operator `~/`

```dart
int jam = menit ~/ 60;
```

Operator `~/` digunakan untuk melakukan pembagian integer sehingga hasilnya berupa jumlah jam penuh.

Contoh:

```text
150 ~/ 60 = 2
```

Artinya 150 menit memiliki 2 jam penuh.

### 4. Menghitung Sisa Menit dengan Operator `%`

```dart
final int sisaMenit = menit % 60;
```

Operator `%` digunakan untuk mendapatkan sisa pembagian menit dengan 60.

Contoh:

```text
150 % 60 = 30
```

Artinya terdapat sisa 30 menit.

### 5. Membulatkan Durasi ke Atas

```dart
if (sisaMenit > 0){
  jam = jam + 1;
};
```

Jika terdapat sisa menit, maka jumlah jam ditambah 1 sesuai dengan Business Rule BR-01.

Contoh:

```text
150 menit
↓
2 jam + 30 menit
↓
Terdapat sisa menit
↓
2 + 1
↓
3 jam
```

Jadi, 150 menit dihitung sebagai 3 jam.

### 6. Menentukan Tarif Menggunakan `switch`

```dart
switch(jenis){
```

`switch` digunakan untuk menentukan perhitungan tarif berdasarkan jenis kendaraan.

Program memiliki dua kondisi:

```dart
case JenisKendaraan.motor:
```

dan

```dart
case JenisKendaraan.mobil:
```

### 7. Tarif Motor

```dart
if(jam<=1){
  return 2000;
}

return 2000 + (jam-1) * 1000;
```

Jika durasi parkir maksimal 1 jam, tarifnya adalah:

```text
Rp2.000
```

Jika lebih dari 1 jam, maka:

```text
Rp2.000 + (jam - 1) × Rp1.000
```

Contoh 3 jam:

```text
Rp2.000 + (3 - 1) × Rp1.000
= Rp2.000 + Rp2.000
= Rp4.000
```

### 8. Tarif Mobil

```dart
if(jam<=1){
  return 5000;
}

return 5000 + (jam-1) * 3000;
```

Jika durasi parkir maksimal 1 jam, tarifnya adalah:

```text
Rp5.000
```

Jika lebih dari 1 jam, maka:

```text
Rp5.000 + (jam - 1) × Rp3.000
```

Contoh 4 jam:

```text
Rp5.000 + (4 - 1) × Rp3.000
= Rp5.000 + Rp9.000
= Rp14.000
```

## Skenario Pengujian

| Skenario | Kendaraan | Durasi    | Expected Tarif | Hasil    |
|----------|-----------|-----------|----------------|----------|
| 1        | Motor     | 30 menit  | Rp2.000        | Rp2.000  |
| 2        | Motor     | 150 menit | Rp4.000        | Rp4.000  |
| 3        | Mobil     | 60 menit  | Rp5.000        | Rp5.000  |
| 4        | Mobil     | 181 menit | Rp14.000       | Rp14.000 |

## Detail Pengujian

### Skenario 1 — Motor 30 Menit

Perhitungan durasi:

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

Output:

```text
Tarif Parkir: Rp.2000
```

### Skenario 2 — Motor 150 Menit

Perhitungan durasi:

```text
150 ~/ 60 = 2
150 % 60 = 30
```

Karena terdapat sisa menit:

```text
2 + 1 = 3 jam
```

Perhitungan tarif:

```text
Rp2.000 + (3 - 1) × Rp1.000
= Rp2.000 + Rp2.000
= Rp4.000
```

Output:

```text
Tarif Parkir: Rp.4000
```

### Skenario 3 — Mobil 60 Menit

Perhitungan durasi:

```text
60 ~/ 60 = 1
60 % 60 = 0
```

Tidak terdapat sisa menit sehingga durasi tetap 1 jam.

Tarif:

```text
Rp5.000
```

Output:

```text
Tarif Parkir: Rp.5000
```

### Skenario 4 — Mobil 181 Menit

Perhitungan durasi:

```text
181 ~/ 60 = 3
181 % 60 = 1
```

Karena terdapat sisa menit:

```text
3 + 1 = 4 jam
```

Perhitungan tarif:

```text
Rp5.000 + (4 - 1) × Rp3.000
= Rp5.000 + Rp9.000
= Rp14.000
```

Output:

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
|--------|------------|
| `enum` | Menentukan jenis kendaraan |
| Function | Menghitung tarif parkir |
| `~/` | Menghitung jumlah jam penuh |
| `%` | Menghitung sisa menit |
| `if` | Membulatkan durasi ke atas |
| `switch` | Menentukan tarif berdasarkan jenis kendaraan |
| String interpolation | Menampilkan hasil tarif |

