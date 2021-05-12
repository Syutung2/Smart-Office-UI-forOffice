import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mpp/xiangqing.dart';

import 'tools/global_tools.dart';

void main() {
  runApp(MyApp());
  if (defaultTargetPlatform == TargetPlatform.android) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        cardColor: Colors.white,
        fontFamily: "opposans",
        buttonColor: Colors.blue,
        primaryColorLight: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          backgroundColor: Colors.black,
          fontFamily: "opposans",
          primaryColorDark: Colors.white,
          buttonColor: Colors.blue,
          cardColor: Colors.grey[500]),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Teacher {
  final String name;
  final String zuowei;
  final bool isInOffice;
  final String starttime;

  final String endTime;
  final String state;
  Teacher(this.name, this.zuowei, this.isInOffice, this.starttime, this.endTime,
      this.state);
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool isLogin = false;
  String username, password;

  var building = "教一";
  var home = "203";
  var school = "A校区";
  List<Teacher> textTeacher = [
    new Teacher("曹操", "A座位", false, "9:00", "17:00", "外出中"),
    new Teacher("赵云", "B座位", true, "9:00", "17:00", "办公中"),
    new Teacher("张飞", "C座位", false, "9:00", "17:00", "外出中"),
    new Teacher("刘备", "D座位", false, "9:00", "17:00", "外出中"),
    new Teacher("关羽", "E座位", true, "9:00", "17:00", "办公中"),
    new Teacher("孙权", "F座位", true, "9:00", "17:00", "办公中"),
  ];
  @override
  void initState() {
    super.initState();
    // 强制横屏
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  void login(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          var editingController2;
          var editingController;
          return Stack(
            children: [
              Container(
                height: 30.0,
                width: double.infinity,
                color: Colors.black54,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Tools.getTanChuangColor(context),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    )),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: TextField(
                            controller: editingController,
                            maxLength: 15,
                            maxLines: 1,
                            autocorrect: true,
                            obscureText: false,
                            textAlign: TextAlign.center, //对齐方式
                            style:
                                TextStyle(fontSize: 26.0, color: Colors.green),
                            onChanged: (text) {
                              username = text;
                            },
                            onSubmitted: (text) {
                              username = text;
                            },
                            decoration: InputDecoration(
                                filled: true,
                                prefixIcon: Icon(Icons.person),
                                suffixText: "用户名"),
                          ),
                          width: 200,
                          margin: EdgeInsets.fromLTRB(0, 5, 10, 0),
                          alignment: Alignment.centerLeft,
                          decoration: new BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)))),
                      Container(
                          child: TextField(
                            controller: editingController2,
                            maxLength: 18,
                            maxLines: 1,
                            autocorrect: true,
                            obscureText: true,
                            textAlign: TextAlign.center, //对齐方式
                            style:
                                TextStyle(fontSize: 26.0, color: Colors.green),
                            onChanged: (text) {
                              password = text;
                            },
                            onSubmitted: (text) {
                              password = text;
                            },
                            decoration: InputDecoration(
                                filled: true,
                                prefixIcon: Icon(Icons.https),
                                suffixText: "密码"),
                          ),
                          width: 200,
                          margin: EdgeInsets.fromLTRB(0, 5, 10, 0),
                          alignment: Alignment.centerLeft,
                          decoration: new BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)))),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: FlatButton(
                          child: Text(
                            "取   消",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25),
                          ),
                          onPressed: () {
                            Navigator.pop(context, '取消');
                          },
                          onLongPress: () {},
                          onHighlightChanged: (value) {},
                        ),
                        width: 120,
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                      ),
                      Container(
                        child: FlatButton(
                          child: Text(
                            "确   定",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25),
                          ),
                          onPressed: () {
                            setState(() {
                              isLogin = true;
                            });
                          },
                          onLongPress: () {},
                          onHighlightChanged: (value) {},
                        ),
                        width: 120,
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                      ),
                    ],
                  )
                ],
              )
            ],
          );
        });
  }

  Widget isnotLogin() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("当前办公室：未登录"),
              Container(
                child: FlatButton(
                    onPressed: () {
                      login(context);
                    },
                    child: Text("登录")),
                decoration: BoxDecoration(color: Colors.blueGrey),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget isyesLogin() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "当前办公人数：3人",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "当前办公室：${school}>${building}>${home}",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "有人",
                  style: TextStyle(color: Tools.getColor(true), fontSize: 15),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            alignment: Alignment.center,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                    child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => TeacherXQ(
                                  teacher: textTeacher[index],
                                )));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${textTeacher[index].name}老师",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "座位：${textTeacher[index].zuowei}",
                        style: TextStyle(fontSize: 15),
                      ),
                      Tools.getState(textTeacher[index].isInOffice)
                    ],
                  ),
                ));
              },
              itemCount: textTeacher.length,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return Scaffold(
          appBar:
              PreferredSize(child: AppBar(), preferredSize: Size.fromHeight(0)),
          body: isyesLogin());
    } else {
      return Scaffold(
          appBar:
              PreferredSize(child: AppBar(), preferredSize: Size.fromHeight(0)),
          body: isnotLogin());
    }
  }
}
