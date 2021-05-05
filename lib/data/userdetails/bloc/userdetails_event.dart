part of 'userdetails_bloc.dart';

abstract class UserdetailsEvent extends Equatable {
  const UserdetailsEvent();

  @override
  List<Object> get props => [];
}

class WarehouseAddressChanged extends UserdetailsEvent {
  final String warehouseAddress;
  const WarehouseAddressChanged({@required this.warehouseAddress});
}

class WarehouseZoneChanged extends UserdetailsEvent {
  final String warehouseZone;
  const WarehouseZoneChanged({@required this.warehouseZone});
}

class WarehouseProvinceChanged extends UserdetailsEvent {
  final String warehouseProvince;
  const WarehouseProvinceChanged({@required this.warehouseProvince});
}

class BuisnessAddressChanged extends UserdetailsEvent {
  final String buisnessAddress;
  const BuisnessAddressChanged({@required this.buisnessAddress});
}

class BuisnessZoneChanged extends UserdetailsEvent {
  final String buisnessZone;
  const BuisnessZoneChanged({@required this.buisnessZone});
}

class BuisnessProvinceChanged extends UserdetailsEvent {
  final String buisnessProvince;
  const BuisnessProvinceChanged({@required this.buisnessProvince});
}

class ReturnAddressChanged extends UserdetailsEvent {
  final String returnAddress;
  const ReturnAddressChanged({@required this.returnAddress});
}

class ReturnZoneChanged extends UserdetailsEvent {
  final String returnZone;
  const ReturnZoneChanged({@required this.returnZone});
}

class ReturnProvinceChanged extends UserdetailsEvent {
  final String returnProvince;
  const ReturnProvinceChanged({@required this.returnProvince});
}

class BuisnessDetailsSameAsWarehouseClicked extends UserdetailsEvent {
  final String buisnessAddress;
  final String buisnessZone;
  final String buisnessProvince;
  const BuisnessDetailsSameAsWarehouseClicked(
      {@required this.buisnessAddress,
      @required this.buisnessZone,
      @required this.buisnessProvince});
}

class ReturnDetailsSameAsWarehouseClicked extends UserdetailsEvent {
  final String returnAddress;
  final String returnZone;
  final String returnProvince;
  const ReturnDetailsSameAsWarehouseClicked(
      {@required this.returnAddress,
      @required this.returnZone,
      @required this.returnProvince});
}

class LegalNameChanged extends UserdetailsEvent {
  final String legalName;
  const LegalNameChanged({@required this.legalName});
}

class PanNumberChanged extends UserdetailsEvent {
  final String panNumber;
  const PanNumberChanged({@required this.panNumber});
}

class BankAccountNameChanged extends UserdetailsEvent {
  final String bankAccountName;
  const BankAccountNameChanged({@required this.bankAccountName});
}

class BankAccountNumberChanged extends UserdetailsEvent {
  final String bankAcNumber;
  const BankAccountNumberChanged({@required this.bankAcNumber});
}

class BankChanged extends UserdetailsEvent {
  final String bankName;
  const BankChanged({@required this.bankName});
}

class BankBranchChanged extends UserdetailsEvent {
  final String bankBranch;
  const BankBranchChanged({@required this.bankBranch});
}

class SubmitUserDetails extends UserdetailsEvent {
  final Address address;
  final Tax tax;
  final Bank bank;
  const SubmitUserDetails(
      {@required this.address, @required this.tax, @required this.bank});
}
