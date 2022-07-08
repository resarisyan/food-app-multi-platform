import 'package:flutter/material.dart';
import 'package:food_app/src/ui/widget/detail_transaksi/Alamat.dart';
import 'package:food_app/src/ui/widget/detail_transaksi/AppBar.dart';
import 'package:food_app/src/ui/widget/detail_transaksi/Bayar.dart';
import 'package:food_app/src/ui/widget/detail_transaksi/Catatan.dart';
import 'package:food_app/src/ui/widget/detail_transaksi/CatatanPembatalan.dart';
import 'package:food_app/src/ui/widget/detail_transaksi/ListPesanan.dart';
import 'package:food_app/src/ui/widget/detail_transaksi/StatusPesanan.dart';
import 'package:intl/intl.dart';

class DetailTransaksi extends StatefulWidget {
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

  DetailTransaksi({
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

  @override
  State<DetailTransaksi> createState() => _DetailTransaksiState();
}

class _DetailTransaksiState extends State<DetailTransaksi> {
  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("#,###");
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: 60.0,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StatusPesanan(
                        status: widget.status!,
                      ),
                      if (widget.status == '0')
                        CatatanPembatalan(noteCancel: widget.noteCancel!),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                          top: 10.0,
                        ),
                        child: Text(
                          'ALAMAT KIRIM',
                          style:
                              TextStyle(fontFamily: 'Varela', fontSize: 12.0),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Alamat(
                        alamat: widget.alamat_kirim!,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                          top: 10.0,
                        ),
                        child: Text(
                          'RINGKASAN PESANAN',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 12.0,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      ListPesanan(
                        kd_pemesanan: widget.kd_pemesanan!,
                        id_pelanggan: widget.id_pelanggan!,
                        totalBayar: int.parse(widget.total_bayar!),
                        ongkir: int.parse(widget.ongkir!),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                          top: 10.0,
                        ),
                        child: Text(
                          'METODE PEMBAYARAN',
                          style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 12.0,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Bayar(
                        payment: widget.payment!,
                      ),
                      Catatan(note: widget.note!)
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0.1,
                left: 0.1,
                right: 0.1,
                child: Container(
                  height: 60.0,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        blurRadius: 1.0,
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1.0)
                  ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Material(
                        color: Colors.transparent,
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(5.0),
                        child: Container(
                          width: 50.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Bayar: ',
                                style: TextStyle(
                                    fontFamily: 'Varela', fontSize: 14.0),
                              ),
                              Text(
                                'Rp ${formatter.format(int.parse(widget.total_bayar!))}',
                                style: TextStyle(
                                  fontFamily: 'Varela',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
