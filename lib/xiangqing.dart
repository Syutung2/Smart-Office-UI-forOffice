import 'package:flutter/material.dart';
import 'package:mpp/main.dart';

class TeacherXQ extends StatelessWidget {
  Teacher teacher;
  TeacherXQ({Key key, @required this.teacher}) : super(key: key);
  Widget getState(bool isout) {
    if (isout) {
      return Text(
        "外出中...",
        style: TextStyle(color: Colors.red, fontSize: 30),
      );
    } else {
      return Text(
        "办公中...",
        style: TextStyle(color: Colors.green, fontSize: 30),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            PreferredSize(child: AppBar(), preferredSize: Size.fromHeight(0)),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 250,
                child: Center(
                  child: Text(
                    "这里是老师留得的言,这里是老师留得的言,这里是老师留得的言,这里是老师留得的言,这里是老师留得的言,这里是老师留得的言,这里是老师留得的言,这里是老师留得的言,",
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "教师名字:${teacher.name}",
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    "教师座位:${teacher.zuowei}",
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    "办公时间:${teacher.starttime}至${teacher.endTime}",
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    "教师状态:${teacher.state}",
                    style: TextStyle(fontSize: 30),
                  ),
                  getState(teacher.isInOffice),
                  FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("返回"))
                ],
              )
            ],
          ),
        ));
  }
}
