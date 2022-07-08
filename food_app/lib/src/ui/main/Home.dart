import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/bloc/KategoriBloc.dart';
import 'package:food_app/src/bloc/KeranjangBloc.dart';
import 'package:food_app/src/bloc/ProdukBloc.dart';
import 'package:food_app/src/model/KategoriModel.dart';
import 'package:food_app/src/ui/main/Keranjang.dart';
import 'package:food_app/src/ui/main/Login.dart';
import 'package:food_app/src/ui/main/Produk.dart';
import 'package:food_app/src/utility/SessionManager.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String kategori = 'all';
  String id_pelanggan = '';
  bool? isLogin = false;
  int totalItem = 0;

  @override
  void initState() {
    _tabController = TabController(length: 7, vsync: this);
    _getLogin();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    produkBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    produkBloc.getProduk(kategori);
    kategoriBloc.getKategori();
    return StreamBuilder(
        stream: kategoriBloc.countKategori,
        builder: (context, AsyncSnapshot<List<KategoriModel>> s) {
          print("Data Sini: ${s.hasData}");
          if (s.hasData) {
            List namaKategori = ["all"];
            List<Tab> tabs = <Tab>[
              Tab(
                child: Text(
                  'Semua',
                  style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 16.0,
                  ),
                ),
              )
            ];
            for (int i = 0; i < s.data!.length; i++) {
              namaKategori.add(s.data![i].nama_kategori);
              tabs.add(Tab(
                child: Text(
                  s.data![i].nama_kategori,
                  style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 16.0,
                  ),
                ),
              ));
            }
            return DefaultTabController(
              length: s.data!.length + 1,
              child: Scaffold(
                  backgroundColor: Colors.grey,
                  appBar: AppBar(
                    textTheme: TextTheme(),
                    backgroundColor: Colors.white,
                    brightness: Brightness.dark,
                    elevation: 0.0,
                    title: Text(
                      'Z Restaurant',
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Varela'),
                      textAlign: TextAlign.start,
                    ),
                    actions: [
                      Badge(
                          badgeContent: Text(
                            '$totalItem',
                            style:
                                TextStyle(color: Colors.white, fontSize: 10.0),
                          ),
                          showBadge: totalItem == 0 ? false : true,
                          position: BadgePosition.bottomStart(
                              bottom: 5.0, start: 4.0),
                          badgeColor: Colors.lightBlue[800]!,
                          toAnimate: true,
                          animationDuration: Duration(milliseconds: 200),
                          animationType: BadgeAnimationType.scale,
                          child: IconButton(
                            onPressed: () {
                              if (isLogin!) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Keranjang(
                                            id_pelanggan: id_pelanggan,
                                            getTotalItem: _getTotalItem)));
                              } else {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Login(),
                                    ),
                                    (router) => false);
                              }
                            },
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.lightBlue[600],
                            ),
                          )),
                    ],
                    bottom: TabBar(
                        indicatorColor: Colors.white,
                        labelColor: Colors.lightBlue[800],
                        isScrollable: true,
                        labelPadding: EdgeInsets.only(left: 20.0, right: 20.0),
                        unselectedLabelColor: Color(0xFFCDCDCD),
                        onTap: (int value) {
                          setState(() {
                            kategori = namaKategori[value].toString();
                          });
                        },
                        tabs: tabs),
                  ),
                  body: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Produk(
                          kategori: "all",
                          id_pelanggan: id_pelanggan,
                          isLogin: isLogin!,
                          getTotalItem: _getTotalItem),
                      for (int i = 0; i < s.data!.length; i++)
                        Produk(
                            kategori: s.data![i].nama_kategori,
                            id_pelanggan: id_pelanggan,
                            isLogin: isLogin!,
                            getTotalItem: _getTotalItem),
                    ],
                  )),
            );
          }
          if (s.hasError) print(s.error.toString());
          return Scaffold(
            body: Center(
                child: Text(s.hasError ? s.error.toString() : "Loading...")),
          );
        });
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
}
