import 'dart:async';

import 'package:chime_example/Network/ApiStateListener.dart';
import 'package:chime_example/Network/RestDatasource.dart';
import 'package:chime_example/Pojo/MeetingData.dart';
import 'package:chime_example/Ui/JoinMeetingScreen.dart';
import 'package:chime_example/Ui/MeetingScreen.dart';
import 'package:chime_example/Utils/HexColor.dart';
import 'package:chime_example/Utils/RouteTransition/ScaleRoute.dart';
import 'package:chime_example/Utils/Utils.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

class _CreateMeetingScreenState extends State<CreatMeetingScreen> implements ApiStateListener {
  RestDataSource api;

  TextEditingController meetingNameController = TextEditingController();
  TextEditingController attendeController = TextEditingController();

  String phoneNo = "1";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white60,
      body: SafeArea(
        child: new WillPopScope(
            onWillPop: () async => false,
            child: Material(
                type: MaterialType.transparency,
                child: KeyboardAvoider(
                    child: GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: ListView(children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.topCenter,
                                  margin: EdgeInsets.only(top: 80.0),
                                  child: Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    direction: Axis.vertical,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 100.0,
                                        height: 100.0,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 20.0),
                                        child: Text(
                                          "Create Meeting in Chime",
                                          style: TextStyle(
                                            color: HexColor("77b2fe"),
                                            fontFamily: "PoppinsBold",
                                            fontSize: 28.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(top: 50),
                                  child: Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 46,
                                          decoration: new BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                new BorderRadius.circular(14.0),
                                          ),
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: CupertinoTextField(
                                                  keyboardType:
                                                      TextInputType.text,
                                                  controller:
                                                      meetingNameController,
                                                  cursorColor: Colors.grey,
                                                  placeholder:
                                                      "Enter Your Meeting Name.",
                                                  placeholderStyle: TextStyle(
                                                      color: Colors.black12,
                                                      fontSize: 16,
                                                      fontFamily:
                                                          'PoppinsMedium'),
                                                  maxLength: 10,
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                  ),
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 16,
                                                      fontFamily:
                                                          'PoppinsMedium'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 50),
                                        child: Wrap(
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12, right: 12),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 46,
                                                decoration: new BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          14.0),
                                                ),
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: CupertinoTextField(
                                                        keyboardType:
                                                            TextInputType.text,
                                                        controller:
                                                            attendeController,
                                                        cursorColor:
                                                            Colors.grey,
                                                        placeholder:
                                                            "Enter Your Name.",
                                                        placeholderStyle: TextStyle(
                                                            color:
                                                                Colors.black12,
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'PoppinsMedium'),
                                                        maxLength: 10,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'PoppinsMedium'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  RichText(
                                                    softWrap: true,
                                                    text: TextSpan(
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text:
                                                              'Clicking to creating a video meeting\n',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 13.5,
                                                              fontFamily:
                                                                  'PoppinsSemiBold'),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                //login button
                                Container(
                                  height: 42.0,
                                  margin: EdgeInsets.only(
                                      top: 60, left: 12, right: 12),
                                  width: MediaQuery.of(context).size.width,
                                  child: ButtonTheme(
                                    minWidth: MediaQuery.of(context).size.width,
                                    child: RaisedButton(
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(14.0),
                                          side: BorderSide(
                                              color: HexColor("#77b2fe"))),
                                      onPressed: () {
                                        if (!isLoading) {
                                          LoginResetButtonPressed();
                                        }
                                      },
                                      elevation: 2,
                                      color: HexColor("#77b2fe"),
                                      textColor: Colors.white,
                                      child: isLoading
                                          ? CircularProgressIndicator(
                                              backgroundColor: Colors.white10,
                                            )
                                          : Text("Create Meeting",
                                              style: Utils.textStyleButton()),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(20),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                        color: Colors.blue,
                                        padding: EdgeInsets.all(5),
                                        child: RichText(
                                          softWrap: true,
                                          text: TextSpan(
                                            style: TextStyle(
                                                color: Colors.white),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text:
                                                  'Join Meeting',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontFamily:
                                                      'PoppinsSemiBold'),
                                                  recognizer:
                                                  TapGestureRecognizer()
                                                    ..onTap = () {
                                                      Navigator.push(
                                                          context,
                                                          ScaleRoute(
                                                              page: JoinMeetingScreen()));
                                                    }),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ]),
                        ))))),
      ),
    );
  }

  void LoginResetButtonPressed() {
    if (meetingNameController.text.isEmpty) {
      Utils.showToast("Please enter your Meeting Name");
    } else if (attendeController.text.isEmpty) {
      Utils.showToast("Please enter your name");

      setState(() {
        phoneNo = "";
      });
    } else {
      CreatMeeting();
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    api = new RestDataSource(this);
  }

  @override
  void onError(data) {
    setState(() {
      isLoading = false;
    });

    if (data != null) {
      Utils.showToast(
          data.toString().substring(10, data.toString().length - 1));
    }
  }

  @override
  void onNoNetWork(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Future<void> onSuccess(data) async {
    setState(() {
      isLoading = false;
    });

    if (data is MeetingData) {
      if (data != null) {
        setState(() {
          meetingNameController.text = "";
          attendeController.text = "";
        });

        Navigator.push(
            context,
            ScaleRoute(
                page: MeetingScreen(data)));
      } else {
          Utils.showToast("Something went wrong!");
      }
    }
  }

  void CreatMeeting() {
    setState(() {
      isLoading = true;
    });

    api.createMeeting(
        this.meetingNameController.text, this.attendeController.text);
  }
}

class CreatMeetingScreen extends StatefulWidget {
  @override
  _CreateMeetingScreenState createState() => _CreateMeetingScreenState();
}
