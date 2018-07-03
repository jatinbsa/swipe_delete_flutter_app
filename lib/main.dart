import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Swipe',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
       home: new MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  final List<String> items=new List<String>.generate(30, (i)=>"Items ${i+1}");
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("swipe"),
      ),
      body: new ListView.builder(
        itemCount: items.length,
          itemBuilder: (context,int index){
          return new Dismissible(
              key: new Key(items[index]),
              onDismissed: (direction){items.removeAt(index);
              Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("Item dismissed")));
              },
            background: new Container(
              color: Colors.red,
            ),
            child: new ListTile(
              title: new Text("${items[index]}"),
            ),
          );
          }
      ),
    );
  }
}
