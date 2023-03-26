import 'package:flutter/material.dart';

import 'tourism_data.dart';
import 'list_page.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text("Tourism Destination")
        ),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: const Icon(Icons.exit_to_app_sharp)),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Icon(Icons.beach_access_rounded, color: Colors.teal,size: 200,),
                const SizedBox(height: 100),
                //username
                username(),
                const SizedBox(height: 10),
                password(),
                const SizedBox(height: 15),
                login(),
                const SizedBox(height: 15),
                TextButton(
                    onPressed: (){

                    },
                    child: Text('Lupa Password?'))
              ],
            ),
          ),

        ),
      ),
    );
  }

  Widget username() {
    return
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextFormField(
          decoration: InputDecoration(
              icon: Icon(Icons.person),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(15)
              ),
              fillColor: Colors.grey.shade200,
              filled: true,
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.grey[700]),
              hintText: "Masukkan Email",
              hintStyle: TextStyle(color: Colors.grey[500])
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your username';
            }
            return null;
          },
          onSaved: (value) {
            _username = value!;
          },

        ),
      );
  }

  Widget password() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
            icon: Icon(Icons.lock),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20)
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(15)
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            labelText: 'Password',
            labelStyle: TextStyle(color: Colors.grey[700]),
            hintText: "Masukkan Password",
            hintStyle: TextStyle(color: Colors.grey[500])
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your password';
          }
          return null;
        },
        onSaved: (value) {
          _password = value!;
        },
      ),
    );
  }

  Widget login() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        onPressed: _submit,
        child: Text('Login'),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Check if the username and password are correct
      if (_username == 'admin' && _password == 'password') {
        // Navigate to the home page
        Navigator.pushReplacementNamed(
            context,
            '/list',
            arguments: {'username': _username}
        );
      } else {
        // Show an error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid username or password')),
        );
      }
    }
  }
}