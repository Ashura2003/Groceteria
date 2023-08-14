import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_auth/email_auth.dart';

//o
class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _emailcontroller = new TextEditingController();
  final TextEditingController _OTPcontroller1 = new TextEditingController();
  final TextEditingController _OTPcontroller2 = new TextEditingController();
  final TextEditingController _OTPcontroller3 = new TextEditingController();
  final TextEditingController _OTPcontroller4 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("OTP Confirmation"),
        ),
        body: Center(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Text(
          //   "Please Enter Email",
          //   style: TextStyle(
          //     fontSize: 20,
          //     fontWeight: FontWeight.bold,
          //
          //   ),
          // ),
          // Form(child:  TextFormField(
          //   controller: _emailcontroller,
          //   decoration: InputDecoration(
          //       filled: true,
          //       fillColor: Colors.amberAccent.withOpacity(0.2),
          //       icon: const Icon(Icons.mail),
          //
          //       label: Text("Email"),
          //   ),
          // ),

          Text(
            "Please Enter OTP",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  height: 70,
                  width: 70,
                  child: TextFormField(
                    controller: _OTPcontroller1,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: Theme.of(context).textTheme.headline5,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  )),
              SizedBox(
                  height: 70,
                  width: 70,
                  child: TextFormField(
                    controller: _OTPcontroller2,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: Theme.of(context).textTheme.headline5,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  )),
              SizedBox(
                  height: 70,
                  width: 70,
                  child: TextFormField(
                    controller: _OTPcontroller3,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: Theme.of(context).textTheme.headline5,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  )),
              SizedBox(
                  height: 70,
                  width: 70,
                  child: TextFormField(
                    controller: _OTPcontroller4,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: Theme.of(context).textTheme.headline5,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  )),
              SizedBox(
                  height: 70,
                  width: 70,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: Theme.of(context).textTheme.headline5,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    if (_OTPcontroller1 == "" ||
                        _OTPcontroller2 == "" ||
                        _OTPcontroller3 == "" ||
                        _OTPcontroller4 == "") {
                      print("Please enter OTP");
                    }
                  },
                  child: Text("Verify"))
            ],
          )
        ])));
  }
}
