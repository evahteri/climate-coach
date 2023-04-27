import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Climate Coach',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Climate Coach'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          title: Center(child: Text(widget.title)),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle))
          ],
          foregroundColor: Colors.green.shade900,
          backgroundColor: const Color.fromARGB(248, 239, 255, 207),
        ),
        body: Column(
          children: <Widget>[
            Center(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.green.shade900,
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
              margin: const EdgeInsets.all(20),
              height: 200,
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    """Climate Coach is a tool for you to get familiar with the key concepts of climate change. The course is split into four topics, each including theory and small quizes to test your learning. Welcome aboard!""",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            )),
            const Expanded(child: ThemeList())
          ],
        ));
  }
}

class ThemeCard extends StatelessWidget {
  const ThemeCard(this.themetext, this.subtext, this.number, this.done,
      {super.key});
  final String themetext;
  final String subtext;
  final String number;
  final String done;

  @override
  Widget build(BuildContext context) {
    if (done == "done") {
      return Card(
        color: const Color.fromARGB(248, 239, 255, 207),
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green.shade900,
              child: Text(number),
            ),
            title: Text(themetext),
            subtitle: Text(subtext),
            iconColor: Colors.green.shade900,
            textColor: Colors.black,
            trailing: const Icon(Icons.check),
          )
        ]),
      );
    } else {
      return Card(
        color: const Color.fromARGB(248, 239, 255, 207),
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green.shade900,
              child: Text(number),
            ),
            title: Text(themetext),
            subtitle: Text(subtext),
            iconColor: Colors.green.shade900,
            textColor: Colors.black,
            trailing: const Icon(Icons.close),
          )
        ]),
      );
    }
  }
}

class ThemeList extends StatelessWidget {
  const ThemeList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: const <Widget>[
        ThemeCard("What is Climate Change?", "Going through basic concepts",
            "1", "done"),
        ThemeCard("Impacts of Climate Change", "Learn about the impacts", "2",
            "not done"),
        ThemeCard("Climate Change Mitigation", "How to soften the blow", "3",
            "not done"),
        ThemeCard("Climate Change Adaptation", "Improvise, adapt, overcome",
            "4", "not done")
      ],
    );
  }
}
