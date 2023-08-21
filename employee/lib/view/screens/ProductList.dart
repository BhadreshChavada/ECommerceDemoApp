import 'package:employee/view/model/ProductResponse.dart';
import 'package:flutter/material.dart';

import '../network/ApiService.dart';
import 'ProductDetails.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late List<Products>? _productList = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: _productList == null || _productList!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _productList!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetails(
                                      products: _productList![index])))
                        },
                    child: Flexible(
                        child: Card(
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Image.network(
                              _productList![index].images![0],
                              height: 50,
                              width: 50,
                              fit: BoxFit.fill,
                              alignment: Alignment.centerLeft,
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(15, 2, 10, 2),
                                    child: Text(
                                        _productList![index].title.toString(),
                                        textAlign: TextAlign.left),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(15, 2, 10, 2),
                                    child: Text(
                                        '\$ ${_productList![index].price}',
                                        textAlign: TextAlign.left),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )));
              },
            ),
    );
  }

  void _getData() async {
    ProductResponse pr = (await ApiService().getProducts())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    _productList = pr.products;
  }
}
