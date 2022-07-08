import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_app/src/bloc/KeranjangBloc.dart';
import 'package:food_app/src/utility/BaseURL.dart';
import 'package:food_app/src/utility/ShowToast.dart';
import 'package:intl/intl.dart';

Widget BuildListKeranjang(
    {required BuildContext context,
    required AsyncSnapshot<List> snapshot,
    required VoidCallback getHasData}) {
  final formatter = NumberFormat("#,###");
  SlidableController slidableController = new SlidableController();

  return Container(
    margin: EdgeInsets.only(
      bottom: 60.0,
    ),
    child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: snapshot.data!.length,
        itemBuilder: (BuildContext context, int i) {
          final data = snapshot.data![i];
          int numQTY = int.parse(data.qty);

          return Slidable(
            controller: slidableController,
            key: Key(data.id),
            actionExtentRatio: 0.25,
            actionPane: SlidableScrollActionPane(),
            child: Padding(
              padding: EdgeInsets.only(
                top: 10.0,
                bottom: 5.0,
                left: 15.0,
                right: 15.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3.0,
                        blurRadius: 5.0)
                  ],
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 90.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                NetworkImage(BaseURL.baseURLImg + data.gambar),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0),
                          )),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                  fontFamily: 'Varela',
                                  color: Colors.grey[800],
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                              text: data.nama_produk,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (numQTY > 1) {
                                    numQTY = numQTY - 1;
                                    _ubahQtyKerjanjang(
                                        data.id, numQTY, data.id_pelanggan);
                                  }
                                },
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.red[600],
                                  size: 24.0,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                '$numQTY',
                                style: TextStyle(
                                    fontFamily: 'Varela',
                                    color: Color(0XFFD17E50),
                                    fontSize: 14.0),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              InkWell(
                                onTap: () {
                                  numQTY = numQTY + 1;
                                  _ubahQtyKerjanjang(
                                      data.id, numQTY, data.id_pelanggan);
                                },
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.green[600],
                                  size: 24.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Total = Rp ${formatter.format(int.parse(data.harga) * int.parse(data.qty))}',
                            style: TextStyle(
                              fontFamily: 'Varela',
                              color: Colors.lightBlue[800],
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            secondaryActions: [
              IconSlideAction(
                caption: 'Hapus Item',
                iconWidget: Icon(
                  Icons.delete_outline,
                  color: Colors.red[600],
                  size: 28.0,
                ),
                onTap: () {
                  _hapusItemKerjanjang(data.id, data.id_pelanggan);
                },
              )
            ],
          );
        }),
  );
}

_ubahQtyKerjanjang(String id, int numQty, String id_pelanggan) async {
  Map<String, String> data = {
    'id': id,
    'qty': numQty.toString(),
  };
  final res = await keranjangBloc.ubahQtyKeranjang(data);

  bool status = res['status'];
  String message = res['message'];

  if (status) {
    keranjangBloc.getKeranjang(id_pelanggan);
    ShowToast().showToastSuccess(message);
  } else {
    ShowToast().showToastError(message);
  }
}

_hapusItemKerjanjang(String id, String id_pelanggan) async {
  final res = await keranjangBloc.hapusItemKeranjang(id);

  bool status = res['status'];
  String message = res['message'];

  if (status) {
    keranjangBloc.getKeranjang(id_pelanggan);
    ShowToast().showToastSuccess(message);
  } else {
    ShowToast().showToastError(message);
  }
}
