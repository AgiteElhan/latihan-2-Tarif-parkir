enum JenisKendaraan {motor,mobil}

int hitungTarif(JenisKendaraan jenis,int menit){
  int jam = menit ~/ 60;
  int sisaMenit = menit % 60;
  
  if (sisaMenit > 0){
    jam++;
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
