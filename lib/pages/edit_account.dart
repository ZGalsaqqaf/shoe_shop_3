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
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  UserRepository users = UserRepository();

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
              UserModel thisUser = snapshot.data!;
              var userId = thisUser.id;
              var userName = thisUser.username;
              var userEmail = thisUser.email;
              var userProfile = thisUser.profile;
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CircleAvatar(
                          radius: 50.0,
                          backgroundColor: Colors.black,
                          backgroundImage: userProfile!.isNotEmpty
                              ? MemoryImage(base64Decode(userProfile))
                                  as ImageProvider<Object>?
                              : AssetImage("assets/images/profiles/profile1.png"),
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
                        TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            labelText: 'Username',
                          ),
                        ),
                        SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () async {
                            String newUsername = _usernameController.text;

                            print('====${_imgController.text}');

                            UserModel user = UserModel(
                              username: _usernameController.text,
                              email: thisUser.email,
                              password: thisUser.password,
                              profile: _imgController.text,
                            );
                            try {
                              UserModel addedUser = await users.updateUser(
                                  thisUser.id ?? '', user);
                              print(
                                  'User updated successfully: ${addedUser.username}');
                              setState(() {
                                AuthenticationProvider.userName =
                                    _usernameController.text;
                                AuthenticationProvider.userProfile = _imgController.text;
                              });
                            } catch (e) {
                              print('Failed to update user: $e');
                            }

                            Navigator.of(context).pop();
                          },
                          child: Text('Save'),
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
    );
  }
}
