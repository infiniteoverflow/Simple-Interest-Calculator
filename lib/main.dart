import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Simple Interest Calculator",
    home: Scaffold(
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
  var items = ["Rupees","Dollars","Others"];

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
                    value: "Rupees",
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
                    
                  },
                ),
              )
            ],
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
}
