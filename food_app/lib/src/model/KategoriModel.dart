import 'dart:convert';

List<KategoriModel> kategoriFromJson(String str) {
  final jsonData = jsonDecode(str);
  return List<KategoriModel>.from(
      jsonData.map((x) => KategoriModel.fromJson(x)));
}

class KategoriModel {
  late String id, nama_kategori;
  KategoriModel({
    required this.id,
    required this.nama_kategori,
  });

  factory KategoriModel.fromJson(Map<String, dynamic> json) => KategoriModel(
        id: json['id'],
        nama_kategori: json['nama_kategori'],
      );

  Map<String, dynamic> toJson() => {
        id: id,
        nama_kategori: nama_kategori,
      };
}
