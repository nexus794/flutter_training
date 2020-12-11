import 'package:flutter/material.dart';
import 'package:retgoo_kick_off/models/product.dart';

class AddProductPage extends StatefulWidget {
  AddProductPage({Key key}) : super(key: key);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final txtName = TextEditingController();
  final txtCategory = TextEditingController();
  final txtPrice = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextFormField(
              controller: txtName,
              decoration: InputDecoration(
                labelText: "Nama",
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "Nama tidak boleh kosong.";
                }

                return null;
              },
            ),
            SizedBox(
              height: 24,
            ),
            TextFormField(
              controller: txtCategory,
              decoration: InputDecoration(
                labelText: "Kategori",
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "Kategori tidak boleh kosong.";
                }

                return null;
              },
            ),
            SizedBox(
              height: 24,
            ),
            TextFormField(
              controller: txtPrice,
              decoration: InputDecoration(
                labelText: "Harga",
              ),
              validator: (value) {
                if (int.tryParse(value) == null) {
                  return "Harga tidak valid.";
                }

                if (value.isEmpty) {
                  return "Harga tidak boleh kosong.";
                }

                return null;
              },
            ),
            SizedBox(
              height: 24,
            ),
            RaisedButton(
              child: Text("Simpan"),
              onPressed: () async {
                if (formKey.currentState.validate()) {
                  final data = Product(
                    name: txtName.text,
                    category: txtCategory.text,
                    price: int.tryParse(txtPrice.text) ?? 0,
                  );

                  final success = await saveProduct(data);
                  if (success) {
                    Navigator.pop(context);
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
