import 'package:block_flutter_fundamental/colour_block.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ColorBloc bloc = ColorBloc();

  @override
  void dispose() {
    bloc.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                bloc.eventSink.add(ColorEvent.toAmber);
              },
              backgroundColor: Colors.amber,
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                bloc.eventSink.add(ColorEvent.toLightBlue);
              },
              backgroundColor: Colors.lightBlue,
            ),
          ],
        ),
        appBar: AppBar(
          title: Text("BLoC without Library"),
        ),
        body: Center(
            child: StreamBuilder(
          stream: bloc.stateStream,
          initialData: Colors.amber,
          builder: (context, snapshot) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: 100,
              height: 100,
              color: snapshot.data,
            );
          },
        )),
      ),
    );
  }
}
