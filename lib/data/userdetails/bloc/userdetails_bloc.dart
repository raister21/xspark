import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:xspark/data/userdetails/address_model.dart';
import 'package:xspark/data/userdetails/bank_model.dart';
import 'package:xspark/data/userdetails/tax_model.dart';

part 'userdetails_event.dart';
part 'userdetails_state.dart';

class UserdetailsBloc extends Bloc<UserdetailsEvent, UserdetailsState> {
  UserdetailsBloc() : super(UserdetailsInitial());

  @override
  Stream<UserdetailsState> mapEventToState(
    UserdetailsEvent event,
  ) async* {
    if (event is WarehouseAddressChanged) {
      yield state.copyWith(warehouseAddress: event.warehouseAddress);
    } else if (event is WarehouseZoneChanged) {
      yield state.copyWith(warehouseZone: event.warehouseZone);
    } else if (event is WarehouseProvinceChanged) {
      yield state.copyWith(warehouseProvince: event.warehouseProvince);
    } else if (event is BuisnessAddressChanged) {
      yield state.copyWith(buisnessAddress: event.buisnessAddress);
    } else if (event is BuisnessZoneChanged) {
      yield state.copyWith(buisnessZone: event.buisnessZone);
    } else if (event is BuisnessProvinceChanged) {
      yield state.copyWith(buisnessProvince: event.buisnessProvince);
    } else if (event is ReturnAddressChanged) {
      yield state.copyWith(returnAddress: event.returnAddress);
    } else if (event is ReturnZoneChanged) {
      yield state.copyWith(returnZone: event.returnZone);
    } else if (event is ReturnProvinceChanged) {
      yield state.copyWith(returnProvince: event.returnProvince);
    } else if (event is BuisnessDetailsSameAsWarehouseClicked) {
      yield state.copyWith(
          buisnessAddress: event.buisnessAddress,
          buisnessZone: event.buisnessZone,
          buisnessProvince: event.buisnessProvince);
    } else if (event is ReturnDetailsSameAsWarehouseClicked) {
      yield state.copyWith(
          returnAddress: event.returnAddress,
          returnZone: event.returnZone,
          returnProvince: event.returnProvince);
    } else if (event is LegalNameChanged) {
      state.copyWith(legalName: event.legalName);
    } else if (event is PanNumberChanged) {
      state.copyWith(panNumber: event.panNumber);
    } else if (event is BankAccountNameChanged) {
      state.copyWith(bankAccountName: event.bankAccountName);
    } else if (event is BankAccountNumberChanged) {
      state.copyWith(bankAcNumber: event.bankAcNumber);
    } else if (event is BankChanged) {
      state.copyWith(bankName: event.bankName);
    } else if (event is BankBranchChanged) {
      state.copyWith(bankBranch: event.bankBranch);
    } else if (event is SubmitUserDetails) {
      yield UserdetailsSubmitting();
      try {
        await Future.delayed(Duration(seconds: 3));
        yield UserdetailsSuccessfulSubmission();
      } catch (e) {
        print(e);
        yield UserdetailsFailedSubmission();
      }
    }
  }
}
