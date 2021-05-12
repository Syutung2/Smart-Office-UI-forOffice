import 'package:demo02/tools/global_tools.dart';
/**
 * @Title:
 * @Package
 * @Description: 单列 多列 日期选择器
 * @author A18ccms A18ccms_gmail_com
 * @date
 * @version V1.0
 */

import 'package:flutter/material.dart';

import 'package:flutter_picker/Picker.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:date_format/date_format.dart';

const double _kPickerHeight = 216.0;
const double _kItemHeigt = 40.0;

const double _kTextFontSize = 17.0;

typedef _StringClickCallBack = void Function(int selectIndex, Object selectStr);
typedef _ArrayClickCallBack = void Function(
    List<int> selecteds, List<dynamic> strData);
typedef _DateClickCallBack = void Function(
    dynamic selectDateStr, dynamic selectData);

enum DateType {
  YMD, // y,m,d
  YM, // y,m
  YMD_HM, //y,m,d,hh,mm
  YMD_AP_HM, //y,m,d,ap,hh,mm
  AP_HM,
}

class JhPickerTool {
  //单列
  static void showStringPicker<T>(
    BuildContext context, {
    @required List<T> data,
    String title,
    int normalIndex,
    PickerDataAdapter adapter,
    @required _StringClickCallBack clickCallBack,
  }) {
    openModalPicker(context,
        adapter: adapter ?? PickerDataAdapter(pickerdata: data, isArray: false),
        clickCallBack: (Picker picker, List<int> selecteds) {
      clickCallBack(selecteds[0], data[selecteds[0]]);
    }, selecteds: [normalIndex ?? 0], title: title);
  }

  //多列
  static void showArrayPicker<T>(
    BuildContext context, {
    @required List<T> data,
    String title,
    List<int> normalIndex,
    PickerDataAdapter adapter,
    @required _ArrayClickCallBack clickCallBack,
  }) {
    openModalPicker(context,
        adapter: adapter ?? PickerDataAdapter(pickerdata: data, isArray: true),
        clickCallBack: (Picker picker, List<int> selecteds) {
      clickCallBack(selecteds, picker.getSelectedValues());
    }, selecteds: normalIndex, title: title);
  }

  static void openModalPicker(
    BuildContext context, {
    @required PickerAdapter adapter,
    String title,
    List<int> selecteds,
    @required PickerConfirmCallback clickCallBack,
  }) {
    if (Tools.isDarkMode(context)) {
      new Picker(
              adapter: adapter,
              title: new Text(
                title ?? "请选择",
                style: TextStyle(color: Colors.white, fontSize: _kTextFontSize),
              ),
              selecteds: selecteds,
              backgroundColor: Colors.grey[900],
              cancelText: '取消',
              confirmText: "确定",
              cancelTextStyle: TextStyle(fontSize: _kTextFontSize),
              confirmTextStyle: TextStyle(fontSize: _kTextFontSize),
              textAlign: TextAlign.right,
              itemExtent: _kItemHeigt,
              height: _kPickerHeight,
              textStyle: TextStyle(color: Colors.white),
              selectedTextStyle: TextStyle(color: Colors.white),
              onConfirm: clickCallBack)
          .showModal(context);
    } else {
      new Picker(
              adapter: adapter,
              title: new Text(
                title ?? "请选择",
                style: TextStyle(fontSize: _kTextFontSize),
              ),
              selecteds: selecteds,
              backgroundColor: Colors.white,
              cancelText: '取消',
              confirmText: "确定",
              cancelTextStyle: TextStyle(fontSize: _kTextFontSize),
              confirmTextStyle: TextStyle(fontSize: _kTextFontSize),
              textAlign: TextAlign.right,
              itemExtent: _kItemHeigt,
              height: _kPickerHeight,
              selectedTextStyle: TextStyle(color: Colors.black),
              onConfirm: clickCallBack)
          .showModal(context);
    }
  }

  //日期选择器
  static void showDatePicker(
    BuildContext context, {
    DateType dateType,
    String title,
    DateTime maxValue,
    DateTime minValue,
    DateTime value,
    DateTimePickerAdapter adapter,
    @required _DateClickCallBack clickCallBack,
  }) {
    int timeType;
    if (dateType == DateType.YM) {
      timeType = PickerDateTimeType.kYM;
    } else if (dateType == DateType.YMD_HM) {
      timeType = PickerDateTimeType.kYMDHM;
    } else if (dateType == DateType.YMD_AP_HM) {
      timeType = PickerDateTimeType.kYMD_AP_HM;
    } else if (dateType == DateType.AP_HM) {
      timeType = PickerDateTimeType.kHM_AP;
    } else {
      timeType = PickerDateTimeType.kYMD;
    }
    openModalPicker(context,
        adapter: adapter ??
            DateTimePickerAdapter(
              type: timeType,
              isNumberMonth: true,
              yearSuffix: "年",
              monthSuffix: "月",
              daySuffix: "日",
              strAMPM: const ["上午", "下午"],
              maxValue: maxValue,
              minValue: minValue,
              value: value ?? DateTime.now(),
            ),
        title: title, clickCallBack: (Picker picker, List<int> selecteds) {
      var time = (picker.adapter as DateTimePickerAdapter).value;
      var timeStr;

      if (dateType == DateType.YM) {
        timeStr = time.year.toString() + "年" + time.month.toString() + "月";
      } else if (dateType == DateType.YMD_HM) {
        timeStr = time.year.toString() +
            "年" +
            time.month.toString() +
            "月" +
            time.day.toString() +
            "日" +
            time.hour.toString() +
            "时" +
            time.minute.toString() +
            "分";
      } else if (dateType == DateType.YMD_AP_HM) {
        var str = formatDate(time, [am]) == "AM" ? "上午" : "下午";
        timeStr = time.year.toString() +
            "年" +
            time.month.toString() +
            "月" +
            time.day.toString() +
            "日" +
            str +
            time.hour.toString() +
            "时" +
            time.minute.toString() +
            "分";
      } else if (dateType == DateType.AP_HM) {
        var str = formatDate(time, [am]) == "AM" ? "上午" : "下午";
        timeStr =
            str + time.hour.toString() + "时" + time.minute.toString() + "分";
      } else {
        timeStr = time.year.toString() +
            "年" +
            time.month.toString() +
            "月" +
            time.day.toString() +
            "日";
      }
      clickCallBack(timeStr, picker.adapter.text);
    });
  }
}
