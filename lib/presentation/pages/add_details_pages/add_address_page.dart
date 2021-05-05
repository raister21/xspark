import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xspark/data/userdetails/address_model.dart';
import 'package:xspark/data/userdetails/bloc/userdetails_bloc.dart';

class AddAddressPage extends StatefulWidget {
  final Function movePageForward;
  AddAddressPage({@required this.movePageForward});
  @override
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  // Initializing variables
  final double defaultPads = 20.0;
  final int animationTime = 500;
  final double defaultSmallPads = 16.0;
  bool _isBuissnessAddressSame = false;
  bool _isReturnAddressSame = false;
  int _buisnessGroup = -1;
  int _returnGroup = -1;

  @override
  void initState() {
    super.initState();
  }

  void _buisnessSetAsSame(int value) {
    setState(() {
      _isBuissnessAddressSame = !_isBuissnessAddressSame;
      _buisnessGroup = value;
    });
  }

  void _returnSetAsSame(int value) {
    setState(() {
      _isReturnAddressSame = !_isReturnAddressSame;
      _returnGroup = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(defaultPads, defaultPads, defaultPads, 0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            _displayMessage(message: "Warehouse address"),
            _addressInput(),
            _zoneInput(),
            _provinceInput(),
            _displayMessage(message: "Buisness Address"),
            _buisnessSameAsWareHouseRadioButton(),
            _buissnessAddressBlock(),
            _displayMessage(message: "Return Address"),
            _returnSameAsWareHouseRadioButton(),
            _returnAddressBlock(),
            _proceedButton()
          ],
        ),
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

  Widget _addressInput() {
    return BlocBuilder<UserdetailsBloc, UserdetailsState>(
      builder: (context, state) {
        return Container(
          padding:
              EdgeInsets.fromLTRB(0, defaultSmallPads, 0, defaultSmallPads),
          child: TextFormField(
            maxLength: 16,
            decoration: InputDecoration(
                counterText: "",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                hintText: 'Address'),
            onChanged: (value) => {
              BlocProvider.of<UserdetailsBloc>(context)
                  .add(WarehouseAddressChanged(warehouseAddress: value))
            },
          ),
        );
      },
    );
  }

  Widget _zoneInput() {
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
        hint: Text('Zone'),
        items: <String>[
          'Mechi',
          'Koshi',
          'Sagarmatha',
          'Janakpur',
          'Bagmati',
          'Narayani',
          'Gandaki',
          'Lumbini',
          'Dhawalagiri',
          'Rapti',
          'Karnali',
          'Bheri',
          'Seti',
          'Mahakali'
        ].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          BlocProvider.of<UserdetailsBloc>(context)
              .add(WarehouseZoneChanged(warehouseZone: value));
        },
      ),
    );
  }

  Widget _provinceInput() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, defaultSmallPads, 0, defaultSmallPads),
      child: TextFormField(
        maxLength: 16,
        decoration: InputDecoration(
            counterText: "",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            hintText: 'Province'),
        onChanged: (value) => {
          BlocProvider.of<UserdetailsBloc>(context)
              .add(WarehouseProvinceChanged(warehouseProvince: value))
        },
      ),
    );
  }

  Widget _buisnessAddressInput() {
    return BlocBuilder<UserdetailsBloc, UserdetailsState>(
      builder: (context, state) {
        return Container(
          padding:
              EdgeInsets.fromLTRB(0, defaultSmallPads, 0, defaultSmallPads),
          child: TextFormField(
            maxLength: 16,
            decoration: InputDecoration(
                counterText: "",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                hintText: 'Address'),
            onChanged: (value) => {
              BlocProvider.of<UserdetailsBloc>(context)
                  .add(BuisnessAddressChanged(buisnessAddress: value))
            },
          ),
        );
      },
    );
  }

  Widget _buisnessZoneInput() {
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
        hint: Text('Zone'),
        items: <String>[
          'Mechi',
          'Koshi',
          'Sagarmatha',
          'Janakpur',
          'Bagmati',
          'Narayani',
          'Gandaki',
          'Lumbini',
          'Dhawalagiri',
          'Rapti',
          'Karnali',
          'Bheri',
          'Seti',
          'Mahakali'
        ].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          BlocProvider.of<UserdetailsBloc>(context)
              .add(BuisnessZoneChanged(buisnessZone: value));
        },
      ),
    );
  }

  Widget _buisnessProvinceInput() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, defaultSmallPads, 0, defaultSmallPads),
      child: TextFormField(
        maxLength: 16,
        decoration: InputDecoration(
            counterText: "",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            hintText: 'Province'),
        onChanged: (value) => {
          BlocProvider.of<UserdetailsBloc>(context)
              .add(BuisnessProvinceChanged(buisnessProvince: value))
        },
      ),
    );
  }

  Widget _returnAddressInput() {
    return BlocBuilder<UserdetailsBloc, UserdetailsState>(
      builder: (context, state) {
        return Container(
          padding:
              EdgeInsets.fromLTRB(0, defaultSmallPads, 0, defaultSmallPads),
          child: TextFormField(
            maxLength: 16,
            decoration: InputDecoration(
                counterText: "",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                hintText: 'Address'),
            onChanged: (value) => {
              BlocProvider.of<UserdetailsBloc>(context)
                  .add(ReturnAddressChanged(returnAddress: value))
            },
          ),
        );
      },
    );
  }

  Widget _returnZoneInput() {
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
        hint: Text('Zone'),
        items: <String>[
          'Mechi',
          'Koshi',
          'Sagarmatha',
          'Janakpur',
          'Bagmati',
          'Narayani',
          'Gandaki',
          'Lumbini',
          'Dhawalagiri',
          'Rapti',
          'Karnali',
          'Bheri',
          'Seti',
          'Mahakali'
        ].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          BlocProvider.of<UserdetailsBloc>(context)
              .add(ReturnZoneChanged(returnZone: value));
        },
      ),
    );
  }

  Widget _returnProvinceInput() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, defaultSmallPads, 0, defaultSmallPads),
      child: TextFormField(
        maxLength: 16,
        decoration: InputDecoration(
            counterText: "",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            hintText: 'Province'),
        onChanged: (value) => {
          BlocProvider.of<UserdetailsBloc>(context)
              .add(ReturnProvinceChanged(returnProvince: value))
        },
      ),
    );
  }

  Widget _buisnessSameAsWareHouseRadioButton() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, defaultSmallPads, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BlocBuilder<UserdetailsBloc, UserdetailsState>(
            builder: (context, state) {
              return Container(
                height: 20,
                width: 20,
                padding: EdgeInsets.only(left: 8),
                child: Radio(
                    toggleable: true,
                    value: 1,
                    groupValue: _buisnessGroup,
                    onChanged: (changed) => {
                          _buisnessSetAsSame(changed),
                          BlocProvider.of<UserdetailsBloc>(context).add(
                              BuisnessDetailsSameAsWarehouseClicked(
                                  buisnessAddress: state.warehouseAddress,
                                  buisnessZone: state.warehouseZone,
                                  buisnessProvince: state.warehouseProvince))
                        }),
              );
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultSmallPads),
            child: Text(
              "Same as Warehouse Address",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _returnSameAsWareHouseRadioButton() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, defaultSmallPads, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BlocBuilder<UserdetailsBloc, UserdetailsState>(
            builder: (context, state) {
              return Container(
                height: 20,
                width: 20,
                padding: EdgeInsets.only(left: 8),
                child: Radio(
                    toggleable: true,
                    value: 1,
                    groupValue: _returnGroup,
                    onChanged: (changed) => {
                          _returnSetAsSame(changed),
                          BlocProvider.of<UserdetailsBloc>(context).add(
                              ReturnDetailsSameAsWarehouseClicked(
                                  returnAddress: state.warehouseAddress,
                                  returnZone: state.warehouseZone,
                                  returnProvince: state.warehouseProvince))
                        }),
              );
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultSmallPads),
            child: Text(
              "Same as Warehouse Address",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buissnessAddressBlock() {
    return _isBuissnessAddressSame
        ? Padding(padding: EdgeInsets.fromLTRB(0, defaultSmallPads, 0, 0))
        : Column(
            children: [
              _buisnessAddressInput(),
              _buisnessZoneInput(),
              _buisnessProvinceInput(),
            ],
          );
  }

  Widget _returnAddressBlock() {
    return _isReturnAddressSame
        ? Padding(padding: EdgeInsets.fromLTRB(0, defaultSmallPads, 0, 0))
        : Column(
            children: [
              _returnAddressInput(),
              _returnZoneInput(),
              _returnProvinceInput(),
            ],
          );
  }

  Widget _proceedButton() {
    return Padding(
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
        ),
      ),
    );
  }
}
