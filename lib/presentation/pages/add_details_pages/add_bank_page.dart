import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xspark/data/userdetails/address_model.dart';
import 'package:xspark/data/userdetails/bank_model.dart';
import 'package:xspark/data/userdetails/bloc/userdetails_bloc.dart';
import 'package:xspark/data/userdetails/tax_model.dart';

class AddBankPage extends StatefulWidget {
  final bool buttonState;
  final Function submitButtonClicked;
  AddBankPage({@required this.submitButtonClicked, @required this.buttonState});
  @override
  _AddBankPageState createState() => _AddBankPageState();
}

class _AddBankPageState extends State<AddBankPage> {
  final double defaultPads = 20.0;
  final int animationTime = 500;
  final double defaultSmallPads = 16.0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(defaultPads, defaultPads, defaultPads, 0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            _accountNameInput(),
            _accountNumberInput(),
            _bankDropDown(),
            _bankBranchInput(),
            _displayMessage(message: "Cheque Copy"),
            _pictureContent(),
            _disclaimer(),
            _proceedButton(),
          ],
        ),
      ),
    );
  }

  Widget _accountNameInput() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, defaultSmallPads, 0, 0),
      child: TextFormField(
        maxLength: 16,
        decoration: InputDecoration(
            counterText: "",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            hintText: 'Account Name'),
        onChanged: (value) => {
          BlocProvider.of<UserdetailsBloc>(context)
              .add(BankAccountNameChanged(bankAccountName: value))
        },
      ),
    );
  }

  Widget _accountNumberInput() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, defaultSmallPads, 0, defaultSmallPads),
      child: TextFormField(
        maxLength: 16,
        decoration: InputDecoration(
            counterText: "",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            hintText: 'Account Number'),
        onChanged: (value) => {
          BlocProvider.of<UserdetailsBloc>(context)
              .add(BankAccountNumberChanged(bankAcNumber: value))
        },
      ),
    );
  }

  Widget _bankDropDown() {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 6, 12, 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          shape: BoxShape.rectangle,
          border: Border.all(width: 1.0, color: Colors.grey)),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.amber, width: 5, style: BorderStyle.solid)),
          enabledBorder: InputBorder.none,
        ),
        dropdownColor: Color.fromARGB(255, 244, 244, 244),
        hint: Text('Bank'),
        items: <String>['NICA', 'NABIL', 'Standard Charted', 'Sanima', 'Prime']
            .map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          BlocProvider.of<UserdetailsBloc>(context)
              .add(BankChanged(bankName: value));
        },
      ),
    );
  }

  Widget _bankBranchInput() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, defaultSmallPads, 0, 0),
      child: TextFormField(
        maxLength: 16,
        decoration: InputDecoration(
            counterText: "",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            hintText: 'Bank Branch'),
        onChanged: (value) => BlocProvider.of<UserdetailsBloc>(context)
            .add(BankBranchChanged(bankBranch: value)),
      ),
    );
  }

  Widget _displayMessage({String message}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        message,
        style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 14),
      ),
    );
  }

  Widget _pictureContent() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, defaultSmallPads, 0, defaultSmallPads),
      child: DottedBorder(
        color: Colors.black,
        borderType: BorderType.RRect,
        strokeWidth: 1,
        radius: Radius.circular(5),
        child: Container(
          height: MediaQuery.of(context).size.height / 5,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.cloud_upload,
                size: 42,
              ),
              Text(
                "Click here to upload",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _disclaimer() {
    return Container(
      decoration: BoxDecoration(color: Colors.grey),
      padding: EdgeInsets.fromLTRB(
          defaultPads, defaultSmallPads, defaultSmallPads, defaultPads),
      child: Row(
        children: [
          Icon(Icons.info),
          Expanded(
            child: Text(
              "CLorem ipsum dolor sit amet, consectetur adipiscing elit.",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }

  Widget _changeSubmitText(bool _isItPressed) {
    if (_isItPressed) {
      return CircularProgressIndicator(
        strokeWidth: 2,
        backgroundColor: Colors.white,
      );
    } else {
      return Text(
        "Submit",
        style:
            TextStyle(color: Colors.white, fontFamily: 'Poppins', fontSize: 14),
      );
    }
  }

  Widget _proceedButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: defaultPads),
        child: BlocBuilder<UserdetailsBloc, UserdetailsState>(
          builder: (context, state) {
            Address _address = Address(
                warehouseAddress: state.warehouseAddress,
                warehouseZone: state.warehouseZone,
                warehouseProvince: state.warehouseProvince,
                buisnessAddress: state.buisnessAddress,
                buisnessZone: state.buisnessZone,
                buisnessProvince: state.buisnessProvince,
                returnAddress: state.returnAddress,
                returnZone: state.returnZone,
                returnProvince: state.returnProvince);
            Tax _tax =
                Tax(legalName: state.legalName, panNumber: state.panNumber);
            Bank _bank = Bank(
                accountName: state.bankAccountName,
                acNumber: state.bankAcNumber,
                bankName: state.bankName,
                bankBranch: state.bankBranch);

            return TextButton(
                onPressed: () {
                  widget.submitButtonClicked();
                  BlocProvider.of<UserdetailsBloc>(context).add(
                      SubmitUserDetails(
                          address: _address, tax: _tax, bank: _bank));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 255, 146, 19)),
                    minimumSize: MaterialStateProperty.all(
                      Size(MediaQuery.of(context).size.width, 48),
                    )),
                child: _changeSubmitText(widget.buttonState));
          },
        ),
      ),
    );
  }
}
