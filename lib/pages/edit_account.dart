import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../helper/auth_helper.dart';
import '../models/user_model.dart';
import '../reops/user_repo.dart';

class EditAccountPage extends StatefulWidget {
  final String userId;
  final String currentUsername;
  final String currentProfileImage;

  const EditAccountPage({
    Key? key,
    required this.userId,
    required this.currentUsername,
    required this.currentProfileImage,
  }) : super(key: key);

  @override
  _EditAccountPageState createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _creditCardController = TextEditingController();
  var _imgController = TextEditingController();

  var _selectedImageBytes;

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final imageBytes = await pickedImage.readAsBytes();
      final encodedImage = base64Encode(imageBytes);

      setState(() {
        _imgController.text = encodedImage;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _usernameController.text = widget.currentUsername;
    _imgController.text = widget.currentProfileImage;
    _creditCardController.text = AuthenticationProvider.userCreditCard ?? '';
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  UserRepository users = UserRepository();
  bool _isUserNameExist = false;
  bool _isCreditCardExist = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Account'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: FutureBuilder<UserModel?>(
          future: UserRepository().getById(widget.userId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              UserModel? thisUser = snapshot.data!;
              if (thisUser != null) {
                var userId = thisUser.id;
                var userName = thisUser.username;
                var userEmail = thisUser.email;
                var userProfile = thisUser.profile;
                return ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CircleAvatar(
                              radius: 100.0,
                              backgroundColor: Colors.black,
                              backgroundImage: _imgController.text != null &&
                                      _imgController.text.isNotEmpty
                                  ? MemoryImage(base64Decode(_imgController.text))
                                      as ImageProvider<Object>?
                                  : userProfile != null && userProfile.isNotEmpty
                                      ? MemoryImage(base64Decode(userProfile))
                                          as ImageProvider<Object>?
                                      : AssetImage(
                                          "assets/images/profiles/profile1.png"),
                            ),
                            SizedBox(height: 16.0),
                            ElevatedButton(
                              onPressed: _selectImage,
                              child: Text('Select Profile Picture'),
                            ),
                            SizedBox(height: 16.0),
                            TextFormField(
                              readOnly: true,
                              controller: _imgController,
                              decoration: InputDecoration(
                                hintText: 'Select profile picture',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                contentPadding: EdgeInsets.only(left: 60.0),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            TextFormField(
                              // key: _formKey,
                              controller: _usernameController,
                              decoration: InputDecoration(
                                labelText: 'Username',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Username can not be empty';
                                }
                                if (value.length < 3) {
                                  return 'Must be at least 3 characters';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16.0),
                            TextFormField(
                              controller: _creditCardController,
                              decoration: InputDecoration(
                                labelText: 'Credit Card',
                              ),
                            ),
                            SizedBox(height: 16.0),
                            ElevatedButton(
                              onPressed: () async {
                                String newUsername = _usernameController.text.trim();
                                String newCreditCard = _creditCardController.text.trim();
                      
                                print('====${_imgController.text}');
                                if (_formKey.currentState?.validate() ?? false) {
                                  bool isUserNameExist =
                                      await users.isValueExistsOnAnotherId(
                                          thisUser.id ?? '',
                                          'Username',
                                          _usernameController.text);
                                  bool isCreditCardExist =
                                      await users.isValueExistsOnAnotherId(
                                          thisUser.id ?? '',
                                          'CreditCard',
                                          _creditCardController.text);
                                  if (_isUserNameExist) {
                                    setState(() {
                                      _isUserNameExist = true;
                                    });
                                    return;
                                  }
                                  if (_isCreditCardExist) {
                                    setState(() {
                                      _isCreditCardExist = true;
                                    });
                                    return;
                                  }
                      
                                  UserModel user = UserModel(
                                    username: newUsername,
                                    email: thisUser.email,
                                    password: thisUser.password,
                                    profile: _imgController.text,
                                    creditCard: newCreditCard,
                                  );
                                  try {
                                    UserModel addedUser = await users.updateUser(
                                        thisUser.id ?? '', user);
                                    print(
                                        'User updated successfully: ${addedUser.username}');
                                    setState(() {
                                      AuthenticationProvider.userName =
                                          newUsername;
                                      AuthenticationProvider.userProfile =
                                          _imgController.text;
                                      _isUserNameExist = false;
                                      _isCreditCardExist = false;
                                    });
                                    Navigator.of(context).pop(true);
                                  } catch (e) {
                                    print('Failed to update user: $e');
                                  }
                                }else{
                                  print("Form is invalid");
                                }
                              },
                              child: Text('Save'),
                            ),
                            _isUserNameExist
                                ? Center(
                                    child: Text(
                                      "This Username Already Exists",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  )
                                : _isCreditCardExist
                                    ? Center(
                                        child: Text(
                                          "Email is Already Exists",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      )
                                    : Text(""),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Text("User is empty!");
              }
            } else {
              return Text('No User found');
            }
          },
        ),
      ),
    );
  }
}
