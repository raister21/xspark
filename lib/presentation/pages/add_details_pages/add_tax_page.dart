import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xspark/data/userdetails/bloc/userdetails_bloc.dart';

class AddTaxPage extends StatefulWidget {
  final Function movePageForward;
  AddTaxPage({@required this.movePageForward});
  @override
  _AddTaxPageState createState() => _AddTaxPageState();
}

class _AddTaxPageState extends State<AddTaxPage> {
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
            _legalNameInput(),
            _panInput(),
            _displayMessage(message: "Business Document"),
            _pictureContent(),
            _disclaimer(),
            _proceedButton()
          ],
        ),
      ),
    );
  }

  Widget _legalNameInput() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, defaultSmallPads, 0, 0),
      child: BlocBuilder<UserdetailsBloc, UserdetailsState>(
        builder: (context, state) {
          return TextFormField(
            maxLength: 16,
            decoration: InputDecoration(
                counterText: "",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                hintText: 'Legal Name / Business Owner Name'),
            onChanged: (value) => {
              BlocProvider.of<UserdetailsBloc>(context)
                  .add(LegalNameChanged(legalName: value))
            },
          );
        },
      ),
    );
  }

  Widget _panInput() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, defaultSmallPads, 0, defaultSmallPads),
      child: BlocBuilder<UserdetailsBloc, UserdetailsState>(
        builder: (context, state) {
          return TextFormField(
            maxLength: 16,
            decoration: InputDecoration(
                counterText: "",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                hintText: 'PAN / VAT Registration Number'),
            onChanged: (value) => {
              BlocProvider.of<UserdetailsBloc>(context)
                  .add(PanNumberChanged(panNumber: value))
            },
          );
        },
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

  Widget _proceedButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: defaultPads),
        child: TextButton(
            onPressed: () {
              widget.movePageForward();
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 255, 146, 19)),
                minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 48),
                )),
            child: Text(
              "Next",
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Poppins', fontSize: 14),
            )),
      ),
    );
  }
}
