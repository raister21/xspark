import 'package:flutter/material.dart';

class Address {
  final String warehouseAddress;
  final String warehouseZone;
  final String warehouseProvince;
  final String buisnessAddress;
  final String buisnessZone;
  final String buisnessProvince;
  final String returnAddress;
  final String returnZone;
  final String returnProvince;

  const Address(
      {@required this.warehouseAddress,
      @required this.warehouseZone,
      @required this.warehouseProvince,
      @required this.buisnessAddress,
      @required this.buisnessZone,
      @required this.buisnessProvince,
      @required this.returnAddress,
      @required this.returnZone,
      @required this.returnProvince});

  void getAll() {
    print(warehouseAddress);
    print(warehouseZone);
    print(warehouseProvince);
    print(buisnessAddress);
    print(buisnessZone);
    print(buisnessProvince);
    print(returnAddress);
    print(returnZone);
    print(returnProvince);
  }
}
