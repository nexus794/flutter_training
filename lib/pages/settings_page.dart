import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController txtPesan = TextEditingController();
  Map<String, String> data;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (data == null) {
      data = ModalRoute.of(context).settings.arguments;
      txtPesan.text = data["pesan1"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: txtPesan,
        ),
      ),
    );
  }
}
