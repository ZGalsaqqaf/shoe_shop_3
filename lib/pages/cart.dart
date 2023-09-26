import 'package:flutter/material.dart';

import '../widgets/custom_drawer_app_mode.dart';
import '../widgets/search_appbar.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<CartItem> cartItems = [
    CartItem(
      image: 'assets/images/women/heels/wh3.jpg',
      name: 'High Heels Shoes',
      price: 49.99,
      quantity: 1,
    ),
    CartItem(
      image: 'assets/images/women/sneakers/wsk3.jpg',
      name: 'Casual Sneakers',
      price: 39.99,
      quantity: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    IconData appModeIcon = Icons.sunny;

    void updateAppModeIcon(IconData newIcon) {
      setState(() {
        appModeIcon = newIcon;
      });
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: SearchAppBar(context),
      drawer: CustomDrawerWithAppMode(context, updateAppModeIcon),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (BuildContext context, int index) {
          return CartItemWidget(cartItem: cartItems[index]);
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        color: Theme.of(context).colorScheme.secondary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: \$${_calculateTotal().toStringAsFixed(2)}',
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

  double _calculateTotal() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }
}

class CartItem {
  final String image;
  final String name;
  final double price;
  final int quantity;

  CartItem({
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
  });
}

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              cartItem.image,
              width: 80.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.name,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '\$${cartItem.price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Quantity: ${cartItem.quantity}',
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