part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class LocationSelected extends RegistrationEvent {
  final String location;
  const LocationSelected({@required this.location});
}

class OwnerNameChanged extends RegistrationEvent {
  final String ownerName;
  const OwnerNameChanged({this.ownerName});
}

class ShopNameChanged extends RegistrationEvent {
  final String shopName;
  const ShopNameChanged({this.shopName});
}

class EmailChanged extends RegistrationEvent {
  final String email;
  const EmailChanged({this.email});
}

class MobileNumberChanged extends RegistrationEvent {
  final String mobile;
  const MobileNumberChanged({this.mobile});
}

class PasswordChanged extends RegistrationEvent {
  final String password;
  const PasswordChanged({this.password});
}

class SignUpSubmitted extends RegistrationEvent {
  final String ownerName;
  final String shopName;
  final String email;
  final String mobile;
  final String password;
  final String location;

  const SignUpSubmitted(
      {@required this.ownerName,
      @required this.shopName,
      @required this.email,
      @required this.mobile,
      @required this.password,
      @required this.location});
}

class SubmitVerification extends RegistrationEvent {
  final String ownerName;
  final String shopName;
  final String email;
  final String mobile;
  final String password;
  final String location;
  final String verificationCode;
  SubmitVerification(
      {@required this.ownerName,
      @required this.shopName,
      @required this.email,
      @required this.mobile,
      @required this.password,
      @required this.location,
      @required this.verificationCode});
}
