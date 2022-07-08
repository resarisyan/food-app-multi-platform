import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/src/bloc/TranskasiBloc.dart';
import 'package:food_app/src/ui/main/MainNavigation.dart';
import 'package:food_app/src/ui/widget/pemesanan/Alamat.dart';
import 'package:food_app/src/ui/widget/pemesanan/AppBar.dart';
import 'package:food_app/src/ui/widget/pemesanan/Bayar.dart';
import 'package:food_app/src/ui/widget/pemesanan/Catatan.dart';
import 'package:food_app/src/ui/widget/pemesanan/ListPesanan.dart';
import 'package:food_app/src/utility/SessionManager.dart';
import 'package:food_app/src/utility/ShowToast.dart';
import 'package:intl/intl.dart';

class Pemesanan extends StatefulWidget {
  String id_pelanggan;

  Pemesanan({
    required this.id_pelanggan,
  });

  @override
  State<Pemesanan> createState() => _PemesananState();
}

class _PemesananState extends State<Pemesanan> {
  TextEditingController _noteController = TextEditingController();

  late double lat, lng;
  late String alamat, payment;
  late int isBayar;
  int? totalBayar = 0, totalOngkir = 0;
  bool isKirim = false;
  late bool validAlamat, validPayment;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getTotalBayar();
    _getAddress();
    _getPayment();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("#,###");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: !isKirim
          ? SafeArea(
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
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              right: 15.0,
                              top: 10.0,
                            ),
                            child: Text(
                              'ALAMAT KIRIM',
                              style: TextStyle(
                                  fontFamily: 'Varela', fontSize: 12.0),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Alamat(
                            alamat: alamat,
                            getAddress: _getAddress,
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
                            id_pelanggan: widget.id_pelanggan,
                            totalBayar: totalBayar!,
                            ongkir: totalOngkir!,
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
                            payment: payment,
                            getPayment: _getPayment,
                          ),
                          Catatan(
                            noteController: _noteController,
                          )
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
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
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
                                    'Rp ${formatter.format(totalBayar! + totalOngkir!)}',
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
                          SizedBox(
                            width: 5.0,
                          ),
                          Material(
                            elevation: 0.0,
                            color: Colors.lightBlue[800],
                            borderRadius: BorderRadius.circular(5.0),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(5.0),
                              onTap: () {
                                if (!validAlamat) {
                                  ShowToast().showToastWarning(
                                      "Alamat Kirim Belum Dipilih!");
                                } else if (!validPayment) {
                                  ShowToast().showToastWarning(
                                      "Metode Bayar Belum Dipilih!");
                                } else {
                                  _kirimPesanan();
                                }
                              },
                              child: Container(
                                width: 160.0,
                                child: Center(
                                  child: Text(
                                    'PESAN SEKARANG',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  _getAddress() async {
    Map _result = await SessionManager().getSessionAddress();

    setState(() {
      lat = _result['latitude'];
      lng = _result['longitude'];
      alamat = _result['alamat'];
      validAlamat = _result['hasData'];
    });
  }

  _getPayment() async {
    Map _result = await SessionManager().getSessionPayment();

    setState(() {
      payment = _result['payment'];
      validPayment = _result['hasData'];
    });
  }

  _getTotalBayar() async {
    final data = await transaksiBloc.getTotalBayar(widget.id_pelanggan);

    if (data['status']) {
      setState(() {
        totalBayar = data['data']['totalBayar'];
        totalOngkir = data['data']['totalOngkir'];
      });
    } else {
      print(data['message']);
    }
  }

  _kirimPesanan() async {
    setState(() {
      isKirim = true;
    });

    Map<String, String> data = {
      'total_bayar': (totalBayar! + totalOngkir!).toString(),
      'alamat_kirim': alamat,
      'latitude': lat.toString(),
      'longitude': lng.toString(),
      'id_pelanggan': widget.id_pelanggan,
      'note': _noteController.text,
      'payment': payment,
      'ongkir': totalOngkir.toString(),
    };

    print(data);

    final result = await transaksiBloc.kirimPesanan(data);

    print("Mystatus: " + result.toString());
    if (result['status']) {
      setState(() {
        isKirim = false;
      });

      SessionManager().removeSession();
      ShowToast().showToastSuccess(result['message']);

      Navigator.of(context).popUntil((route) => route.isFirst);
    } else {
      setState(() {
        isKirim = false;
      });

      ShowToast().showToastError(result['message']);
    }
  }
}
