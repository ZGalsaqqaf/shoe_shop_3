import 'package:flutter/material.dart';
import 'package:shoe_shop_3/pages/category_files/product_images.dart';
import 'package:shoe_shop_3/reops/product_repo.dart';
import 'package:shoe_shop_3/widgets/custom_item_slider_api.dart';

import '../../models/product_model.dart';
import '../../myclasses/choose_color_product.dart';
import '../helper/auth_helper.dart';
import 'login2.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key, required this.itemId});
  final String itemId;

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedColor;
  Color _labelColor = Colors.black;

  int _size = 5;
  final int _minSize = 5;
  final int _maxSize = 55;

  int _piecesNumber = 1;

  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text('Shopping Cart'),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: FutureBuilder<ProductShoeModel?>(
            future: ProductShoeRepository().getById(
                widget.itemId), // Fetch thisProduct details based on ID
            builder: (context, snapshot) {
              // if (snapshot.connectionState == ConnectionState.waiting) {
              //   return Center(child: CircularProgressIndicator());
              // } else
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                ProductShoeModel thisProduct = snapshot.data!;
                var category = thisProduct.cateId![0];
                var audience = thisProduct.audiId![0];
                final prod = thisProduct;
                var prodName = category.name;
                double? prodPrice = prod.price?.toDouble();
                var prodDetails = prod.details;
                var prodImage = prod.image;
                List<String> allImages = [];
                allImages.add(prodImage ?? '');
                return ListView(
                  children: [
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomItemSliderApi(
                            value: widget.itemId,
                            productImage: prodImage ?? '',
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            '$prodName for ${audience.name}',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            '$prodDetails',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            '\$${prodPrice.toString()}',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          SizedBox(height: 16.0),
                          Divider(),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    labelText: 'Color',
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        color: _labelColor,
                                        width: 2,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                        color: _labelColor,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: _labelColor,
                                      ),
                                    ),
                                    labelStyle: TextStyle(
                                      color:
                                          _labelColor, // Set the label color dynamically
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  value: _selectedColor,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedColor = newValue!;
                                      _labelColor = getColorFromName(
                                          newValue); // Update the label color
                                    });
                                  },
                                  items: colors.map((color) {
                                    return DropdownMenuItem<String>(
                                      value: color,
                                      child: Text(color),
                                    );
                                  }).toList(),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select a color';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 16.0),
                                TextFormField(
                                  // initialValue: _size.toString(),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: 'Size',
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a size';
                                    }
                                    final intSize = int.tryParse(value);
                                    if (intSize == null ||
                                        intSize < _minSize ||
                                        intSize > _maxSize) {
                                      return 'Size must be between $_minSize and $_maxSize';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      _size = int.tryParse(value) ?? _size;
                                    });
                                  },
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Number of Pieces: $_piecesNumber',
                                      style:
                                          Theme.of(context).textTheme.headline1,
                                    ),
                                    SizedBox(width: 16.0),
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () {
                                        setState(() {
                                          _piecesNumber--;
                                        });
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          _piecesNumber++;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16.0),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (AuthenticationProvider
                                        .isLoggedIn.value) {
                                      // User is logged in, allow adding to cart
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        _formKey.currentState?.save();

                                        print('Form is valid');
                                        print(
                                            'Selected Color: $_selectedColor');
                                        print('Selected Size: $_size');
                                        print(
                                            'Amount of Pieces: $_piecesNumber');

                                        _showSnackBar(context);
                                      }
                                    } else {
                                      // User is not logged in, show alert to go and login first
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Login Required'),
                                            content: Text(
                                                'Please login first to add items to the cart.'),
                                            actions: <Widget>[
                                              TextButton(
                                                child: Text('Cancel'),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(); // Close the dialog
                                                },
                                              ),
                                              TextButton(
                                                child: Text('OK'),
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                      return LoginPage2(
                                                        email: "",
                                                        password: "",
                                                        redirectPage: 'pop',
                                                      );
                                                    }),
                                                  ).then((_) {
                                                    setState(() {
                                                      // Refresh the user account page here
                                                    });
                                                  });
                                                  // Redirect to the login page or perform any other action
                                                  // to handle the login process.
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                  child: Text(
                                    'Add to Cart',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ),
                                // ElevatedButton(
                                //   style: ButtonStyle(
                                //     backgroundColor:
                                //         MaterialStateProperty.all<Color>(
                                //       Theme.of(context).colorScheme.primary,
                                //     ),
                                //   ),
                                //   onPressed: () {
                                //     if (_formKey.currentState?.validate() ??
                                //         false) {
                                //       _formKey.currentState?.save();

                                //       print('Form is valid');
                                //       print('Selected Color: $_selectedColor');
                                //       print('Selected Size: $_size');
                                //       print('Amount of Pieces: $_piecesNumber');

                                //       _showSnackBar(context);
                                //     }
                                //   },
                                //   child: Text(
                                //     'Add to Cart',
                                //     style:
                                //         Theme.of(context).textTheme.bodyText2,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Text('No thisProduct found');
              }
            },
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(
        'Item added to cart',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      duration: Duration(seconds: 2),
      backgroundColor: Theme.of(context)
          .colorScheme
          .primary, // Set the background color to blue
      action: SnackBarAction(
        label: 'Undo',
        textColor: Colors.white,
        onPressed: () {
          // Perform undo action here
        },
      ),
      elevation: 8.0, // Set the elevation to make the SnackBar floating
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
