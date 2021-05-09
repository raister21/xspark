import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xspark/data/authentication/registration/bloc/registration_bloc.dart';
import 'package:xspark/presentation/pages/registration_pages/register_page.dart';

class RegisterLocation extends StatelessWidget {
// Initializing variables
  final double defaultPads = 16.0;
  static const routeName = "/registerLocation";

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: _registerLocation()));
  }

  Widget _registerLocation() {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          _displayMessage(),
          _locationInputBox(),
        ],
      ),
    );
  }

  Widget _displayMessage() {
    return Expanded(
      flex: 1,
      child: Container(
        alignment: AlignmentDirectional.bottomStart,
        padding: EdgeInsets.fromLTRB(defaultPads, 0, defaultPads, 0),
        child: Text(
          "Create an account as",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 36,
              color: Color.fromARGB(255, 255, 146, 19)),
        ),
      ),
    );
  }

  Widget _locationInputBox() {
    return Expanded(
      flex: 4,
      child: Container(
        padding: EdgeInsets.fromLTRB(defaultPads, 0, defaultPads, 70),
        child: Row(
          children: [
            _locationWidget("Nepal", "nepalFlag.png"),
            _dividerText(),
            _locationWidget("Japan", "japanFlag.png")
          ],
        ),
      ),
    );
  }

  Widget _locationWidget(String locationName, String image) {
    return Expanded(
      child: BlocBuilder<RegistrationBloc, RegistrationState>(
        builder: (context, state) {
          return TextButton(
            onPressed: () {
              if (locationName == "Nepal") {
                BlocProvider.of<RegistrationBloc>(context).add(
                  LocationSelected(location: locationName),
                );
              } else {
                BlocProvider.of<RegistrationBloc>(context).add(
                  LocationSelected(location: locationName),
                );
              }
              Navigator.pushNamed(context, RegisterPage.routeName);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: defaultPads),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                    color: Color.fromARGB(255, 255, 146, 19), width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Text(
                      "$locationName\nSeller",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 255, 146, 19),
                      ),
                    ),
                  ),
                  Image(
                    image: AssetImage('assets/images/$image'),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _dividerText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Text(
        "Or",
        style: TextStyle(
          fontFamily: "Poppins",
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 255, 146, 19),
        ),
      ),
    );
  }
}
