import 'package:flutter/material.dart';
import 'package:food_app/src/bloc/TranskasiBloc.dart';
import 'package:food_app/src/model/LogPemesanan.dart';
import 'package:intl/intl.dart';

class ListPesanan extends StatefulWidget {
  late String kd_pemesanan, id_pelanggan;
  late int totalBayar, ongkir;

  ListPesanan({
    required this.kd_pemesanan,
    required this.id_pelanggan,
    required this.totalBayar,
    required this.ongkir,
  });

  @override
  State<ListPesanan> createState() => _ListPesananState();
}

class _ListPesananState extends State<ListPesanan> {
  final formatter = NumberFormat("#,###");

  @override
  void initState() {
    // TODO: implement initState
    transaksiBloc.getItemTransaksi(widget.kd_pemesanan, widget.id_pelanggan);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    transaksiBloc.disposeLog();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      margin: EdgeInsets.only(
        top: 5.0,
        bottom: 5.0,
        left: 15.0,
        right: 15.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            StreamBuilder(
              stream: transaksiBloc.countItemTransaksi,
              builder: (context, AsyncSnapshot<List<LogPemesananModel>> snap) {
                if (snap.hasData) {
                  if (snap.data!.isEmpty) {
                    return Center(
                      child: Text('Tidak Ada Item.'),
                    );
                  } else {
                    return buildItem(context, snap);
                  }
                } else if (snap.hasError) {
                  return Text(snap.error.toString());
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(
                left: 5.0,
                right: 5.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 14.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Rp ${formatter.format(widget.totalBayar)}',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 13.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 5.0,
                right: 5.0,
                top: 5.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ongkos Kirim',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 14.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Rp ${formatter.format(widget.ongkir)}',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 13.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(
      BuildContext context, AsyncSnapshot<List<LogPemesananModel>> snap) {
    final formatter = NumberFormat("#,###");

    return ListView.separated(
      itemCount: snap.data!.length,
      separatorBuilder: (context, i) {
        return Divider();
      },
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, i) {
        final data = snap.data![i];

        return Padding(
          padding: EdgeInsets.only(
            top: 5.0,
            bottom: 5.0,
            left: 5.0,
            right: 5.0,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'x${data.qty}',
                    style: TextStyle(
                        fontFamily: 'Varela',
                        color: Colors.grey[800],
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 10.0),
                  Align(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        softWrap: true,
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: 'Varela',
                            color: Colors.grey[800],
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                          text: data.nama_produk,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '${formatter.format(int.parse(data.harga) * int.parse(data.qty))}',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 13.0,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
