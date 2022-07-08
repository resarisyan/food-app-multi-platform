import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/bloc/AuthBloc.dart';
import 'package:food_app/src/ui/main/Login.dart';
import 'package:food_app/src/utility/SessionManager.dart';
import 'package:food_app/src/utility/ShowToast.dart';

class KonfirmasiPassword extends StatefulWidget {
  String id;

  KonfirmasiPassword({
    required this.id,
  });
  @override
  State<KonfirmasiPassword> createState() => _KonfirmasiPasswordState();
}

class _KonfirmasiPasswordState extends State<KonfirmasiPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _konfirmasiController = TextEditingController();

  bool isCek = false;
  bool isValidKonfirmasi = false;
  bool isValidPassword = false;
  String isValidKonfirmasiText = 'Email Harus Diisi';
  String isValidPasswordText = 'Masukan Lagi Password Anda';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future.value(false);
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: StatefulBuilder(
                builder: (BuildContext context, StateSetter state) {
              return Container(
                height: MediaQuery.of(context).size.height + 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage('assets/img/bg.jpg'),
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.05), BlendMode.dstATop),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    getTitle(),
                    getPassword(state),
                    getKonfirmasi(state),
                    getButton(state),
                    getCekEmail(),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget getTitle() {
    return Container(
      padding: EdgeInsets.only(top: 40.0, bottom: 40.0),
      child: Column(
        children: [
          Text(
            'LUPA PASSWORD',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
          ),
          Text(
            'Silahkan Masukan Password Baru Anda.',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0),
          )
        ],
      ),
    );
  }

  Widget getPassword(state) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 40.0),
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue[800],
                    fontSize: 15.0,
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(
            left: 40.0,
            right: 40.0,
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 0.0, right: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: _passwordController,
                  autofocus: false,
                  onChanged: (text) {
                    validatePassword(state);
                  },
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      hintText: '******',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )),
                  autovalidateMode: AutovalidateMode.always,
                  autocorrect: false,
                  maxLengthEnforced: true,
                  obscureText: true,
                  validator: (value) {
                    return !isValidPassword ? isValidPasswordText : null;
                  },
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 24.0,
        )
      ],
    );
  }

  Widget getKonfirmasi(state) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 40.0),
                child: Text(
                  'Konfirmasi Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue[800],
                    fontSize: 15.0,
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(
            left: 40.0,
            right: 40.0,
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 0.0, right: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: _konfirmasiController,
                  autofocus: false,
                  onChanged: (text) {
                    validateKonfirmasi(state);
                  },
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      hintText: '******',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )),
                  autovalidateMode: AutovalidateMode.always,
                  autocorrect: false,
                  maxLengthEnforced: true,
                  obscureText: true,
                  validator: (value) {
                    return !isValidKonfirmasi ? isValidKonfirmasiText : null;
                  },
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 24.0,
        )
      ],
    );
  }

  Widget getButton(state) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 24.0),
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  color: !isValidPassword || !isValidKonfirmasi
                      ? Colors.lightBlue[800]!.withOpacity(0.5)
                      : Colors.lightBlue[800],
                  onPressed: () {
                    if (isValidPassword && isValidKonfirmasi) {
                      _simpanPassword();
                    } else {
                      validatePassword(state);
                      validateKonfirmasi(state);
                    }
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          isCek
                              ? Container(
                                  height: 16.0,
                                  width: 16.0,
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                    strokeWidth: 2.0,
                                  ),
                                )
                              : Expanded(
                                  child: Text(
                                    'SIMPAN',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24.0,
        )
      ],
    );
  }

  Widget getCekEmail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            'Kembali',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue[800],
                fontSize: 14.0),
          ),
        )
      ],
    );
  }

  validatePassword(StateSetter updateState) async {
    if (_passwordController.text.length >= 6) {
      updateState(() {
        isValidPassword = true;
      });
    } else {
      updateState(() {
        isValidPassword = false;
      });
    }
  }

  validateKonfirmasi(StateSetter updateState) async {
    if (_konfirmasiController.text == _passwordController.text) {
      updateState(() {
        isValidKonfirmasi = true;
      });
    } else {
      updateState(() {
        isValidKonfirmasi = false;
        isValidKonfirmasiText = 'Password Tidak Sama';
      });
    }
  }

  _simpanPassword() async {
    final res =
        await authBloc.simpanPassword(widget.id, _passwordController.text);

    bool status = res['status'];
    String message = res['message'];

    if (status) {
      print(message);
      ShowToast().showToastSuccess('Password Berhasil Diubah!');

      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Login()), (route) => false);
    } else {
      print(message);

      ShowToast().showToastError('Password Gagal Diubah!');
    }
  }
}
