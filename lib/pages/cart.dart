import 'package:flutter/material.dart';
import 'package:shoe_shop_3/helper/auth_helper.dart';
import 'package:shoe_shop_3/pages/item_edit.dart';
import 'package:shoe_shop_3/reops/cart_user_repo.dart';

import '../../widgets/custom_drawer_app_mode.dart';
import '../../widgets/search_appbar.dart';
import '../models/cart_user_model.dart';
import '../models/product_model.dart';
import '../reops/product_repo.dart';
import 'cart_delete.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  IconData appModeIcon = Icons.sunny;

  double totalPrice = 0;

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
                  setState(() {
                    totalPrice;
                  });
                },
                child: items.isEmpty
                    ? Center(child: Text("No Data"))
                    : ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return FutureBuilder<ProductShoeModel?>(
                            future: ProductShoeRepository()
                                .getById(items[index].prodId ?? ''),
                            builder: (context, snapshot) {
                              // if (snapshot.connectionState ==
                              //     ConnectionState.waiting) {
                              //   return CircularProgressIndicator();
                              // } else
                              if (snapshot.hasError) {
                                return Text(
                                    "Error: ${snapshot.error.toString()}");
                              } else if (snapshot.hasData) {
                                ProductShoeModel product = snapshot.data!;
                                var cate = product.cateId![0];
                                var audi = product.audiId![0];
                                var catName = cate.name;
                                var audName = audi.name;
                                var price = product.price;
                                var image = product.image;
                                var quantity = items[index].numPieces;
                                var total = price! * quantity!;

                                totalPrice = totalPrice + total;

                                return Card(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Image.network(
                                            image ?? '',
                                            width: 80.0,
                                            height: 80.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(width: 16.0),
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                      return ItemEditPage(
                                                          itemId:
                                                              product.id ?? '');
                                                    }),
                                                  );
                                                },
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      catName ?? '',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline1,
                                                    ),
                                                    SizedBox(height: 8.0),
                                                    Text(
                                                      '\$${total.toString()}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 8.0),
                                              Text(
                                                'Quantity: ${items[index].numPieces}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline2,
                                              ),
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete),
                                          onPressed: () async {
                                            await showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return CartDelete(
                                                    itemId:
                                                        items[index].id ?? '',
                                                  );
                                                }).then((_) {
                                              setState(() {});
                                            });
                                            // Implement the remove item functionality
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return SizedBox(); // Placeholder widget or loading indicator
                              }
                            },
                          );
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
              'Total: \$${totalPrice.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            ElevatedButton(
              onPressed: () {
                // Implement the checkout functionality
              },
              child: Text(
                'Checkout',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
