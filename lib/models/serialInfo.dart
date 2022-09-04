class SerialInfo {
  late final String item;
  late final String quantity;
  late final String purpose;
  late final String uprice;
  late final String serial_no;
  late final String sp;
  late final String item_des;
  late final String std_cost_per_unit;
  late final String uom;

  SerialInfo({
    required this.item,
    required this.quantity,
    required this.purpose,
    required this.uprice,
    required this.serial_no,
    required this.sp,
    required this.item_des,
    required this.std_cost_per_unit,
    required this.uom,
  });

  factory SerialInfo.fromJson(Map<String, dynamic> serialinfo) {
    return SerialInfo(
      item: serialinfo['item'],
      quantity: serialinfo['quantity'],
      purpose: serialinfo['purpose'],
      uprice: serialinfo['uprice'],
      serial_no: serialinfo['serial_no'],
      sp: serialinfo['sp'],
      item_des: serialinfo['item_des'],
      std_cost_per_unit: serialinfo['std_cost_per_unit'],
      uom: serialinfo['uom'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> serialinfo = Map<String, dynamic>();
    serialinfo['item'] = item;
    serialinfo['quantity'] = quantity;
    serialinfo['purpose'] = purpose;
    serialinfo['uprice'] = uprice;
    serialinfo['serial_no'] = serial_no;
    serialinfo['sp'] = sp;
    serialinfo['item_des'] = item_des;
    serialinfo['std_cost_per_unit'] = std_cost_per_unit;
    serialinfo['uom'] = uom;

    return serialinfo;
  }
}
