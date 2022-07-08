import 'package:flutter/material.dart';
import 'package:food_app/src/bloc/KeranjangBloc.dart';
import 'package:food_app/src/ui/widget/detail/AddCartButton.dart';
import 'package:food_app/src/ui/widget/detail/AppBarDetail.dart';
import 'package:food_app/src/ui/widget/detail/CartCounter.dart';
import 'package:food_app/src/ui/widget/detail/Deskripsi.dart';
import 'package:food_app/src/ui/widget/detail/Favorite.dart';
import 'package:food_app/src/ui/widget/detail/HeaderDetail.dart';
import 'package:food_app/src/utility/SessionManager.dart';
import 'package:food_app/src/utility/ShowToast.dart';

class Detail extends StatefulWidget {
  late String nama_produk;
  late String kategori;
  late String deskripsi;
  late String gambar;
  late int harga;
  VoidCallback getTotalItem;

  Detail(
      {required this.nama_produk,
      required this.kategori,
      required this.deskripsi,
      required this.gambar,
      required this.harga,
      required this.getTotalItem});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  int numQty = 1;
  late int totalItem;
  late String id_pelanggan;
  late bool isLogin;

  @override
  void initState() {
    // TODO: implement initState
    _getLogin();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        widget.getTotalItem();
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.lightBlue[800],
        appBar: AppBarDetail(
            context: context,
            totalItem: totalItem,
            id_pelanggan: id_pelanggan,
            isLogin: isLogin,
            getTotalItem: _getTotalItem,
            getTotalItemHome: widget.getTotalItem),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 220.0),
                    padding: EdgeInsets.only(
                        top: size.height * 0.12, left: 20.0, right: 20.0),
                    width: size.width,
                    height: size.height,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.0),
                          topRight: Radius.circular(24.0),
                        )),
                    child: Column(
                      children: [
                        Deskripsi(
                          deskripsi: widget.deskripsi,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CartCounter(
                                    icon: Icons.remove,
                                    color: Colors.red[600]!,
                                    press: () {
                                      if (numQty > 1) {
                                        setState(() {
                                          numQty--;
                                        });
                                      }
                                    }),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0 / 2),
                                  child: Text(
                                    numQty.toString().padLeft(2, "0"),
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ),
                                CartCounter(
                                    icon: Icons.add,
                                    color: Colors.green[600]!,
                                    press: () {
                                      setState(() {
                                        numQty++;
                                      });
                                    }),
                              ],
                            ),
                            Favorite(),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        AddCartButton(
                          id_pelanggan: id_pelanggan,
                          getTotalItem: _getTotalItem,
                          tambahKeranjang: _tambahKeranjang,
                          isLogin: isLogin,
                        )
                      ],
                    ),
                  ),
                  HeaderDetail(
                      nama_produk: widget.nama_produk,
                      kategori: widget.kategori,
                      harga: widget.harga,
                      gambar: widget.gambar)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _getLogin() async {
    bool _isLogin = await SessionManager().getIsLogin();
    String _id = await SessionManager().getIdPelanggan();

    setState(() {
      isLogin = _isLogin;
      id_pelanggan = _id;
    });
    _getTotalItem();
  }

  _getTotalItem() async {
    setState(() {
      totalItem = 0;
    });

    final res = await keranjangBloc.getTotalItem(id_pelanggan);
    bool status = res['status'];
    String message = res['message'];

    if (status) {
      print(message);
      setState(() {
        totalItem = res['data']['totalItem'];
      });
    } else {
      print(message);
    }
  }

  _tambahKeranjang() async {
    Map<String, String> data = {
      'nama_produk': widget.nama_produk,
      'harga': widget.harga.toString(),
      'qty': numQty.toString(),
      'gambar': widget.gambar,
      'id_pelanggan': id_pelanggan
    };
    final res = await keranjangBloc.tambahKeranjang(data);

    bool status = res['status'];
    String message = res['message'];

    if (status) {
      _getTotalItem();
      setState(() {
        numQty = 1;
      });

      ShowToast().showToastSuccess(message);
    } else {
      print(message);
      ShowToast().showToastSuccess(message);
    }
  }
}
