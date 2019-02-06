import 'package:flaretest/phase.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _animation = "Sun Rotate";
  int index = 0;
  double _opacity = 0.0;
  String topText;

  @override
  void initState() {
    super.initState();
    _animation = phases[index].animation;
    _opacity = phases[index].showButtonsOpac;
    topText = phases[index].text;
  }

  void _forward() {
    setState(() {
      index++;
      topText = phases[index].text;
      _opacity = phases[index].showButtonsOpac;
      _animation = phases[index].animation;
    });
  }

  void _back() {
    setState(() {
      index--;
      topText = phases[index].text;
      _opacity = phases[index].showButtonsOpac;
      _animation = phases[index].animation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FlareActor(
            "assets/house.flr",
            alignment: Alignment.center,
            animation: _animation,
            fit: BoxFit.fill,
            //controller: controller,
          ),
          Positioned(
            top: 10,
            right: 50,
            left: 50,
            child: AnimatedContainer(
              curve: Curves.fastOutSlowIn,
              duration: Duration(seconds: 1),
              child: Text(
                topText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50,color: Colors.white),
              ),
            ),
          ),
          Positioned(
            left: 50,
            bottom: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image.network(
                    "https://st3.depositphotos.com/1915171/18864/v/1600/depositphotos_188643794-stock-illustration-louvers-vertical-sign-icon-window.jpg",
                    height: 250.0,
                    width: 250.0,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    AnimatedOpacity(
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOut,
                      opacity: _opacity,
                      child: new RawMaterialButton(
                        highlightColor: Colors.grey,
                        onPressed: null,
                        child: new Icon(
                          Icons.keyboard_arrow_up,
                          size: 35.0,
                        ),
                        shape: new CircleBorder(),
                        elevation: 4.0,
                        fillColor: Colors.blue,
                        padding: const EdgeInsets.all(15.0),
                      ),
                    ),
                    Container(
                      height: 32.0,
                    ),
                    AnimatedOpacity(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn,
                      opacity: _opacity,
                      child: new RawMaterialButton(
                        highlightColor: Colors.grey,
                        onPressed: null,
                        child: new Icon(
                          Icons.keyboard_arrow_down,
                          size: 35.0,
                        ),
                        shape: new CircleBorder(),
                        elevation: 4.0,
                        fillColor: Colors.blue,
                        padding: const EdgeInsets.all(15.0),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: RaisedButton(
              onPressed: _back,
              child: Text("Back"),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: RaisedButton(
              onPressed: _forward,
              child: Text("Continue"),
            ),
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
