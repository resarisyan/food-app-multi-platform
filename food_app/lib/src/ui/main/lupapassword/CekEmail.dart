import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/bloc/AuthBloc.dart';
import 'package:food_app/src/ui/main/lupapassword/KonfirmasiPassword.dart';
import 'package:food_app/src/utility/ShowToast.dart';

class CekEmail extends StatefulWidget {
  @override
  State<CekEmail> createState() => _CekEmailState();
}

class _CekEmailState extends State<CekEmail> {
  final TextEditingController _emailController = TextEditingController();

  bool isCek = false;
  bool isValidEmail = false;
  String isValidEmailText = 'Email Harus Diisi';

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
                    getEmail(state),
                    getButton(state),
                    getLogin(),
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
            'Silahkan Masukan Alamat Email Dibawah Ini.',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0),
          )
        ],
      ),
    );
  }

  Widget getEmail(state) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 40.0),
                child: Text(
                  'Email',
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
                  keyboardType: TextInputType.text,
                  controller: _emailController,
                  autofocus: false,
                  onChanged: (text) {
                    validateEmail(state);
                  },
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      hintText: 'example@gmail.com',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )),
                  autovalidateMode: AutovalidateMode.always,
                  autocorrect: false,
                  maxLengthEnforced: true,
                  validator: (value) {
                    return !isValidEmail ? isValidEmailText : null;
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
                  color: !isValidEmail
                      ? Colors.lightBlue[800]!.withOpacity(0.5)
                      : Colors.lightBlue[800],
                  onPressed: () {
                    if (isValidEmail) {
                      _getValidateEmail();
                    } else {
                      validateEmail(state);
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
                                    'LANJUTKAN',
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

  Widget getLogin() {
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

  validateEmail(StateSetter updateState) async {
    if (!EmailValidator.validate(_emailController.text)) {
      updateState(() {
        isValidEmailText = 'Email Tidak Valid!';
        isValidEmail = false;
      });
    } else {
      updateState(() {
        isValidEmail = true;
      });
    }
  }

  _getValidateEmail() async {
    setState(() {
      isCek = true;
    });

    final res = await authBloc.getValidateEmail(
      _emailController.text,
    );

    bool status = res['status'];
    String message = res['message'];

    if (status) {
      print(message);

      setState(() {
        isCek = false;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => KonfirmasiPassword(
              id: res['data']['id'],
            ),
          ));
    } else {
      print(message);
      setState(() {
        isCek = false;
      });
      ShowToast().showToastError('Email Belum Terdaftar!');
    }
  }
}
