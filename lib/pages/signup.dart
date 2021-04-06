import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unotest/pages/home.dart';
import 'package:unotest/pages/login.dart';
//import 'package:country_pickers/country_pickers.dart';
import 'package:http/http.dart' as http;

import 'homeScreen.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

var dio = Dio();

Future<Number> fetchNumber(String phoneNumber,String phoneNumberOTP) async {
  final response =
  await dio.post("http://doorbell-deliveries.in/OldData_10022021/doorbell_old/food_user/userValid.php",
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
      print("Already have an account");
    }else if(succ.success == 0){
      fetchNumberOTP(phoneNumber, phoneNumberOTP.toString());
    }
    return Number.fromJson(jsonDecode(response.data));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
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

Future<Number> fetchNumberOTP(String phoneNumber, String phoneNumberOTP) async {
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

bool signup = false;

Future<register> futureRegister(String name, String email, String add, String phoneNumber,String phoneNumberOTP) async {
  final response =
  await dio.post("http://doorbell-deliveries.in/OldData_10022021/doorbell_old/food_user/addUserRegistration.php",
    data: {'user_na': name,'password': phoneNumberOTP,'mobile_no': phoneNumber,'email': email,'address': add},
    options: Options(contentType: Headers.formUrlEncodedContentType),);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var datax = jsonDecode(response.data);
    print(datax.toString());
    print("bhai bhi");
    signup = true;
    var succ = register.fromJson(jsonDecode(response.data));
    print(succ.success);
    if(succ.success == 1){
      print("register successfully");
    }else if(succ.success == 0){
      print("register not successfully");
      print(succ.success);
      print(succ.uid);
    }
    return register.fromJson(jsonDecode(response.data));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}


class register {
  final String success;
  final String uid;

  register({@required this.success,@required this.uid});

  factory register.fromJson(Map<String, dynamic> json) {
    return register(
      success: json['success'],
      uid: json['userid'],
    );
  }
}

class _SignUpState extends State<SignUp> {
  String dropdownValue = 'Nagpur';

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  TextEditingController phoneNumberInputController;
  TextEditingController nameInputController;
  TextEditingController emailInputController;
  TextEditingController addressInputController;
  TextEditingController OTPController;


  @override
  void initState() {
    phoneNumberInputController = new TextEditingController();
    nameInputController = new TextEditingController();
    emailInputController = new TextEditingController();
    addressInputController = new TextEditingController();
    OTPController = new TextEditingController();
    super.initState();
  }

  var rNum;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var now = DateTime.now();
    var today= new DateTime(now.year, now.month, now.day);
    return CupertinoPageScaffold(
        child: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              // Image(
              //   image: AssetImage('resources/doorbell_pic.jpg'),
              // ),
              Stack(
                children: [
                  Image(
                    image: AssetImage('assets/img/aa.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 300, 0, 0),
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
                              "REGISTER",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ), //Register Card
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: TextFormField(
                              controller: nameInputController,
                              decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.accessibility_new_rounded),
                                  border: InputBorder.none,
                                  hintText: 'Name'),
                            ), //Fetching Name
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: TextFormField(
                              controller: emailInputController,
                              decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.mail_outline_rounded),
                                  border: InputBorder.none,
                                  hintText: 'Email'),
                            ), //Fetching email
                          ),

                          // CupertinoDatePicker(
                          //   minimumDate: today,
                          //   minuteInterval: 1,
                          //   mode: CupertinoDatePickerMode.dateAndTime,
                          //   onDateTimeChanged: (DateTime dateTime) {
                          //     print("dateTime: ${dateTime}");
                          //   },
                          // ),
                          Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  DropdownButton<String>(
                                    value: dropdownValue,
                                    icon: Icon(Icons.arrow_drop_down),
                                    iconSize: 24,
                                    elevation: 16,
                                    style: TextStyle(color: Colors.white),
                                    underline: Container(
                                      height: 1,
                                      color: Colors.grey,
                                    ),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        dropdownValue = newValue;
                                      });
                                    },
                                    items: <String>[
                                      'Nagpur',
                                      'Mumbai',
                                      'Delhi',
                                      'Pune'
                                    ].map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ), //City DropDown
                                ],
                              )),
                          Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: TextFormField(
                                controller: phoneNumberInputController,
                                decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.call),
                                    border: InputBorder.none,
                                    hintText: 'Mobile Number'),
                              ) //Fetching Mobile Number
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
                                  fetchNumber(phoneNumberInputController.text,rNum.toString());
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
                          SizedBox(
                            height: 20,
                          ),

                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Text("Referral Code?"),
                          //     SizedBox(width: 5),
                          //     InkWell(
                          //         onTap: () {},
                          //         child: Text(
                          //           'Apply',
                          //           style: TextStyle(
                          //               color: Colors.deepOrange,
                          //               fontWeight: FontWeight.bold,
                          //               decoration: TextDecoration.underline),
                          //         )),
                          //   ],
                          // ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already a User?"),
                              SizedBox(width: 5),
                              InkWell(
                                  onTap: () {
                                    print("login successfull");
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginWidget()));
                                  },
                                  child: Text(
                                    'Log In',
                                    style: TextStyle(
                                        color: Colors.deepOrange,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height*0.79,
                        ),
                        Container(
                          //padding: EdgeInsets.fromLTRB(162, 635, 100, 100),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.deepOrange)),
                            color: Colors.deepOrange,
                            textColor: Colors.white,
                            padding: EdgeInsets.all(8.0),
                            onPressed: () {
                              if(OTPController.text == rNum.toString()){
                                print("success full register");
                                futureRegister(nameInputController.text, emailInputController.text, dropdownValue, phoneNumberInputController.text, OTPController.text);
                              }else{
                                print("wrong otp");
                              }

                              if(signup == true){
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => homeScreen()),
                                      (Route<dynamic> route) => false,
                                );
                              }else{
                                print("error");
                              }
                            },
                            child: Text(
                              "Register".toUpperCase(),
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //go buttn
                ],
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed('/Pages', arguments: 2);
                },
                shape: StadiumBorder(),
                textColor: Theme.of(context).hintColor,
                child: Text('skip'),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
              ),
            ]),
          ),
        ));
  }
}
