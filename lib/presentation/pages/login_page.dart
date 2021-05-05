import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xspark/data/authentication/login/bloc/login_bloc.dart';
import 'package:xspark/presentation/pages/home_page.dart';
import 'package:xspark/presentation/pages/registration_pages/register_location.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/login";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Initilizing variables
  final double defaultPads = 16.0;
  bool isPasswordHidden = true;
  final _formKey = GlobalKey<FormState>();

  // Toggles the visibility of the password field
  changePasswordVisiblitiy(bool currentState) {
    setState(() {
      isPasswordHidden = !currentState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: _loginView()));
  }

  Widget _loginView() {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushNamed(context, HomePage.routeName);
        }
      },
      child: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: Container(
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
                  child: IntrinsicHeight(
                    child: Column(
                      children: [_headerBar(), _displayMessage(), _inputBody()],
                    ),
                  ),
                )));
      }),
    );
  }

  Widget _headerBar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(defaultPads, 22, defaultPads, 0),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              )),
              Container(
                  child: TextButton(
                onPressed: () {
                  Navigator.popAndPushNamed(
                      context, RegisterLocation.routeName);
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Colors.white),
                ),
              ))
            ],
          );
        },
      ),
    );
  }

  Widget _displayMessage() {
    return Container(
      margin: EdgeInsets.fromLTRB(defaultPads, 24.0, defaultPads, 26.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text("Hello, \nWelcome Back!",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 36,
                color: Colors.white)),
      ),
    );
  }

  Widget _inputBody() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Form(
          key: _formKey,
          child: Column(children: [
            _userIdInput(),
            _userPasswordInput(),
            _forgotPassowrd(),
            _loginButton(),
            _loginHelp()
          ]),
        ),
      ),
    );
  }

  Widget _userIdInput() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.fromLTRB(defaultPads, 43, defaultPads, 0),
          child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                hintText: 'Mobile number or email'),
            validator: (value) =>
                state.isUsernameValid ? null : 'Username is too short',
            onChanged: (value) => BlocProvider.of<LoginBloc>(context)
                .add(LoginUsernameChanged(username: value)),
          ),
        );
      },
    );
  }

  Widget _userPasswordInput() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.fromLTRB(defaultPads, defaultPads, defaultPads, 0),
          child: TextFormField(
            obscureText: isPasswordHidden,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                hintText: 'Password',
                suffixIcon: IconButton(
                  icon: isPasswordHidden
                      ? Icon(Icons.visibility, color: Colors.grey)
                      : Icon(Icons.visibility, color: Colors.blue),
                  onPressed: () {
                    changePasswordVisiblitiy(isPasswordHidden);
                  },
                )),
            validator: (value) =>
                state.isPasswordValid ? null : 'Password is too short',
            onChanged: (value) => BlocProvider.of<LoginBloc>(context)
                .add(LoginPasswordChanged(password: value)),
          ),
        );
      },
    );
  }

  Widget _forgotPassowrd() {
    return Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPads),
          child: TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
              )),
        ));
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPads),
          child: TextButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  BlocProvider.of<LoginBloc>(context).add(LoginSubmitted());
                }
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 255, 146, 19)),
                  minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 48),
                  )),
              child: Text(
                "Login",
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Poppins', fontSize: 14),
              )),
        );
      },
    );
  }

  Widget _loginHelp() {
    return Container(
        margin: EdgeInsets.fromLTRB(0, defaultPads, 0, 0),
        child: Text(
          "Need help with login ?",
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w400),
        ));
  }
}
