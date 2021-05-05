import 'package:flutter/material.dart';
import 'package:xspark/presentation/pages/login_page.dart';
import 'package:xspark/presentation/pages/registration_pages/register_location.dart';
import 'package:xspark/presentation/pages/registration_pages/register_page.dart';

class PreLoginPage extends StatelessWidget {
  // Initilizing variables
  final double defaultPads = 16.0;
  static const routeName = "/preLogin";

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: _preLoginView(context)));
  }

  Widget _preLoginView(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: <Color>[
              Color.fromARGB(255, 255, 146, 19),
              Color.fromARGB(255, 254, 100, 95)
            ],
            stops: [
              0.0,
              1.0
            ]),
      ),
      child: Column(
        children: [_displayMessage(), _actionInputBox(context)],
      ),
    );
  }

  Widget _displayMessage() {
    return Expanded(
      flex: 4,
      child: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "X-Spark",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 50,
                color: Colors.white),
          ),
          Text(
            "Seller App",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 40,
                color: Colors.white),
          ),
        ]),
      ),
    );
  }

  Widget _actionInputBox(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Form(
          child: Column(children: [
            _createAccountButton(context),
            _loginButton(context),
          ]),
        ),
      ),
    );
  }

  Widget _createAccountButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(defaultPads, 18, defaultPads, defaultPads),
      child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, RegisterLocation.routeName);
          },
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(190, 254, 120, 55)),
            minimumSize: MaterialStateProperty.all<Size>(Size.fromHeight(52)),
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 255, 146, 19)),
          ),
          child: Text(
            "Create an Account",
            style: TextStyle(
                color: Colors.white, fontFamily: 'Poppins', fontSize: 14),
          )),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultPads),
      child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, LoginPage.routeName);
          },
          style: ButtonStyle(
            side: MaterialStateProperty.all<BorderSide>(BorderSide(
                color: Color.fromARGB(255, 255, 146, 19), width: 1.0)),
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(0, 255, 146, 19)),
            minimumSize: MaterialStateProperty.all<Size>(Size.fromHeight(52)),
          ),
          child: Text(
            "Login",
            style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
          )),
    );
  }
}
