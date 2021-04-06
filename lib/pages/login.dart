import 'dart:convert';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:unotest/pages/home.dart';
import 'package:unotest/pages/signup.dart';

import 'homeScreen.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

var dio = Dio();

Future<Number> fetchNumber(String phoneNumber,int phoneNumberOTP) async {
  final response =
  await dio.post("https://doorbell-deliveries.in/OldData_10022021/doorbell_old/food_user/userValid.php",
    data: {'mobileno': phoneNumber,},
    options: Options(contentType: Headers.formUrlEncodedContentType),);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var datax = jsonDecode(response.data);
    print(datax.toString());
    print("bhai bhai");
    var succ = Number.fromJson(jsonDecode(response.data));
    print(succ.success);
    if(succ.success == 1){
      fetchNumberOTP(phoneNumber, phoneNumberOTP);
    }else if(succ.success == 0){
      alertfornewuser();
      print("please register");
    }
    return Number.fromJson(jsonDecode(response.data));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

alertfornewuser() {
  return CupertinoAlertDialog(
    title: Text('Error'),
    content: Text('Your phone number is not registered please register first'),
    actions: <Widget>[
    ],
  );
}



class Number {
  final int success;

  Number({@required this.success});

  factory Number.fromJson(Map<String, dynamic> json) {
    return Number(
      success: json['success'],
    );
  }
}

Future<Number> fetchNumberOTP(String phoneNumber, int phoneNumberOTP) async {
  final response =
  await dio.get("https://smsapi.24x7sms.com/api_2.0/SendSMS.aspx?APIKEY=tAY3oLGegiQ&MobileNo=$phoneNumber&SenderID=DRBELL&Message=Your Doorbell Deliveries verification OTP is $phoneNumberOTP &ServiceName=TEMPLATE_BASED",
    options: Options(contentType: Headers.formUrlEncodedContentType),);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // var datax = jsonDecode(response.data);
    // print(datax.toString());
    print(phoneNumber);
    print(phoneNumberOTP);
    print("bhai bhai");
    return Number.fromJson(jsonDecode(response.data));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class _LoginWidgetState extends StateMVC<LoginWidget> {

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  TextEditingController phoneNumberInputController;
  TextEditingController OTPController;

  @override
  void initState() {
    phoneNumberInputController = new TextEditingController();
    OTPController = new TextEditingController();
    super.initState();
  }
  var rNum;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      //onWillPop: Helper.of(context).onWillPop,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(children: [

              Stack(
                children: [
                  Image(
                    image: AssetImage('assets/img/aa.jpg'),
                  ),//Doorbell Image
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 350, 0, 0),
                    child: Card(
                      elevation: 5,
                      shape: Border(
                        bottom: BorderSide(color: Colors.deepOrange, width: 5),
                      ),
                      color: Colors.black,
                      margin: EdgeInsets.all(20.0),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              "LOGIN",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),//Login Card
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Form(
                            key: _loginFormKey,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: TextFormField(
                                    validator: (value) {
                                      if(value == null){
                                        return "enter the phone number";
                                      }else if(value.length <10){
                                        return "enter proper phone number";
                                      }else if(value.length >10){
                                        return "enter valid phone number";
                                      }
                                    },
                                    controller: phoneNumberInputController,
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.contacts_outlined),
                                        border: InputBorder.none,
                                        hintText: 'Mobile Number'),
                                  ),//Fetching Mobile Number
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    //padding: EdgeInsets.fromLTRB(162, 62, 100, 100),
                                    child: FlatButton(
                                      // shape: RoundedRectangleBorder(
                                      //     borderRadius: BorderRadius.circular(18.0),
                                      //     side: BorderSide(color: Colors.deepOrange)),
                                      //color: Colors.deepOrange,
                                      textColor: Colors.grey,
                                      padding: EdgeInsets.only(right: 20),
                                      onPressed: () {
                                        int min = 100000; //min and max values act as your 6 digit range
                                        int max = 999999;
                                        var randomizer = new Random();
                                        rNum = min + randomizer.nextInt(max - min);
                                        fetchNumber(phoneNumberInputController.text,rNum);
                                      },
                                      child: Text(
                                        "Get OTP",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: TextFormField(
                                    controller: OTPController,
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.phone_in_talk_outlined),
                                        border: InputBorder.none,
                                        hintText: 'Enter OTP'),
                                  ),//Fetching Mobile Number
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height*0.05,
                          )
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height*0.675,
                        ),
                        Container(

                          //padding: EdgeInsets.fromLTRB(162, 62, 100, 100),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.deepOrange)),
                            color: Colors.deepOrange,
                            textColor: Colors.white,
                            padding: EdgeInsets.all(8.0),
                            onPressed: () {
                              if(OTPController.text == rNum.toString()){
                                print("success full login");
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => homeScreen()),
                                      (Route<dynamic> route) => false,
                                );
                              }else if(OTPController.text != rNum.toString()){
                                print("wrong opt");
                                print(OTPController.text);
                                print(rNum);
                              }
                            },
                            child: Text(
                              "log in".toUpperCase(),
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //go button
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New User?"),
                  SizedBox(width: 5),
                  InkWell(
                      onTap: () {
                        print("login successfull");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUp()));
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      )),
                ],
              ),
              FlatButton(
                onPressed: () {
                  print("login successfull");
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => homeScreen()));
                },
                shape: StadiumBorder(),
                textColor: Theme.of(context).hintColor,
                child: Text('skip'),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
              ),
            ]),
          ),
        ),
      ),

    );
  }
}
