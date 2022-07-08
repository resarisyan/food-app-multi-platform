import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/bloc/AuthBloc.dart';
import 'package:food_app/src/ui/main/MainNavigation.dart';
import 'package:food_app/src/ui/main/Register.dart';
import 'package:food_app/src/ui/main/lupapassword/CekEmail.dart';
import 'package:food_app/src/utility/SessionManager.dart';
import 'package:food_app/src/utility/ShowToast.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLogin = false;
  bool isValidEmail = false;
  bool isValidPassword = false;
  String isValidEmailText = 'Email Harus Diisi';
  String isValidPasswordText = 'Password Harus Diisi';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MainNavigation()),
            (route) => false);
        return Future.value(false);
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: StatefulBuilder(
                builder: (BuildContext context, StateSetter state) {
              return Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage('assets/img/bg.jpg'),
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.05), BlendMode.dstATop),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    getLogo(),
                    getEmail(state),
                    getPassword(state),
                    getButtonLogin(state),
                    getRegistrasi(),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget getLogo() {
    return Container(
      padding: EdgeInsets.all(60.0),
      child: Center(
        child: Image.asset(
          'assets/img/logo.png',
          width: 100.0,
          color: Colors.lightBlue[800],
        ),
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

  Widget getButtonLogin(state) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 40.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CekEmail()),
                  );
                },
                child: Text(
                  'Lupa Password?',
                  style:
                      TextStyle(color: Colors.lightBlue[800], fontSize: 14.0),
                ),
              ),
            )
          ],
        ),
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
                  color: !isValidEmail || !isValidPassword
                      ? Colors.lightBlue[800]!.withOpacity(0.5)
                      : Colors.lightBlue[800],
                  onPressed: () {
                    if (isValidEmail && isValidPassword) {
                      _getValidateEmail();
                    } else {
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
                          isLogin
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
                                    'LOGIN',
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

  Widget getRegistrasi() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Belum Punya Akun?',
          style: TextStyle(
            fontFamily: 'Varela',
            fontWeight: FontWeight.w400,
            color: Colors.grey,
            fontSize: 14.0,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Register()));
          },
          child: Text(
            'Daftar',
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
      isLogin = true;
    });

    final res = await authBloc.getValidateEmail(
      _emailController.text,
    );

    bool status = res['status'];
    String message = res['message'];

    if (status) {
      print(message);

      setState(() {
        isLogin = false;
      });
      _login();
    } else {
      print(message);
      setState(() {
        isLogin = false;
      });

      ShowToast().showToastError(
          'Email Anda Belum Terdaftar! Silahkan Daftar Terlebih Dahulu.');
    }
  }

  _login() async {
    final res =
        await authBloc.login(_emailController.text, _passwordController.text);

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

      // ShowToast()
      //     .showToastError('Email/Password Salah! Silahkan Coba Kembali.');
      ShowToast().showToastError(message);
    }
  }
}
