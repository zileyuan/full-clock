import 'dart:async';
import 'package:flutter/material.dart';
import 'package:full_clock/utils/screen_util.dart';
import 'package:full_clock/routes/app_router.dart';
import 'package:full_clock/blocs/home_bloc.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with ScreenUtil {
  DateTime _dataTime = DateTime.now();

  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), _update);
  }

  void _update(Timer timer) {
    _dataTime = DateTime.now();
    setState(() {

    });
  }

  String _weekDisplay(no) {
    String title = '';
    switch (no) {
      case 1: { title = '星期一'; }
      break;
      case 2: { title = '星期二'; }
      break;
      case 3: { title = '星期三'; }
      break;
      case 4: { title = '星期四'; }
      break;
      case 5: { title = '星期五'; }
      break;
      case 6: { title = '星期六'; }
      break;
      case 7: { title = '星期日'; }
      break;
      default: { title = '未知哦'; }
      break;
    }
    return title;
  }

  @override
  Widget build(BuildContext context) {
    Color fontColor = Provider.of<HomeBloc>(context).homeModel.fontColor;
    initScreenUtil(context, width: 750, height: 1344);
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(0),
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                height: setHeight(180),
                alignment: Alignment.center,
                child: Text(
                  '${_dataTime.year.toString()}-${_dataTime.month.toString().padLeft(2, '0')}-${_dataTime.day.toString().padLeft(2, '0')}  ${_weekDisplay(_dataTime.weekday)}',
                  style: TextStyle(
                    color: fontColor,
                    fontSize: setSp(30),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(0),
                  constraints: BoxConstraints(
                      minWidth: double.infinity, //宽度尽可能大
                      minHeight: double.infinity //最小高度为50像素
                  ),
                  alignment: Alignment.center,
                  child: Text.rich(TextSpan(
                    children: [
                      TextSpan(
                        text: '${_dataTime.hour.toString().padLeft(2, '0')}:${_dataTime.minute.toString().padLeft(2, '0')}',
                        style: TextStyle(
                          color: fontColor,
                          fontSize: setSp(200),
                        ),
                      ),
                      TextSpan(
                        text: ' ${_dataTime.second.toString().padLeft(2, '0')}',
                        style: TextStyle(
                          color: fontColor,
                          fontSize: setSp(40),
                        ),
                      )
                    ],
                  )),
                ),
              ),
              Container(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                height: setHeight(180),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          AppRouter.navigateTo(context, Routes.setting);
        },
        backgroundColor: Colors.white54,
        mini: true,
        child: Icon(Icons.settings, color: Colors.black54,),
      ),
    );
  }
}