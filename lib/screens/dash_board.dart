import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:tab4/models/search_info.dart';

import '../helper/getDropvalue.dart';
import '../helper/getSearchInfo.dart';
import '../helper/widgets/tableview.dart';
import '../models/DropDownTypes.dart';

import '../services/sharedPref.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  // varibales

  // data source

  GetSearchInfo getSearchInfo = GetSearchInfo();
  List listofsearchdata = [];
  DataTableSource _data = DataTableView([]);

  // check box
  bool isCheckIgnoreDate = false;
  String? isignrOn;
  // select to date filed
  //late DateTime pickedDateFrom;
  // select From date filed
  //late DateTime pickedDateTo;
  // dates
  late String startdate;
  late String enddate;

  DateTime pickedDateFrom = DateTime.now(); // select From date filed
  DateTime pickedDateTo = DateTime.now(); // select to date filed

  // selected drop down value
  // customer dp
  var adropdownvalue;
  String aIdOfSelectedDropDownItem = '';
  // site dp
  var bdropdownvalue;
  String bIdOfSelectedDropDownItem = '';
  // contract dp
  var cdropdownvalue;
  String cIdOfSelectedDropDownItem = '';
  // order by dp
  var ddropdownvalue;
  String dIdOfSelectedDropDownItem = '';
  // enginner dp
  var edropdownvalue;
  String eIdOfSelectedDropDownItem = '';

  // sort option
  var sortOptiondropdown;

  TextEditingController searchController = TextEditingController();

  // String aaadropdownvalue = replacedropdownvalue;
  // String bbbdropdownvalue = replacedropdownvalue;

  getDropvalue getDropDownvalueObj = getDropvalue();

  // drop down lists
  // customer dp
  List<DropDownTypes> alistOfDrofDownValues = [];
  // site dp
  List blistOfDrofDownValues = [];
  // contract dp
  List clistOfDrofDownValues = [];
  // order by dp
  List<String> dlistOfDrofDownValues = ['Service date', 'Requested date'];
  // engineer dp
  List elistOfDrofDownValues = [];

  // table sort
  List<String> sortOption = ['10', '25', '50', '100', 'All'];

  // drop down fill / end
  // bool isFilling = true;
  // searching
  bool isSearching = false;

  // data table
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  // token
  late String token;

  // methods
  @override
  initState() {
    super.initState();

    // set dates
    startdate = DateFormat('dd/MM/yyyy').format(pickedDateFrom);
    enddate = DateFormat('dd/MM/yyyy').format(pickedDateTo);

    // get token
    getToken();

    //don();
  }

  // helper print
  helperPrint() {
    if (isCheckIgnoreDate) {
      // false --- empty

      isignrOn = 'on';

      print('Date From -: Non');
      print('Date To -: Non');
      print('Ignore option -: $isCheckIgnoreDate  --- On ? Off ? $isignrOn');
      print('Customer dp value -: $aIdOfSelectedDropDownItem');
      print('Site dp value -: $bIdOfSelectedDropDownItem');
      print('Contract dp value -: $cIdOfSelectedDropDownItem');
      print('Order by dp value -: $dIdOfSelectedDropDownItem');
      print('Enginner dp value -: $eIdOfSelectedDropDownItem');
    } else {
      // true --- isCheckIgnoreDate = on

      print('Date From -: $startdate');
      print('Date To -: $enddate');
      print('Ignore option -: $isCheckIgnoreDate --- On ? Off ? $isignrOn');
      print('Customer dp value -: $aIdOfSelectedDropDownItem');
      print('Site dp value -: $bIdOfSelectedDropDownItem');
      print('Contract dp value -: $cIdOfSelectedDropDownItem');
      print('Order by dp value -: $dIdOfSelectedDropDownItem');
      print('Enginner dp value -: $eIdOfSelectedDropDownItem');
    }
  }

  botSearch() {
    FilteredData searchInfoObj = FilteredData(
      from: '16/08/2022',
      to: '23/08/2022',
      ignr: 'on',
      customer_id: '100081',
      site: '',
      contract: '',
      orderBy: 'start_date',
      engineer: '',
      token: token,
    );

    searchInfoObj.toJson();
  }

  search(
      String? startdate,
      String? enddate,
      String? isignrOn,
      String? aIdOfSelectedDropDownItem,
      String? bIdOfSelectedDropDownItem,
      String? cIdOfSelectedDropDownItem,
      String? dIdOfSelectedDropDownItem,
      String? eIdOfSelectedDropDownItem) {
    FilteredData searchInfoObj = FilteredData(
        // from: startdate,
        // to: enddate,
        // ignr: isignrOn,
        // customer_id: aIdOfSelectedDropDownItem,
        // site: bIdOfSelectedDropDownItem,
        // contract: cIdOfSelectedDropDownItem,
        // orderBy: dIdOfSelectedDropDownItem,
        // engineer: eIdOfSelectedDropDownItem,
        );

    // Map<String,dynamic> toJsonMap = searchInfoObj.toJson();

    // GetSearchInfo getSearchInfo = GetSearchInfo();
    // getSearchInfo.getsearchInfo(token, toJsonMap);
  }

  // try

  // get token and fill drop down
  getToken() async {
    SharedPref sharedPref = SharedPref();
    token = (await sharedPref.readToken())!;
    //tokenVariable = token;

    // load drop down in first time
    // customer dp
    print('drop down filling starting');
    alistOfDrofDownValues = (await getDropDownvalueObj.getDropDownValues(
        token, 'get-companys-all/'))!;

    // site dp
    // blistOfDrofDownValues =
    //     (await getDropvalueobj.getDropDownValuesForItems(token, 'get-items/'))!;

    // contract dp
    // clistOfDrofDownValues =
    //     (await getDropvalueobj.getDropDownValuesForItems(token, 'get-items/'))!;

    // oder by dp
    // dlistOfDrofDownValues =
    //     (await getDropvalueobj.getDropDownValuesForItems(token, 'get-items/'))!;

    //enginner dp
    elistOfDrofDownValues =
        (await getDropDownvalueObj.getDropDownValues(token, 'api_empnames/'))!;

    print('drop down filling end');
    //isFilling = false;

    setState(() {});
  }

  // use for get from date
  _fromDate() async {
    final DateTime? pickeddate = await showDatePicker(
        context: context,
        initialDate: pickedDateFrom,
        firstDate: DateTime.now().subtract(const Duration(days: 0)),
        lastDate: DateTime(DateTime.now().year + 5));

    if (pickeddate != null) {
      setState(
        () {
          pickedDateFrom = pickeddate;
          //startdate = pickeddate.toString();
          startdate = DateFormat('dd/MM/yyyy').format(pickedDateFrom);
          print(startdate);
        },
      );
    }
  }

  // use for get to date
  _toDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: pickedDateFrom,
      firstDate: DateTime(
          pickedDateFrom.year, pickedDateFrom.month, pickedDateFrom.day),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (picked != null) {
      setState(
        () {
          pickedDateTo = picked;
          // enddate = pickedDateTo.toString();
          enddate = DateFormat('dd/MM/yyyy').format(pickedDateTo);
          print(enddate);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FilteredData filteredDataObj = FilteredData(
            from: '16/08/2022',
            to: '23/08/2022',
            ignr: 'on',
            customer_id: '100081',
            site: '',
            contract: '',
            orderBy: 'start_date',
            engineer: '',
          );

          Map toJson = filteredDataObj.toJson();
          print(toJson);

          GetSearchInfo getop = GetSearchInfo();

          listofsearchdata = await getop.getsearchInfo(token, toJson);

          print(listofsearchdata);

          setState(() {
            _data = DataTableView(listofsearchdata);
          });
        },
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //buildProgrssIndicator(),
              // screen title
              Container(
                width: double.infinity,
                height: 50,
                color: Colors.blue[200],
                child: Row(
                  children: const [
                    Text(
                      'FIELD SERVICE ENTRIES',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              // dates
              Container(
                width: double.infinity,
                height: 100,
                color: Colors.amber[100],
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: buildFromDate('Date : From'),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Container(
                        child: buildToDate('Date : To'),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: buildIgnoreDateCheckBox(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              // drop downs ---> customer/site/contract
              Container(
                width: double.infinity,
                height: 100,
                color: Colors.amber[300],
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: buildDropDown('Customer', builddpForCustomer()),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Container(
                        child: buildDropDown('Site', builddpForSite()),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Container(
                        child: buildDropDown('Contract', builddpForContract()),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              // drop downs ---> order by/ engineer
              Container(
                width: double.infinity,
                height: 100,
                color: Colors.amber[500],
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: buildDropDown('Order By', builddpForOrderBy()),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Container(
                        child: buildDropDown('Engineer', builddpForEngineer()),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              // buttons
              Container(
                width: double.infinity,
                height: 100,
                color: Colors.amber[500],
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        // height: 50,
                        color: Colors.grey[100],
                        child: Text('data'),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Container(
                        color: Colors.grey[300],
                        child: Text('data'),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Container(
                        child: buildSearchButton(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              // table option
              Container(
                width: double.infinity,
                height: 50,
                color: Colors.amber[100],
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Text('data'),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 1.0, color: Colors.white),
                              left: BorderSide(width: 1.0, color: Colors.white),
                              right:
                                  BorderSide(width: 1.0, color: Colors.white),
                              bottom:
                                  BorderSide(width: 1.0, color: Colors.white),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(0))),
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: builddpForSortOption(),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Expanded(
                      child: Container(
                        child: TextField(
                          controller: searchController,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // data table
              Container(
                height: 2000,
                width: double.infinity,
                color: Colors.red,
                // child: const Center(child: Text('Data Table')),
                child: buildDataTable(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // widgets

  // drop down
  Widget buildDropDown(String title, Widget widgetDropdown) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(height: 5),
        Container(
            height: 50,
            decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.white),
                  left: BorderSide(width: 1.0, color: Colors.white),
                  right: BorderSide(width: 1.0, color: Colors.white),
                  bottom: BorderSide(width: 1.0, color: Colors.white),
                ),
                borderRadius: BorderRadius.all(Radius.circular(0))),
            child: widgetDropdown),
      ],
    );
  }

  // from date
  Widget buildFromDate(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.white),
                  left: BorderSide(width: 1.0, color: Colors.white),
                  right: BorderSide(width: 1.0, color: Colors.white),
                  bottom: BorderSide(width: 1.0, color: Colors.white),
                ),
                borderRadius: BorderRadius.all(Radius.circular(0))),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                          //'${pickedDateFrom.year} / ${pickedDateFrom.month} / ${pickedDateFrom.day}',
                          '${pickedDateFrom.day} / ${pickedDateFrom.month} / ${pickedDateFrom.year}',
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15)),
                    ),
                    onTap: () {
                      //_fromDate();
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today, color: Colors.white),
                    tooltip: 'Tap to open date picker',
                    onPressed: () {
                      _fromDate();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // to date
  Widget buildToDate(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.white),
                  left: BorderSide(width: 1.0, color: Colors.white),
                  right: BorderSide(width: 1.0, color: Colors.white),
                  bottom: BorderSide(width: 1.0, color: Colors.white),
                ),
                borderRadius: BorderRadius.all(Radius.circular(0))),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                          //'${pickedDateTo.year} / ${pickedDateTo.month} / ${pickedDateTo.day}',
                          '${pickedDateTo.day} / ${pickedDateTo.month} / ${pickedDateTo.year}',
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15)),
                    ),
                    onTap: () {
                      //_toDate();
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today, color: Colors.white),
                    tooltip: 'Tap to open date picker',
                    onPressed: () {
                      _toDate();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // check box
  Widget buildIgnoreDateCheckBox() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            color: Colors.black12,
            child: Checkbox(
              checkColor: Colors.red,
              activeColor: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0),
              ),
              value: isCheckIgnoreDate,
              onChanged: (val) {
                setState(() {
                  isCheckIgnoreDate = val!;
                });
              },
            ),
          ),
          const SizedBox(width: 5),
          const Text('Ignore Date'),
        ],
      ),
    );
  }

  // customer drop down
  Widget builddpForCustomer() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<DropDownTypes>(
        // Initial Value
        value: adropdownvalue,
        iconSize: 36,
        hint: const Text('Choose one'),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
        ),
        isExpanded: true,
        //items:reitemsIdTypes.map(buildMenuItem).toList(),
        // Array list of items
        items: alistOfDrofDownValues.map(
          (replaceObj) {
            var dropdownMenuItem = DropdownMenuItem<DropDownTypes>(
              value: replaceObj,
              child: Text(
                replaceObj.drop_value,
                //replaceObj,
                // 'galle',
                style: const TextStyle(color: Colors.red),
              ),
            );
            return dropdownMenuItem;
          },
        ).toList(),

        onChanged: (val) async {
          setState(() {
            adropdownvalue = val;
          });

          int aindexOfSelectedItem =
              alistOfDrofDownValues.indexOf(adropdownvalue);
          print(aindexOfSelectedItem);
          aIdOfSelectedDropDownItem =
              alistOfDrofDownValues[aindexOfSelectedItem].drop_id;

          print(aIdOfSelectedDropDownItem);

          //site dp
          //clear
          //blistOfDrofDownValues.clear();
          blistOfDrofDownValues = (await getDropDownvalueObj.getDropDownValues(
              token, 'api_dropsites_forcompany/100081'))!;
          setState(() {});
        },
      ),
    );
  }

  // site drop down
  Widget builddpForSite() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<DropDownTypes>(
        // Initial Value
        value: bdropdownvalue,
        iconSize: 36,
        hint: const Text('Choose one'),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
        ),
        isExpanded: true,
        //items:reitemsIdTypes.map(buildMenuItem).toList(),
        // Array list of items
        items: blistOfDrofDownValues.map(
          (replaceObj) {
            var dropdownMenuItem = DropdownMenuItem<DropDownTypes>(
              value: replaceObj,
              child: Text(
                replaceObj.drop_value,
                //replaceObj,
                // 'galle',
                style: const TextStyle(color: Colors.red),
              ),
            );
            return dropdownMenuItem;
          },
        ).toList(),

        onChanged: (val) async {
          setState(() {
            bdropdownvalue = val;
          });

          int bindexOfSelectedItem =
              blistOfDrofDownValues.indexOf(bdropdownvalue);
          print(bindexOfSelectedItem);
          bIdOfSelectedDropDownItem =
              blistOfDrofDownValues[bindexOfSelectedItem].drop_id;

          print(bIdOfSelectedDropDownItem);

          //contract dp
          // clear
          // clistOfDrofDownValues.clear();
          clistOfDrofDownValues = (await getDropDownvalueObj.getDropDownValues(
              token, 'api_asset_contracts_forsites/COMPST'))!;
          setState(() {});
        },
      ),
    );
  }

  // contract drop down
  Widget builddpForContract() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<DropDownTypes>(
        // Initial Value
        value: cdropdownvalue,
        iconSize: 36,
        hint: const Text('Choose one'),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
        ),
        isExpanded: true,
        //items:reitemsIdTypes.map(buildMenuItem).toList(),
        // Array list of items
        items: clistOfDrofDownValues.map(
          (replaceObj) {
            var dropdownMenuItem = DropdownMenuItem<DropDownTypes>(
              value: replaceObj,
              child: Text(
                replaceObj.drop_value,
                //replaceObj,
                // 'galle',
                style: const TextStyle(color: Colors.red),
              ),
            );
            return dropdownMenuItem;
          },
        ).toList(),

        onChanged: (val) async {
          setState(() {
            cdropdownvalue = val;
          });

          int cindexOfSelectedItem =
              clistOfDrofDownValues.indexOf(cdropdownvalue);
          print(cindexOfSelectedItem);
          cIdOfSelectedDropDownItem =
              clistOfDrofDownValues[cindexOfSelectedItem].drop_id;

          print(cIdOfSelectedDropDownItem);
          setState(() {});
        },
      ),
    );
  }

  // order by
  Widget builddpForOrderBy() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        // Initial Value
        value: ddropdownvalue,
        iconSize: 36,
        hint: const Text('Choose one'),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
        ),
        isExpanded: true,
        //items:reitemsIdTypes.map(buildMenuItem).toList(),
        // Array list of items

        items: dlistOfDrofDownValues.map((items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),

        // After selecting the desired option,it will
        // change button value to selected value
        onChanged: (String? newValue) {
          setState(() {
            ddropdownvalue = newValue!;
            print(ddropdownvalue);

            if (ddropdownvalue == dlistOfDrofDownValues[0]) {
              // Service date
              dIdOfSelectedDropDownItem = 'car';
              print('car');
            } else {
              // Requested date
              print('bus');
              dIdOfSelectedDropDownItem = 'bus';
            }
          });
        },
      ),
    );
  }

  // Enginner
  Widget builddpForEngineer() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<DropDownTypes>(
        // Initial Value
        value: edropdownvalue,
        iconSize: 36,
        hint: const Text('Choose one'),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
        ),
        isExpanded: true,
        //items:reitemsIdTypes.map(buildMenuItem).toList(),
        // Array list of items
        items: elistOfDrofDownValues.map(
          (replaceObj) {
            var dropdownMenuItem = DropdownMenuItem<DropDownTypes>(
              value: replaceObj,
              child: Text(
                replaceObj.drop_value,
                //replaceObj,
                // 'galle',
                style: const TextStyle(color: Colors.red),
              ),
            );
            return dropdownMenuItem;
          },
        ).toList(),

        onChanged: (val) async {
          setState(() {
            edropdownvalue = val;
          });

          int eindexOfSelectedItem =
              elistOfDrofDownValues.indexOf(edropdownvalue);
          print(eindexOfSelectedItem);
          eIdOfSelectedDropDownItem =
              elistOfDrofDownValues[eindexOfSelectedItem].drop_id;

          print(eIdOfSelectedDropDownItem);
          setState(() {});
        },
      ),
    );
  }

  // Widget buildProgrssIndicator(){
  //   return  Center(
  //     child: isFilling ? const CircularProgressIndicator() : Container(),

  //   );
  // }

  Widget buildTableOption() {
    return Row(
      children: [
        // change show row count

        Expanded(
          child: Row(
            children: [
              // show txt
              const Text('Show'),
              const SizedBox(width: 5),
              builddpForSortOption(),
            ],
          ),
        ),

        //filter data by id
        Expanded(
          child: TextField(
            controller: searchController,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }

  Widget buildSearchButton() {
    //final f = new DateFormat('yyyy-MM-dd hh:mm');
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ButtonTheme(
        minWidth: MediaQuery.of(context).size.width,
        buttonColor: const Color(0xFFee3a43), //  <-- dark color
        textTheme: ButtonTextTheme.primary,
        child: RaisedButton(
          onPressed: () {
            // helper pint
            //helperPrint();
            botSearch();
          },
          textColor: Colors.white,
          padding: const EdgeInsets.all(0.0),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFFee3a43),
                  Color(0xFFee3a43),
                  Color(0xFFee3a43),
                ],
              ),
            ),
            padding: const EdgeInsets.all(10.0),
            // child: const Text('Submit',
            //     style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),

            child: isSearching
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Text(
                    'Search',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
          ),
        ),
      ),
    );
  }

  // sort option drop down
  Widget builddpForSortOption() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        // Initial Value
        value: sortOptiondropdown,
        iconSize: 36,
        hint: const Text('Choose one'),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
        ),
        isExpanded: true,
        //items:reitemsIdTypes.map(buildMenuItem).toList(),
        // Array list of items

        items: sortOption.map((items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),

        // After selecting the desired option,it will
        // change button value to selected value
        onChanged: (String? newValue) {
          setState(() {
            sortOptiondropdown = newValue!;
            print(sortOptiondropdown);
          });
        },
      ),
    );
  }

  Widget buildDataTable() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // table
          Container(
            width: double.infinity,
            child: PaginatedDataTable(
              source: _data,
              columns: const [
                DataColumn(label: Text('CUSTOMER')),
                DataColumn(label: Text('CONTRACT ID')),
                DataColumn(label: Text('Requisition No')),
                DataColumn(label: Text('FORM NO')),
                DataColumn(label: Text('REQUEST DATE')),
                DataColumn(label: Text('ENGINEER')),
                DataColumn(label: Text('SIGN ENGINEER')),
                DataColumn(label: Text('SIGN CUSTOMER')),
                DataColumn(label: Text('OPTION')),
              ],
              columnSpacing: 30,
              // dataRowHeight: 80,
              showFirstLastButtons: true,
              rowsPerPage: _rowsPerPage,
              availableRowsPerPage: const <int>[5, 10, 25, 50],
              onRowsPerPageChanged: (value) {
                setState(() {
                  _rowsPerPage = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
