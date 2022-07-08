import 'dart:convert';

List<TransaksiModel> transaksiFromJson(String str) {
  final jsonData = jsonDecode(str);
  return List<TransaksiModel>.from(
      jsonData.map((x) => TransaksiModel.fromJson(x)));
}

class TransaksiModel {
  String? kd_pemesanan;
  String? tgl_pesan;
  String? total_bayar;
  String? alamat_kirim;
  String? status;
  String? noteCancel;
  String? note;
  String? payment;
  String? ongkir;
  String? id_pelanggan;

  TransaksiModel({
    required this.kd_pemesanan,
    required this.tgl_pesan,
    required this.total_bayar,
    required this.alamat_kirim,
    required this.status,
    required this.noteCancel,
    required this.note,
    required this.payment,
    required this.ongkir,
    required this.id_pelanggan,
  });

  factory TransaksiModel.fromJson(Map<String, dynamic> json) => TransaksiModel(
      kd_pemesanan: json['kd_pemesanan'],
      tgl_pesan: json['tgl_pesan'],
      total_bayar: json['total_bayar'],
      alamat_kirim: json['alamat_kirim'],
      status: json['status'],
      noteCancel: json['noteCancel'],
      note: json['note'],
      payment: json['payment'],
      ongkir: json['ongkir'],
      id_pelanggan: json['id_pelanggan']);

  Map<String, dynamic> toJson() => {
        "kd_pemesanan": kd_pemesanan,
        "tgl_pesan": tgl_pesan,
        "total_bayar": total_bayar,
        "alamat_kirim": alamat_kirim,
        "status": status,
        "noteCancel": noteCancel,
        "note": note,
        "payment": payment,
        "ongkir": ongkir,
        "id_pelanggan": id_pelanggan,
      };
}
