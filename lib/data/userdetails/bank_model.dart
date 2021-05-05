import 'package:flutter/material.dart';

class Bank {
  final String accountName;
  final String acNumber;
  final String bankName;
  final String bankBranch;

  const Bank(
      {@required this.accountName,
      @required this.acNumber,
      @required this.bankName,
      @required this.bankBranch});
}
