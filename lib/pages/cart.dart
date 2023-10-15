import 'package:flutter/material.dart';
import 'package:shoe_shop_3/helper/auth_helper.dart';
import 'package:shoe_shop_3/pages/item_edit.dart';
import 'package:shoe_shop_3/reops/cart_user_repo.dart';

import '../../widgets/custom_drawer_app_mode.dart';
import '../../widgets/search_appbar.dart';
import '../models/cart_user_model.dart';
import '../models/product_model.dart';
import '../reops/product_repo.dart';


class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  IconData appModeIcon = Icons.sunny;

  void updateAppModeIcon(IconData newIcon) {
    setState(() {
      appModeIcon = newIcon;
    });
  }

  Future<List<CartUserModel>>? _cardData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: SearchAppBar(context),
      drawer: CustomDrawerWithAppMode(context, updateAppModeIcon),
      body: Container(
        child: FutureBuilder<List<CartUserModel>>(
          future: CartUserRepository().getByFieldWithCheckIsPaid(
              "User_id", AuthenticationProvider.userId ?? '', false),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                    child: Text("Error: ${snapshot.error.toString()}"));
              }
              var items = snapshot.data ?? [];
              return RefreshIndicator(
                onRefresh: () async {
                  setState(() {});
                },
                child: items.isEmpty
                    ? Center(child: Text("No Data"))
                    : ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CartItemWidget(cartItem: items[index]);
                          // return Column(
                          //   children: [
                          //     Text("${items[index].userId}"),
                          //     Text("${items[index].prodId}"),
                          //     Text("${items[index].color}"),
                          //   ],
                          // );
                        },
                      ),
              );
            } else {
              return Center(
                child: Text("Error: ${snapshot.error.toString()}"),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        color: Theme.of(context).colorScheme.secondary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: \$"',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            ElevatedButton(
              onPressed: () {
                // Implement the checkout functionality
              },
              child: Text(
                'Checkout',
                // style: TextStyle(
                //   color: Theme.of(context).colorScheme.secondary
                // ),
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItemWidget extends StatefulWidget {
  final CartUserModel cartItem;

  const CartItemWidget({required this.cartItem});

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  late Future<ProductShoeModel?> _productData;

  @override
  void initState() {
    super.initState();
    _productData = ProductShoeRepository().getById('${widget.cartItem.prodId}');
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: FutureBuilder<ProductShoeModel?>(
                future: _productData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    final product = snapshot.data!;
                    var category = product.cateId![0];
                    var audience = product.audiId![0];
                    final prod = product;
                    var prodName = category.name;
                    double? prodPrice = prod.price?.toDouble();
                    var prodDetails = prod.details;
                    var prodImage = prod.image;

                    return Image.network(
                      prodImage ?? '',
                      width: 80.0,
                      height: 80.0,
                      fit: BoxFit.cover,
                    );
                  } else if (snapshot.hasError) {
                    return Text(
                      'Error: ${snapshot.error}',
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return Text('Loading...');
                  }
                },
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder<ProductShoeModel?>(
                    future: _productData,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasData) {
                        final product = snapshot.data!;
                        var category = product.cateId![0];
                        var audience = product.audiId![0];
                        final prod = product;
                        var prodName = category.name;
                        double? prodPrice = prod.price?.toDouble();
                        var prodDetails = prod.details;
                        var prodImage = prod.image;
                        var quantity = widget.cartItem.numPieces;
                        var total = prodPrice! * quantity!;

                        totalPrice += total;

                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) {
                                return ItemEditPage(itemId: product.id ?? '');
                              }),
                            );
                          },
                          child: Column(
                            children: [
                              Text(
                                category.name ?? '',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                '\$${(total).toString()}',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            ],
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text(
                          'Error: ${snapshot.error}',
                          style: TextStyle(color: Colors.red),
                        );
                      } else {
                        return Text('Loading...');
                      }
                    },
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Quantity: ${widget.cartItem.numPieces}',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Implement the remove item functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}
