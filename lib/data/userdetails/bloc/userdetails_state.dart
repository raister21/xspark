part of 'userdetails_bloc.dart';

class UserdetailsState extends Equatable {
  final String warehouseAddress;
  final String warehouseZone;
  final String warehouseProvince;
  final String buisnessAddress;
  final String buisnessZone;
  final String buisnessProvince;
  final String returnAddress;
  final String returnZone;
  final String returnProvince;
  final String legalName;
  final String panNumber;
  final String bankAccountName;
  final String bankAcNumber;
  final String bankName;
  final String bankBranch;

  const UserdetailsState(
      {this.warehouseAddress,
      this.warehouseZone,
      this.warehouseProvince,
      this.buisnessAddress,
      this.buisnessZone,
      this.buisnessProvince,
      this.returnAddress,
      this.returnZone,
      this.returnProvince,
      this.legalName,
      this.panNumber,
      this.bankAccountName,
      this.bankAcNumber,
      this.bankName,
      this.bankBranch});

  UserdetailsState copyWith(
      {String warehouseAddress,
      String warehouseZone,
      String warehouseProvince,
      String buisnessAddress,
      String buisnessZone,
      String buisnessProvince,
      String returnAddress,
      String returnZone,
      String returnProvince,
      String legalName,
      String panNumber,
      String bankAccountName,
      String bankAcNumber,
      String bankName,
      String bankBranch}) {
    return UserdetailsState(
        warehouseAddress: warehouseAddress ?? this.warehouseAddress,
        warehouseZone: warehouseZone ?? this.warehouseZone,
        warehouseProvince: warehouseProvince ?? this.warehouseProvince,
        buisnessAddress: buisnessAddress ?? this.buisnessAddress,
        buisnessZone: buisnessZone ?? this.buisnessZone,
        buisnessProvince: buisnessProvince ?? this.buisnessProvince,
        returnAddress: returnAddress ?? this.returnAddress,
        returnZone: returnZone ?? this.returnZone,
        returnProvince: returnProvince ?? this.returnProvince,
        legalName: legalName ?? this.legalName,
        panNumber: panNumber ?? this.panNumber,
        bankAccountName: bankAccountName ?? this.bankAccountName,
        bankAcNumber: bankAcNumber ?? this.bankAcNumber,
        bankName: bankName ?? this.bankName,
        bankBranch: bankBranch ?? this.bankBranch);
  }

  @override
  List<Object> get props => [
        warehouseAddress,
        warehouseZone,
        warehouseProvince,
        buisnessAddress,
        buisnessZone,
        buisnessProvince,
        returnAddress,
        returnZone,
        returnProvince,
        legalName,
        panNumber,
        bankAccountName,
        bankAcNumber,
        bankName,
        bankBranch
      ];
}

class UserdetailsInitial extends UserdetailsState {}

class UserdetailsSubmitting extends UserdetailsState {}

class UserdetailsSuccessfulSubmission extends UserdetailsState {}

class UserdetailsFailedSubmission extends UserdetailsState {}
