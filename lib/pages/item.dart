import 'package:flutter/material.dart';
import 'package:shoe_shop_3/widgets/custom_carousel_slider.dart';
import 'package:shoe_shop_3/widgets/item_slider.dart';

class ItemPage extends StatefulWidget {
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedColor;
  Color _labelColor = Colors.black;

  int _size = 5;
  final int _minSize = 5;
  final int _maxSize = 50;

  List<String> _colors = [
    'Red',
    'Blue',
    'Green',
    'Yellow',
    'Black',
    'White',
  ];

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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Builder(
              builder: (context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ItemSlider(context),
                    SizedBox(height: 16.0),
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
                                _labelColor = _getColorFromName(
                                    newValue); // Update the label color
                              });
                            },
                            items: _colors.map((color) {
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
                          Row(
                            children: [
                              Text(
                                'Size: $_size',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              SizedBox(width: 16.0),
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    if (_size > _minSize) {
                                      _size--;
                                    }
                                  });
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    if (_size < _maxSize) {
                                      _size++;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                _formKey.currentState?.save();

                                print('Form is valid');
                                print('Selected Color: $_selectedColor');
                                print('Selected Size: $_size');

                                _showSnackBar(context);
                              }
                            },
                            child: Text('Add to Cart',
                            style: Theme.of(context).textTheme.bodyText2,),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Color _getColorFromName(String colorName) {
    switch (colorName) {
      case 'Red':
        return Colors.red;
      case 'Blue':
        return Colors.blue;
      case 'Green':
        return Colors.green;
      case 'Yellow':
        return Colors.yellow;
      case 'Black':
        return Colors.black;
      case 'White':
        return Colors.white;
      default:
        return Colors.black;
    }
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
