import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:py_chat/widgets/pickers/user_image_picker.dart';

class AuthForm extends StatefulWidget {
  AuthForm(
    this.submitFn,
    this.isLoading,
  );
  final bool isLoading;
  final void Function(
    String email,
    String username,
    File image,
    String password,
    bool isLogin,
  ) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  File _userImageFile;

  void _pickedImage(File image) {
    _userImageFile = image;
  }

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (_userImageFile == null && !_isLogin) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please upload an image.'),
        ),
      );
      return;
    }

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(
        _userEmail.trim(),
        _userName.trim(),
        _userImageFile,
        _userPassword.trim(),
        _isLogin,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image(
            image: AssetImage('images/Py.png'),
            width: 250.0,
          ),
        ),
        Center(
          child: Card(
            elevation: 20.0,
            shadowColor: _isLogin ? Colors.green.shade500 : Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            margin: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (!_isLogin) UserImagePicker(_pickedImage),
                      TextFormField(
                        key: ValueKey('email'),
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        validator: (value) {
                          if (value.isEmpty || !value.contains('@')) {
                            return 'Please enter valid email address.';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(labelText: 'Email address'),
                        onSaved: (value) {
                          _userEmail = value;
                        },
                      ),
                      if (!_isLogin)
                        TextFormField(
                          key: ValueKey('username'),
                          validator: (value) {
                            if (value.isEmpty || value.length < 4) {
                              return 'Please enter at least 4 characters.';
                            }
                            return null;
                          },
                          decoration: InputDecoration(labelText: 'Username'),
                          onSaved: (value) {
                            _userName = value;
                          },
                        ),
                      TextFormField(
                        key: ValueKey('password'),
                        validator: (value) {
                          if (value.isEmpty || value.length < 7) {
                            return 'Password must be at least 7 characters.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        onSaved: (value) {
                          _userPassword = value;
                        },
                      ),
                      SizedBox(height: 12),
                      if (widget.isLoading) CircularProgressIndicator(),
                      if (!widget.isLoading)
                        OutlinedButton(
                          onPressed: _trySubmit,
                          child: Text(_isLogin ? 'Log In' : 'Sign Up'),
                        ),
                      if (!widget.isLoading)
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.blue,
                          ),
                          onPressed: () {
                            setState(() {
                              _isLogin = !_isLogin;
                            });
                          },
                          child: Text(
                              _isLogin ? 'Create account' : 'have an account?'),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
