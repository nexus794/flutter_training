import 'package:flutter/material.dart';
import 'package:retgoo_kick_off/models/product.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage({Key key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.pushNamed(context, "/add-product");
          setState(() {});
        },
      ),
    );
  }

  Widget buildBody() {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
      },
      child: FutureBuilder<List<Product>>(
        future: getAllProducts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final list = snapshot.data;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list.elementAt(index);
              return ListTile(
                title: Text(item.name),
                subtitle: Text(item.category),
                trailing: Text(item.price.toString()),
                onTap: () {
                  print(item.id);
                },
              );
            },
          );
        },
      ),
    );
  }

  // Widget buildBody() {
  //   return FutureBuilder<Response>(
  //     future: api.get("wsm/products.json"),
  //     builder: (context, snapshot) {
  //       if (!snapshot.hasData) {
  //         return Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       }

  //       final response = snapshot.data;
  //       if (response.statusCode == 200) {
  //         final List list = response.data;
  //         return ListView.builder(
  //           itemCount: list.length,
  //           itemBuilder: (context, index) {
  //             final item = list.elementAt(index);
  //             return ListTile(
  //               title: Text(item["name"]),
  //               subtitle: Text(item["category"]),
  //               trailing: Text(item["price"].toString()),
  //             );
  //           },
  //         );
  //       }

  //       return Center(
  //         child: Text("Koneksi gagal"),
  //       );
  //     },
  //   );
  // }
}
