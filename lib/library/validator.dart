import 'dart:developer';

import 'package:string_validator/string_validator.dart' as s_validator;

registerNamaLengkap(String? val) {
  val = val.toString().trim();
  if (val == "" || val.isEmpty || val == "null") {
    return "Nama Lengkap belum diisi";
  }
  return null;
}

registerEmail(String? val) {
  val = val.toString().trim();
  if (val == "Email telah digunakan") {
    return val;
  }
  if (val.isNotEmpty && !s_validator.isEmail(val)) {
    return "Email tidak valid";
  }

  return null;
}

registerNoHpWa(String? val) {
  val = val.toString().trim();
  if (val == "Nomor telah digunakan") {
    return val;
  }
  if (val == "" || val.isEmpty || val == "null") {
    return "No HP/WA belum diisi";
  }

  return null;
}

registerPassword(String? val) {
  val = val.toString().trim();
  if (val == "" || val.isEmpty || val == "null") {
    return "Password belum diisi";
  }
  return null;
}

registerReTypePassword(String? val, val2, bool isSubmitted) {
  val = val.toString().trim();
  if (val == "" || val.isEmpty || val == "null") {
    return "Mohon masukkan kembali passwordnya";
  }
  if (val != val2 && isSubmitted) {
    return "Password yang anda masukkan tidak sama";
  }
  return null;
}

registerNamaUsaha(String? val) {
  val = val.toString().trim();
  if (val == "" || val.isEmpty || val == "null") {
    return "Nama Usaha belum diisi";
  }
  return null;
}

registerNoTelp(String? val) {
  val = val.toString().trim();
  if (val == "" || val.isEmpty || val == "null") {
    return "Nomor Telepon belum diisi";
  }
  return null;
}

registerEmailResto(String? val) {
  val = val.toString().trim();
  if (val.isNotEmpty && !s_validator.isEmail(val)) {
    return "Email tidak valid";
  }
  return null;
}

registerProvinsi(String? val) {
  val = val.toString().trim();
  if (val == "" || val.isEmpty || val == "null" || val == "0") {
    return "Provinsi belum dipilih";
  }
  return null;
}

registerKota(String? val) {
  val = val.toString().trim();
  if (val == "" || val.isEmpty || val == "null" || val == "0") {
    return "Kota belum dipilih";
  }
  return null;
}

registerAlamat(String? val) {
  val = val.toString().trim();
  if (val == "" || val.isEmpty || val == "null") {
    return "Alamat Resto belum diisi";
  }
  return null;
}

registerNoNpwp(String? val) {
  val = val.toString().trim();
  return null;
}

// login view
loginEmailNoWa(String? val) {
  val = val.toString().trim();
  if (val == "" || val.isEmpty || val == "null") {
    return "Email/No WA belum diisi";
  }
  return null;
}

registerNumber(String? val) {
  val = val.toString().trim();
  if (val == "" || val.isEmpty || val == "null") {
    return "Nama kategori belum diisi";
  }
  return null;
}

registerNamaKategori(String? val) {
  val = val.toString().trim();
  if (val == "" || val.isEmpty || val == "null") {
    return "Nama kategori belum diisi";
  }
  return null;
}

menuNamaMenu(String? val) {
  val = val.toString().trim();
  if (val == "" || val.isEmpty || val == "null") {
    return "Nama menu belum diisi";
  }
  return null;
}

menuKategori(String? val) {
  val = val.toString().trim();
  if (val == "" || val.isEmpty || val == "null" || val == "0") {
    return "Kategori belum diisi";
  }
  return null;
}

menuHargaJual(String? val) {
  val = val.toString().trim();
  if (val == "" || val.isEmpty || val == "null") {
    return "Harga jual belum diisi";
  }
  return null;
}

menuTanggalBerlaku(String? val) {
  val = val.toString().trim();
  if (val == "" || val.isEmpty || val == "null") {
    return "Tanggal berlaku belum diisi";
  }
  return null;
}

menuSku(String? val) {
  val = val.toString().trim();
  if (val == "" || val.isEmpty || val == "null") {
    return "SKU belum diisi";
  }
  return null;
}

menuKeterangan(String? val) {
  val = val.toString().trim();
  if (val == "" || val.isEmpty || val == "null") {
    return "Keterangan belum diisi";
  }
  return null;
}

paketNama(String? val) {
  val = val.toString().trim();
  if (val == "" || val.isEmpty || val == "null") {
    return "Nama paket belum diisi";
  }
  return null;
}

paketKategori(String? val) {
  val = val.toString().trim();
  if (val == "" || val.isEmpty || val == "null") {
    return "Kategori belum diisi";
  }
  return null;
}

paketHargaJual(String? val) {
  val = val.toString().trim();
  if (val == "" || val.isEmpty || val == "null") {
    return "Harga jual belum diisi";
  }
  return null;
}

paketTanggalBerlaku(String? val) {
  val = val.toString().trim();
  if (val == "" || val.isEmpty || val == "null") {
    return "Tanggal berlaku belum diisi";
  }
  return null;
}

detailPaketKategori(String? val) {
  val = val.toString().trim();
  if (val == "" || val.isEmpty || val == "null") {
    return "Kategori belum diisi";
  }
  return null;
}

detailPaketMenu(String? val) {
  val = val.toString().trim();
  if (val == "" || val.isEmpty || val == "null") {
    return "Menu belum diisi";
  }
  return null;
}

detailPaketKuantiti(String? val) {
  val = val.toString().trim();
  if (val == "" || val.isEmpty || val == "null") {
    return "Qty belum diisi";
  }
  return null;
}
