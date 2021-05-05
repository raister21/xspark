import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xspark/data/authentication/login/bloc/login_bloc.dart';
import 'package:xspark/data/authentication/registration/bloc/registration_bloc.dart';
import 'package:xspark/data/userdetails/bloc/userdetails_bloc.dart';
import 'package:xspark/presentation/pages/add_details_pages/add_details_page.dart';
import 'package:xspark/presentation/pages/home_page.dart';
import 'package:xspark/presentation/pages/login_page.dart';
import 'package:xspark/presentation/pages/pre_login_page.dart';
import 'package:xspark/presentation/pages/registration_pages/register_location.dart';
import 'package:xspark/presentation/pages/registration_pages/register_page.dart';
import 'package:xspark/presentation/pages/registration_pages/register_verification_page.dart';

class RouteGenerator {
  final LoginBloc _loginBloc = LoginBloc();
  final RegistrationBloc _registerBloc = RegistrationBloc();
  final UserdetailsBloc _userdetailsBloc = UserdetailsBloc();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => PreLoginPage());
      case LoginPage.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _loginBloc,
            child: LoginPage(),
          ),
        );
      case RegisterLocation.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _registerBloc,
            child: RegisterLocation(),
          ),
        );
      case RegisterPage.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _registerBloc,
            child: RegisterPage(),
          ),
        );
      case RegisterVerificationPage.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _registerBloc,
            child: RegisterVerificationPage(),
          ),
        );
      case AddDetailsPage.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _userdetailsBloc,
            child: AddDetailsPage(),
          ),
        );
      case HomePage.routeName:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => PreLoginPage(),
        );
    }
  }

  void dispose() {
    _loginBloc.close();
    _registerBloc.close();
  }
}
