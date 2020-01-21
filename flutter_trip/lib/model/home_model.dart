

import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/model/config_model.dart';
import 'package:flutter_trip/model/grid_nav_model.dart';
import 'package:flutter_trip/model/sales_box_model.dart';

class HomeModel{
  final ConfigModel config;
  final List<CommonModel> bannerList;
  final List<CommonModel> localNavList;
  final List<CommonModel> subNavList;
  final GridNavModel gridNav;
  final SalesBoxModel salesBox;
  HomeModel({this.config,this.bannerList,this.localNavList,this.subNavList,this.gridNav,this.salesBox});

  factory HomeModel.formJson(Map<String,dynamic> json) {
    var localNavListJson = json['lcoalNavListJson'] as List;//先把json 转成list
    //然后循环list每一项 转换成CommonModel对象 再toList转换成List
    List<CommonModel> localNavList=localNavListJson.map((i)=>CommonModel.formJson(i)).toList();

    var bannListJson = json['bannerList'] as List;//先把json 转成list
    //然后循环list每一项 转换成CommonModel对象 再toList转换成List
    List<CommonModel> bannerList=bannListJson.map((i)=>CommonModel.formJson(i)).toList();

    var subNavListJson = json['subNavList'] as List;//先把json 转成list
    //然后循环list每一项 转换成CommonModel对象 再toList转换成List
    List<CommonModel> subNavList=subNavListJson.map((i)=>CommonModel.formJson(i)).toList();

    return HomeModel(
      localNavList:localNavList,
      bannerList: bannerList,
      subNavList: subNavList,
      config: ConfigModel.formJson(json['config']),
      gridNav: GridNavModel.formJson(json['gridNav']),
      salesBox: SalesBoxModel.formJson(json['salesBox'])
    );
  }
}