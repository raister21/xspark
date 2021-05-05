import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xspark/data/authentication/registration/bloc/registration_bloc.dart';
import 'package:xspark/presentation/pages/add_details_pages/add_details_page.dart';

class RegisterVerificationPage extends StatefulWidget {
  // Initilizing variables
  static const String routeName = '/register/verification';

  @override
  _RegisterVerificationPageState createState() =>
      _RegisterVerificationPageState();
}

class _RegisterVerificationPageState extends State<RegisterVerificationPage> {
  final double defaultPads = 16.0;
  int _count;
  String _verificationCode;
  bool isItPressed = false;

  @override
  void initState() {
    _count = 0;
    _verificationCode = "";

    focusNodes[_count].requestFocus();
    super.initState();
  }

  final List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode()
  ];
  final List<TextEditingController> textControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  bool _isVerificationCodeValid() {
    for (var controller in textControllers) {
      if (controller.text == null) {
        return false;
      }
    }
    return true;
  }

  Widget _changeLoginText(bool isItPressed) {
    if (isItPressed) {
      return CircularProgressIndicator(
        strokeWidth: 2,
        backgroundColor: Colors.white,
      );
    } else {
      return Text(
        "Proceed",
        style:
            TextStyle(color: Colors.white, fontFamily: 'Poppins', fontSize: 14),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: _registerVerificationView()));
  }

  Widget _registerVerificationView() {
    return BlocListener<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        if (state is RegistrationSuccess) {
          setState(() {
            isItPressed = false;
          });
          int count = 0;
          Navigator.of(context).popUntil((_) => count++ >= 2);
          Navigator.pushReplacementNamed(context, AddDetailsPage.routeName);
        }
      },
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _displayMessage(),
              _displayEmail(),
              _verificationCodeInput(),
              _proceedButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _displayMessage() {
    return Text("Enter the code that was sent to",
        style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.black));
  }

  Widget _displayEmail() {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return TextButton(
            onPressed: () {},
            child: Text(
                state.email ?? "Please wait, we're processing your account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                )));
      },
    );
  }

  Widget _verificationCodeInput() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _verificationInput(focusNodes[0], textControllers[0]),
          _verificationInput(focusNodes[1], textControllers[1]),
          _verificationInput(focusNodes[2], textControllers[2]),
          _verificationInput(focusNodes[3], textControllers[3]),
          _verificationInput(focusNodes[4], textControllers[4]),
          _verificationInput(focusNodes[5], textControllers[5])
        ],
      ),
    );
  }

  Widget _verificationInput(
      FocusNode _focus, TextEditingController _controller) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 228, 228, 228), shape: BoxShape.rectangle),
      child: Center(
          child: TextField(
        focusNode: _focus,
        controller: _controller,
        decoration: InputDecoration(counterText: ""),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          if (value.length > 0 && _count < 5) {
            setState(() {
              _count++;
            });
            focusNodes[_count].requestFocus();
          }
        },
        showCursor: false,
        maxLength: 1,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: 'Poppins', fontSize: 25, fontWeight: FontWeight.w400),
      )),
    );
  }

  Widget _proceedButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultPads),
      child: BlocConsumer<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state is VerificationLoading) {
            setState(() {
              isItPressed = true;
            });
          }
        },
        builder: (context, state) {
          return TextButton(
            onPressed: () {
              if (_isVerificationCodeValid()) {
                for (var controller in textControllers) {
                  _verificationCode += controller.text;
                }
                BlocProvider.of<RegistrationBloc>(context).add(
                    SubmitVerification(
                        ownerName: state.ownerName,
                        shopName: state.shopName,
                        email: state.email,
                        mobile: state.mobile,
                        password: state.password,
                        location: state.location,
                        verificationCode: _verificationCode));
              }

              // TODO: Throw
            },
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all<Size>(Size.fromHeight(52)),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 255, 146, 19)),
            ),
            child: _changeLoginText(isItPressed),
          );
        },
      ),
    );
  }
}
