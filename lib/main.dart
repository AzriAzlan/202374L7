import 'package:flutter/material.dart';
import 'package:maps_app/gmap.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test12333',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title:'AzriAzlan'),

    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key,this.title}) : super(key:key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Container(

        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(
                'Welcome to my maps app',
                 style: TextStyle(fontSize: 42),
              ),

              SizedBox(height:20),
              Text(
                'A map showing Kuala Lumpur',
                style: TextStyle(fontSize: 20),
              ),


            ],
          ),
        ),


      ),

      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.map),
        onPressed: ()=>Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>GMap())
        ),

      ),


    );
  }
}

