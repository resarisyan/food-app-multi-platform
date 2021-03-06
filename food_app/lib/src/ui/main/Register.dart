import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/bloc/AuthBloc.dart';
import 'package:food_app/src/ui/main/Login.dart';
import 'package:food_app/src/ui/main/MainNavigation.dart';
import 'package:food_app/src/utility/SessionManager.dart';
import 'package:food_app/src/utility/ShowToast.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _noTelpController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isRegister = false;
  bool isValidNama = false;
  bool isValidNoTelp = false;
  bool isValidEmail = false;
  bool isValidPassword = false;
  String isValidNamaText = 'Nama Harus Diisi';
  String isValidNoTelpText = 'Masukan No. Telepon';
  String isValidEmailText = 'Email Harus Diisi';
  String isValidPasswordText = 'Password Harus Diisi';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => Login()), (route) => false);
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
                    getNama(state),
                    getNoTelp(state),
                    getEmail(state),
                    getPassword(state),
                    getButtonRegister(state),
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
            'REGISTRASI',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
          ),
          Text(
            'Silahkan Isi Form Registrasi Dibawah Ini.',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0),
          )
        ],
      ),
    );
  }

  Widget getNama(state) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 40.0),
                child: Text(
                  'Nama',
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
                  controller: _namaController,
                  autofocus: false,
                  onChanged: (text) {
                    validateNama(state);
                  },
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      hintText: 'example',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )),
                  autovalidateMode: AutovalidateMode.always,
                  autocorrect: false,
                  maxLengthEnforced: true,
                  validator: (value) {
                    return !isValidNama ? isValidNamaText : null;
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

  Widget getNoTelp(state) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 40.0),
                child: Text(
                  'No. Telepon',
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
                  keyboardType: TextInputType.number,
                  controller: _noTelpController,
                  autofocus: false,
                  onChanged: (text) {
                    validateNoTelp(state);
                  },
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          '+62',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.black),
                        ),
                      ),
                      hintText: '08xxx xxxx xxxx',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )),
                  autovalidateMode: AutovalidateMode.always,
                  autocorrect: false,
                  maxLengthEnforced: true,
                  validator: (value) {
                    return !isValidNoTelp ? isValidNoTelpText : null;
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

  Widget getButtonRegister(state) {
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
                  color: !isValidNama ||
                          !isValidNoTelp ||
                          !isValidEmail ||
                          !isValidPassword
                      ? Colors.lightBlue[800]!.withOpacity(0.5)
                      : Colors.lightBlue[800],
                  onPressed: () {
                    if (isValidNama &&
                        isValidNoTelp &&
                        isValidEmail &&
                        isValidPassword) {
                      _getValidateEmail();
                    } else {
                      validateNama(state);
                      validateNoTelp(state);
                      validateEmail(state);
                      validatePassword(state);
                    }
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          isRegister
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
                                    'REGISTER',
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
        Text(
          'Sudah Punya Akun?',
          style: TextStyle(
            fontFamily: 'Varela',
            fontWeight: FontWeight.w400,
            color: Colors.grey,
            fontSize: 14.0,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Login()),
                (route) => false);
          },
          child: Text(
            'Login',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue[800],
                fontSize: 14.0),
          ),
        )
      ],
    );
  }

  validateNama(StateSetter updateState) async {
    if (_namaController.text != '') {
      updateState(() {
        isValidNama = true;
      });
    } else {
      updateState(() {
        isValidEmail = false;
      });
    }
  }

  validateNoTelp(StateSetter updateState) async {
    if (_noTelpController.text.length >= 10) {
      updateState(() {
        isValidNoTelp = true;
      });
    } else if (_noTelpController.text.length <= 10) {
      updateState(() {
        isValidNoTelp = false;
        isValidNoTelpText = 'Min. 10 Angka';
      });
    }
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

  _getValidateEmail() async {
    setState(() {
      isRegister = true;
    });

    final res = await authBloc.getValidateEmail(
      _emailController.text,
    );

    bool status = res['status'];
    String message = res['message'];

    if (status) {
      print(message);

      setState(() {
        isRegister = false;
      });
      ShowToast().showToastError('Email Anda Sudah Terdaftar!');
    } else {
      print(message);
      setState(() {
        isRegister = false;
      });

      _register();
    }
  }

  _register() async {
    final res = await authBloc.register(
        _namaController.text,
        _noTelpController.text,
        _emailController.text,
        _passwordController.text);

    bool status = res['status'];
    String message = res['message'];

    if (status) {
      print(message);
      SessionManager().setSession(res['data']['id']);

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainNavigation()),
          (route) => false);
    } else {
      print(message);

      ShowToast().showToastError('Registrasi Gagal! Silahkan Coba Kembali.');
    }
  }
}
