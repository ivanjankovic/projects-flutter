import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedDate = 18;
  var selectedBarber = 'Milentije';
  var selectedTime = '12:30';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text('BOOKING',
          style: TextStyle(
            fontFamily: 'FirSans',
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 100.0,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3.0,
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 4.0,
                    )
                  ],
                  color: Colors.white,
                ),
              ),
              Positioned(
                top: 20.0,
                left: 15.0,
                right: 15.0,
                child: Container(
                  height: 60.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      getDate(18, 'Tue'),
                      SizedBox(width: 25.0),
                      getDate(19, 'Wed'),
                      SizedBox(width: 25.0),
                      getDate(20, 'Thu'),
                      SizedBox(width: 25.0),
                      getDate(21, 'Fri'),
                      SizedBox(width: 25.0),
                    ],
                  ),
                ),
              )
            ],
          ),

        ],
      ),
    );
  }

  Widget getDate(int date, String day) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: switchColor(date)
      ),
      width: 60.0,
      height: 60.0,
      child: InkWell(
        onTap: () {
          selectDate(date);
        },
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 7.0),
              Text(
                date.toString(),
                style: TextStyle(
                  fontFamily: 'Numito',
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: switchContentColor(date),
                ),
              ),
              SizedBox(height: 3.0),
              Text(
                day,
                style: TextStyle(
                  fontFamily: 'FiraSans',
                  fontSize: 15.0,
                  color: switchContentColor(date),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color switchColor(date) {
    if (date == selectedDate) {
      return Colors.black.withOpacity(0.8);
    } else {
      return Colors.grey.withOpacity(0.2);
    }
  }

  Color switchContentColor(date) {
    if (date == selectedDate) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  selectDate(date) {
    setState(() {
      selectedDate = date;
    });
  }
}
