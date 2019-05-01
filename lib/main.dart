import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Simple Interest Calculator",
    theme: ThemeData(
      primaryColor: Colors.indigo,
      accentColor: Colors.indigo
    ),
    home: Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Simple Interest Calculator"),
      ),
      body: SIForm(),
    ),
  ));
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SIForm();
  }
}

class _SIForm extends State<SIForm> {
  var items = ["Rupees","Dollars","Euro"];
  var _itemSelected = "Rupees";
  var totalGain = " ";

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        children: <Widget>[
          getImageAsset(),

          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
                controller: principalController,
                keyboardType: TextInputType.number,
                keyboardAppearance: Brightness.dark,
                decoration: InputDecoration(
                    labelText: 'Principal',
                    hintText: 'Enter Principal amount:',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    ))),
          ),

          Padding(
            padding: EdgeInsets.only(top:5.0,left: 20.0,right: 20.0),
            child: TextField(
                controller: roiController,
                keyboardType: TextInputType.number,
                keyboardAppearance: Brightness.dark,
                decoration: InputDecoration(
                    labelText: 'Rate of Interest',
                    hintText: 'Enter the rate of interest:',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    ))),
          ),

          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 25.0,left: 20.0,right: 5.0),
                  child: TextField(
                    controller: termController,
                keyboardType: TextInputType.number,
                keyboardAppearance: Brightness.dark,
                decoration: InputDecoration(
                    labelText: 'Term',
                    hintText: 'Enter the term:',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    ))),
                ),
              ),
              
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top:25.0,right:10.0,left: 10.0),
                  child: DropdownButton<String>(
                    value: _itemSelected,
                items: items.map((String dropDownItem) {

                  return DropdownMenuItem<String> (
                    value: dropDownItem,
                    child: Text(
                      dropDownItem
                    ),
                  );

                }).toList(),

                onChanged: (String value) {
                  setState(() {
                    this._itemSelected = value;
                  });
                },
              ),
                ),
              )
            ],
          ),
          
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  color: Colors.yellow,
                  child: Text(
                    "Calculate"
                  ),
                  onPressed: () {
                    setState(() {
                      totalGain = getTotalAmount();
                    });
                  },
                ),
              ),

              Expanded(
                child: RaisedButton(
                  color: Colors.orange,
                  child: Text(
                    "Reset"
                  ),
                  onPressed: () {
                    setState(() {
                      resetData();
                    });
                  },
                ),
              )
            ],
          ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
            totalGain,
            style: TextStyle(
              fontSize: 20.0
            ),
          ),
          )
        ],
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('assets/bank.jpeg');
    Image image = Image(
      image: assetImage,
      width: 200.0,
      height: 200.0,
    );
    return Container(
      child: image,
    );
  }

  String getTotalAmount() {
    double p = double.parse(principalController.text);
    double r = double.parse(roiController.text);
    double t = double.parse(termController.text);

    totalGain = "The amount after $t years is ${p+(p*r*t)/100} $_itemSelected";
    return totalGain;
  }

  void resetData() {
    principalController.text = '';
    roiController.text = '';
    termController.text = '';
    _itemSelected = "Rupees";
    totalGain = ' ';
  }
}
