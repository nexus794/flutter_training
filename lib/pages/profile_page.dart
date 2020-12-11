import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController txtPesan = TextEditingController();
  TextEditingController txtPesanLagi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: txtPesan,
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              controller: txtPesanLagi,
            ),
            RaisedButton(
              child: Text("SAVE"),
              onPressed: () {
                var result = <String, String>{
                  "pesan1": txtPesan.text,
                  "pesan2": txtPesanLagi.text,
                };

                Navigator.pop(context, result);
              },
            )
          ],
        ),
      ),
    );
  }
}
