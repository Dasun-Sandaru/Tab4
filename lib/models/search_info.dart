import 'package:flutter/scheduler.dart';

import '../helper/getSearchInfo.dart';

class FilteredData {
  String? from;
  String? to;
  String? ignr;
  String? customer_id;
  String? site;
  String? contract;
  String? orderBy;
  String? engineer;
  String? token;

  FilteredData({
    this.from,
    this.to,
    this.ignr,
    this.customer_id,
    this.site,
    this.contract,
    this.orderBy,
    this.engineer,
    this.token,
  });

  // factory SearchInfoData.fromJson(Map<String, dynamic> searchinfo) {
  //   return SearchInfoData(
  //     from: searchinfo['from'],
  //     to: searchinfo['to'],
  //     ignr: searchinfo['ignr'],
  //     customer_id: searchinfo['customer_id'],
  //     site: searchinfo['site'],
  //     contract: searchinfo['contract'],
  //     orderBy: searchinfo['orderBy'],
  //     engineer: searchinfo['engineer'],
  //   );
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> searchinfo = Map<String, dynamic>();
    searchinfo['from'] = from;
    searchinfo['to'] = to;
    searchinfo['ignr'] = ignr;
    searchinfo['customer_id'] = customer_id;
    searchinfo['site'] = site;
    searchinfo['contract'] = contract;
    searchinfo['orderBy'] = orderBy;
    searchinfo['engineer'] = engineer;
    return searchinfo;
  }
}

class SearchInfoResponse {
  String company_name = '--';

  String contract_id = '--';
  String requisition_no = '--';
  String start_date = '--';
  String requested_date = '--';
  String engineer = '--';
  String sign_engineer = '--';
  String sign_customer = '--';

  bool edit = false;
  bool delete = false;
  bool view = false;
  bool email_sent = false;
  bool email = false;
  bool signature = false;
  bool print = false;

  SearchInfoResponse({
    required this.company_name,
    required this.contract_id,
    required this.requisition_no,
    required this.start_date,
    required this.requested_date,
    required this.engineer,
    required this.sign_engineer,
    required this.sign_customer,
    required this.edit,
    required this.delete,
    required this.view,
    required this.email_sent,
    required this.signature,
    required this.print,
  });

  factory SearchInfoResponse.fromJson(Map<String, dynamic> searchinfo) {
    return SearchInfoResponse(
      company_name: searchinfo['company_name'],
      contract_id: searchinfo['contract_id'],
      requisition_no: searchinfo['requisition_no'],
      start_date: searchinfo['start_date'],
      requested_date: searchinfo['requested_date'],
      engineer: searchinfo['engineer'],
      sign_engineer: searchinfo['sign_engineer'],
      sign_customer: searchinfo['sign_customer'],
      edit: searchinfo['edit'],
      delete: searchinfo['delete'],
      view: searchinfo['view'],
      email_sent: searchinfo['email_sent'],
      signature: searchinfo['signature'],
      print: searchinfo['print'],
    );
  }
}
