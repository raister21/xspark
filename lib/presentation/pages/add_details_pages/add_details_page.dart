import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xspark/presentation/customWidgets/dottedCustomCliper.dart';
import 'package:xspark/data/userdetails/bloc/userdetails_bloc.dart';
import 'package:xspark/presentation/pages/add_details_pages/add_address_page.dart';
import 'package:xspark/presentation/pages/add_details_pages/add_bank_page.dart';
import 'package:xspark/presentation/pages/add_details_pages/add_tax_page.dart';
import 'package:xspark/presentation/pages/home_page.dart';

class AddDetailsPage extends StatefulWidget {
  static const String routeName = "/addDetails";
  @override
  _AddDetailsPageState createState() => _AddDetailsPageState();
}

class _AddDetailsPageState extends State<AddDetailsPage> {
  // Initializing variables
  final double defaultPads = 20.0;
  final int animationTime = 500;
  bool _isItPressed = false;
  double progressNow = 0;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  void _movePageForward() {
    if (progressNow < 1) {
      setState(() {
        progressNow += 0.5;
      });
    }
  }

  void _submitButtonPressed() {
    setState(() {
      _isItPressed = true;
    });
  }

  void _moveToTaxDetails() {
    _movePageForward();
    _scrollController.animateTo(MediaQuery.of(context).size.width,
        duration: Duration(milliseconds: animationTime),
        curve: Curves.fastOutSlowIn);
  }

  void _moveToBankDetails() {
    _movePageForward();
    _scrollController.animateTo(MediaQuery.of(context).size.width * 2,
        duration: Duration(milliseconds: animationTime),
        curve: Curves.fastOutSlowIn);
  }

  void _navigateProgress(int positionTo) {
    switch (positionTo) {
      case (1):
        while (progressNow > 0) {
          setState(() {
            progressNow -= 0.5;
          });
          _scrollController.animateTo(0,
              duration: Duration(milliseconds: animationTime),
              curve: Curves.fastOutSlowIn);
        }

        break;
      case (2):
        while (progressNow > 0.5) {
          setState(() {
            progressNow -= 0.5;
          });
          _scrollController.animateTo(MediaQuery.of(context).size.width,
              duration: Duration(milliseconds: animationTime),
              curve: Curves.fastOutSlowIn);
        }
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: _addDetailsView()));
  }

  Widget _addDetailsView() {
    return BlocListener<UserdetailsBloc, UserdetailsState>(
      listener: (context, state) {
        if (state is UserdetailsSuccessfulSubmission) {
          setState(() {
            _isItPressed = false;
          });
          Navigator.pushReplacementNamed(context, HomePage.routeName);
        }
      },
      child: Container(
        child: Column(
          children: [_contentHeader(), _contentBody()],
        ),
      ),
    );
  }

  Widget _contentHeader() {
    return Column(
      children: [
        _headerBar(),
        _progressBar(radius: 42, progressNow: progressNow)
      ],
    );
  }

  Widget _contentBody() {
    return Expanded(
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        children: [
          AddAddressPage(
            movePageForward: _moveToTaxDetails,
          ),
          AddTaxPage(
            movePageForward: _moveToBankDetails,
          ),
          AddBankPage(
              submitButtonClicked: _submitButtonPressed,
              buttonState: _isItPressed)
        ],
      ),
    );
  }

  Widget _headerBar() {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: EdgeInsets.fromLTRB(defaultPads, 18, defaultPads, 8),
        child: IconButton(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(0),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _progressBar({@required double radius, @required double progressNow}) {
    return Container(
      padding: EdgeInsets.fromLTRB(defaultPads, 0, defaultPads, defaultPads),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            top: radius / 2,
            child: _dottedLineProgressBar(
                individualWidth: 5, lineHeight: 2, progress: progressNow),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _progressPoint(radius: radius, point: 1, name: 'Address'),
              _progressPoint(radius: radius, point: 2, name: 'Tax Details'),
              _progressPoint(radius: radius, point: 3, name: 'Bank Detail'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _progressPoint(
      {@required double radius, @required int point, @required String name}) {
    return Column(
      children: [
        Container(
          height: radius,
          width: radius,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 146, 19),
              shape: BoxShape.circle,
              borderRadius: null),
          child: Center(
            child: TextButton(
              onPressed: () {
                _navigateProgress(point);
              },
              child: Text(
                point.toString(),
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
          ),
        ),
        Text(
          name,
          style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 10),
        ),
      ],
    );
  }

  Widget _dottedLineProgressBar(
      {@required double individualWidth,
      @required double lineHeight,
      @required double progress}) {
    if (progress < 0) {
      progress = 0;
    } else if (progress > 1) {
      progress = 1;
    }
    assert(progress <= 1.0 && progress >= 0.0);
    double maxWidth = MediaQuery.of(context).size.width - defaultPads * 2;
    int quantityOfDots = maxWidth.round() ~/ individualWidth;
    return ClipPath(
      clipper: DottedCustomClipper(
          maxWidth: maxWidth,
          quantityOfDots: quantityOfDots,
          individualWidth: individualWidth,
          lineHeight: lineHeight),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: lineHeight.toDouble(),
            width: maxWidth,
            decoration: BoxDecoration(color: Colors.grey),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: animationTime),
            curve: Curves.fastOutSlowIn,
            height: lineHeight.toDouble(),
            width: maxWidth * progress,
            decoration: BoxDecoration(color: Color.fromARGB(255, 255, 146, 19)),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
