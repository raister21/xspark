part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  final String ownerName;
  final String shopName;
  final String email;
  final String mobile;
  final String password;
  final String location;
  bool get isPasswordlValid => (password != null) ? password.length > 8 : false;
  bool get isOwnerNameValid =>
      (ownerName != null) ? ownerName.length > 1 : false;
  bool get isShopNameValid => (shopName != null) ? shopName.length > 3 : false;
  bool get isMobilelValid => (mobile != null) ? mobile.length > 6 : false;
  bool get isEmailValid => (email != null) ? email.length > 5 : false;
  final bool isVerified;

  const RegistrationState(
      {this.ownerName,
      this.shopName,
      this.email,
      this.mobile,
      this.password,
      this.location,
      this.isVerified});

  RegistrationState copywith(
      {String ownerName,
      String shopName,
      String email,
      String mobile,
      String password,
      String location,
      bool isVerified}) {
    return RegistrationState(
        ownerName: ownerName ?? this.ownerName,
        shopName: shopName ?? this.shopName,
        email: email ?? this.email,
        mobile: mobile ?? this.mobile,
        password: password ?? this.password,
        location: location ?? this.location,
        isVerified: isVerified ?? this.isVerified);
  }

  @override
  List<Object> get props =>
      [ownerName, shopName, email, mobile, password, location, isVerified];
}

class RegistrationInitial extends RegistrationState {}

class RegistrationLocationAdded extends RegistrationState {
  final String location;
  RegistrationLocationAdded({@required this.location});
}

class RegistrationLoading extends RegistrationState {}

class VerificationLoading extends RegistrationState {}

class RegistrationProcessing extends RegistrationState {
  final String ownerName;
  final String shopName;
  final String email;
  final String mobile;
  final String password;
  final String location;

  RegistrationProcessing(
      {@required this.ownerName,
      @required this.shopName,
      @required this.email,
      @required this.mobile,
      @required this.password,
      @required this.location})
      : super(
            ownerName: ownerName,
            shopName: shopName,
            email: email,
            mobile: mobile,
            password: password,
            location: location);
}

class RegistrationVerifying extends RegistrationState {}

class RegistrationSuccess extends RegistrationState {
  final String ownerName;
  final String shopName;
  final String email;
  final String mobile;
  final String password;
  final String location;
  final bool isVerified;

  RegistrationSuccess({
    @required this.ownerName,
    @required this.shopName,
    @required this.email,
    @required this.mobile,
    @required this.password,
    @required this.location,
    @required this.isVerified,
  }) : super(
            ownerName: ownerName,
            shopName: shopName,
            email: email,
            mobile: mobile,
            password: password,
            location: location);
}

class RegistrationFailed extends RegistrationState {}
