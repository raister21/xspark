import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial());

  @override
  Stream<RegistrationState> mapEventToState(
    RegistrationEvent event,
  ) async* {
    if (event is LocationSelected) {
      yield RegistrationLocationAdded(location: event.location);
    } else if (event is OwnerNameChanged) {
      yield state.copywith(ownerName: event.ownerName);
    } else if (event is ShopNameChanged) {
      yield state.copywith(shopName: event.shopName);
    } else if (event is EmailChanged) {
      yield state.copywith(email: event.email);
    } else if (event is MobileNumberChanged) {
      yield state.copywith(mobile: event.mobile);
    } else if (event is PasswordChanged) {
      yield state.copywith(password: event.password);
    } else if (event is SignUpSubmitted) {
      yield RegistrationLoading();

      try {
        await Future.delayed(Duration(seconds: 3));
        yield RegistrationProcessing(
            ownerName: event.ownerName,
            shopName: event.shopName,
            email: event.email,
            mobile: event.mobile,
            password: event.password,
            location: event.location);
      } catch (e) {
        yield RegistrationFailed();
        print(e);
      }
    } else if (event is SubmitVerification) {
      yield VerificationLoading();
      try {
        final isVerified = await Future.delayed(Duration(seconds: 3), () {
          return true;
        });
        yield RegistrationSuccess(
            ownerName: event.ownerName,
            shopName: event.shopName,
            email: event.email,
            mobile: event.mobile,
            password: event.password,
            location: event.location,
            isVerified: isVerified);
      } catch (e) {
        yield RegistrationFailed();
        print(e);
      }
    }
  }
}
