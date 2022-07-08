import 'dart:convert';

List<ProdukModel> produkFromJson(String str) {
  final jsonData = jsonDecode(str);
  return List<ProdukModel>.from(jsonData.map((x) => ProdukModel.fromJson(x)));
}

class ProdukModel {
  late String id, nama_produk, harga, deskripsi, gambar, status, kategori;
  ProdukModel(
      {required this.id,
      required this.nama_produk,
      required this.harga,
      required this.deskripsi,
      required this.gambar,
      required this.status,
      required this.kategori});

  factory ProdukModel.fromJson(Map<String, dynamic> json) => ProdukModel(
      id: json['id'],
      nama_produk: json['nama_produk'],
      harga: json['harga'],
      deskripsi: json['deskripsi'],
      gambar: json['gambar'],
      status: json['status'],
      kategori: json['kategori']);

  Map<String, dynamic> toJson() => {
        id: id,
        nama_produk: nama_produk,
        harga: harga,
        deskripsi: deskripsi,
        gambar: gambar,
        status: status,
        kategori: kategori
      };
}
