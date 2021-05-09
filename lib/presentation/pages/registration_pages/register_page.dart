import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xspark/data/authentication/registration/bloc/registration_bloc.dart';
import 'package:xspark/data/customClasses/validator.dart';
import 'package:xspark/presentation/pages/login_page.dart';
import 'package:xspark/presentation/pages/registration_pages/register_verification_page.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = '/register';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Initializing variables
  final double defaultPads = 16.0;
  bool isPasswordHidden = true;
  bool _isItPressed = false;
  final _formKey = GlobalKey<FormState>();
  final _ownerNameKey = GlobalKey<FormFieldState>();
  final _shopNameKey = GlobalKey<FormFieldState>();
  final _emailKey = GlobalKey<FormFieldState>();
  final _mobileKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();
  final Validator _validator = Validator();
  final _focusNode = FocusNode();
  // Toggles the visibility of the password field
  _changePasswordVisiblitiy(bool currentState) {
    setState(() {
      isPasswordHidden = !currentState;
    });
  }

  @override
  void initState() {
    _isItPressed = false;
    super.initState();
  }

  Widget _changeLoginText(bool _isItPressed) {
    if (_isItPressed) {
      return CircularProgressIndicator(
        strokeWidth: 2,
        backgroundColor: Colors.white,
      );
    } else {
      return Text(
        "Sign Up",
        style:
            TextStyle(color: Colors.white, fontFamily: 'Poppins', fontSize: 14),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print(_isItPressed);
    return SafeArea(child: Scaffold(body: _registerView()));
  }

  Widget _registerView() {
    return BlocListener<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        if (state is RegistrationProcessing) {
          setState(() {
            _isItPressed = false;
          });
          Navigator.pushNamed(context, RegisterVerificationPage.routeName);
        }
      },
      child: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
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
                )),
              )),
        );
      }),
    );
  }

  Widget _headerBar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(defaultPads, 22, defaultPads, 0),
      child: BlocBuilder<RegistrationBloc, RegistrationState>(
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
                    )),
              ),
              Container(
                  child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, LoginPage.routeName);
                },
                child: Text(
                  "Login",
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
      padding: EdgeInsets.fromLTRB(defaultPads, 33, defaultPads, 35),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("New to X-Spark?",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                    color: Colors.white)),
            Text("Sign up to get selling!",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                    color: Colors.white)),
          ],
        ),
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
            _ownerNameInput(),
            _shopNameInput(),
            _ownerEmailInput(),
            _ownerMobileInput(),
            _ownerPasswordInput(),
            _signUpButton(),
            _termsCondition()
          ]),
        ),
      ),
    );
  }

  Widget _ownerNameInput() {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.fromLTRB(defaultPads, 43, defaultPads, 0),
          child: TextFormField(
              key: _ownerNameKey,
              maxLength: 16,
              decoration: InputDecoration(
                  counterText: "",
                  // focusedBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.green, width: 2)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  hintText: 'Owner Name'),
              validator: (value) =>
                  _validator.isValidName(value) ? null : 'Name is invalid',
              onChanged: (value) => {
                    BlocProvider.of<RegistrationBloc>(context)
                        .add(OwnerNameChanged(ownerName: value)),
                    _ownerNameKey.currentState.validate()
                  }),
        );
      },
    );
  }

  Widget _shopNameInput() {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.fromLTRB(defaultPads, defaultPads, defaultPads, 0),
          child: TextFormField(
              key: _shopNameKey,
              maxLength: 16,
              decoration: InputDecoration(
                  counterText: "",
                  // focusedBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.green, width: 2)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  hintText: 'Shop Name'),
              validator: (value) => _validator.isValidName(value)
                  ? null
                  : 'Shop name is too short',
              onChanged: (value) => {
                    BlocProvider.of<RegistrationBloc>(context)
                        .add(ShopNameChanged(shopName: value)),
                    _shopNameKey.currentState.validate()
                  }),
        );
      },
    );
  }

  Widget _ownerEmailInput() {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.fromLTRB(defaultPads, defaultPads, defaultPads, 0),
          child: TextFormField(
              key: _emailKey,
              maxLength: 25,
              decoration: InputDecoration(
                  counterText: "",
                  // focusedBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.green, width: 2)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  hintText: 'Email'),
              validator: (value) =>
                  _validator.isValidEmail(value) ? null : 'Email is invalid',
              onChanged: (value) => {
                    BlocProvider.of<RegistrationBloc>(context)
                        .add(EmailChanged(email: value)),
                    _emailKey.currentState.validate()
                  }),
        );
      },
    );
  }

  Widget _ownerMobileInput() {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.fromLTRB(defaultPads, defaultPads, defaultPads, 0),
          child: TextFormField(
              key: _mobileKey,
              maxLength: 10,
              decoration: InputDecoration(
                  counterText: "",
                  // focusedBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.green, width: 2)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  hintText: 'Mobile number'),
              validator: (value) => _validator.isValidMobile(value)
                  ? null
                  : 'Invalid mobile phone number',
              onChanged: (value) => {
                    BlocProvider.of<RegistrationBloc>(context)
                        .add(MobileNumberChanged(mobile: value)),
                    _mobileKey.currentState.validate()
                  }),
        );
      },
    );
  }

  Widget _ownerPasswordInput() {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return Container(
          margin:
              EdgeInsets.fromLTRB(defaultPads, defaultPads, defaultPads, 16),
          child: TextFormField(
              key: _passwordKey,
              maxLength: 16,
              focusNode: _focusNode,
              obscureText: isPasswordHidden,
              decoration: InputDecoration(
                  counterText: "",
                  // focusedBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.green, width: 2)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    icon: isPasswordHidden
                        ? Icon(Icons.visibility, color: Colors.grey)
                        : Icon(Icons.visibility, color: Colors.blue),
                    onPressed: () {
                      _focusNode.unfocus();
                      _focusNode.canRequestFocus = false;
                      _changePasswordVisiblitiy(isPasswordHidden);
                    },
                  )),
              validator: (value) => _validator.isValidPassword(value)
                  ? null
                  : "Password is too short",
              onChanged: (value) => {
                    BlocProvider.of<RegistrationBloc>(context)
                        .add(PasswordChanged(password: value)),
                    _passwordKey.currentState.validate()
                  }),
        );
      },
    );
  }

  Widget _signUpButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultPads),
      child: BlocConsumer<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state is RegistrationLoading) {
            setState(() {
              _isItPressed = true;
            });
          }
        },
        builder: (context, state) {
          return TextButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                BlocProvider.of<RegistrationBloc>(context).add(SignUpSubmitted(
                  ownerName: state.ownerName,
                  shopName: state.shopName,
                  email: state.email,
                  mobile: state.mobile,
                  password: state.password,
                  location: state.location,
                ));
              }
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 255, 146, 19)),
                minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 52),
                )),
            child: _changeLoginText(_isItPressed),
          );
        },
      ),
    );
  }

  Widget _termsCondition() {
    return Container(
        margin: EdgeInsets.all(defaultPads),
        child: Text(
          "By creating an account, you agree to X-Spark’s Conditions of Use and Privacy Notice.",
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w400),
        ));
  }
}
