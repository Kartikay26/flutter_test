import 'package:flutter/material.dart';

void main() {
  runApp(new MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bunk Manager",
      home: AllSubjects(),
    );
  }
}

class AllSubjects extends StatefulWidget {
  @override
  _AllSubjectsState createState() => _AllSubjectsState();
}

class _AllSubjectsState extends State<AllSubjects> {
  List<String> subjects = ["OOPS", "TOC", "Math"];

  List<Widget> _buildSubjects(BuildContext context) {
    return subjects.map((name) => SubjectCard(name)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bunk Manager"),
      ),
      body: ListView(
        children: _buildSubjects(context),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text("Add Subject"),
        onPressed: () {
          setState(() {
            subjects.add("New Subject");
          });
        },
      ),
    );
  }
}

class SubjectCard extends StatefulWidget {
  final subName;
  SubjectCard(this.subName);

  @override
  _SubjectCardState createState() => _SubjectCardState();
}

class _SubjectCardState extends State<SubjectCard> {
  final subjectStyle = TextStyle(fontSize: 18.0);
  final counterStyle = TextStyle(fontSize: 18.0, color: Colors.purple);

  var counter = 0;

  void _plus() {
    print("Plus presssed");
    setState(() {
      counter++;
    });
  }

  void _minus() {
    print("Minus presssed");
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(16.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Text(
                widget.subName,
                style: subjectStyle,
              )),
              IconButton(
                icon: Icon(Icons.add_circle_outline),
                onPressed: _plus,
              ),
              Text(
                counter.toString(),
                style: counterStyle,
              ),
              IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: _minus,
              )
            ],
          ),
        ));
  }
}
