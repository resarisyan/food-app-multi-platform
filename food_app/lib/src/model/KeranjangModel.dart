import 'dart:convert';

List<KeranjangModel> keranjangFromJson(String str) {
  final jsonData = jsonDecode(str);
  return List<KeranjangModel>.from(
      jsonData.map((x) => KeranjangModel.fromJson(x)));
}

class KeranjangModel {
  late String id, nama_produk, harga, qty, gambar, status, id_pelanggan;
  KeranjangModel(
      {required this.id,
      required this.nama_produk,
      required this.harga,
      required this.qty,
      required this.gambar,
      required this.id_pelanggan});

  factory KeranjangModel.fromJson(Map<String, dynamic> json) => KeranjangModel(
        id: json['id'],
        nama_produk: json['nama_produk'],
        harga: json['harga'],
        qty: json['qty'],
        gambar: json['gambar'],
        id_pelanggan: json['id_pelanggan'],
      );

  Map<String, dynamic> toJson() => {
        id: id,
        nama_produk: nama_produk,
        harga: harga,
        qty: qty,
        gambar: gambar,
        id_pelanggan: id_pelanggan
      };
}
