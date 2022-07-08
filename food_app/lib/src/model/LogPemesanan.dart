import 'dart:convert';

List<LogPemesananModel> logFromJson(String str) {
  final jsonData = jsonDecode(str);
  return List<LogPemesananModel>.from(
      jsonData.map((x) => LogPemesananModel.fromJson(x)));
}

class LogPemesananModel {
  late String id, nama_produk, harga, qty, total;
  LogPemesananModel(
      {required this.id,
      required this.nama_produk,
      required this.harga,
      required this.qty,
      required this.total});

  factory LogPemesananModel.fromJson(Map<String, dynamic> json) =>
      LogPemesananModel(
        id: json['id'],
        nama_produk: json['nama_produk'],
        harga: json['harga'],
        qty: json['qty'],
        total: json['total'],
      );

  Map<String, dynamic> toJson() => {
        id: id,
        nama_produk: nama_produk,
        harga: harga,
        qty: qty,
        total: total,
      };
}
