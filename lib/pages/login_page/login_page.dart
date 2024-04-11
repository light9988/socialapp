import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xhs/pages/home_page/home_page.dart';
import 'package:logger/logger.dart';
// import 'package:mongo_dart/mongo_dart.dart';

final logger = Logger();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool agreed = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login() async {
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text;
      String password = _passwordController.text;

      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      try {
        logger.i('Querying Firestore for user: $username');
        QuerySnapshot result = await firestore
            .collection('users')
            .where('username', isEqualTo: username)
            .get();

        if (result.docs.isNotEmpty) {
          String? savedPassword =
              (result.docs.first.data() as Map<String, dynamic>)['password'];
          if (savedPassword != null && password == savedPassword) {
            logger.i('Login successful. Redirecting to home page.');
            Get.off(HomePage());
          } else {
            logger.i('Password is not correct.');
            showErrorDialog('Password is not correct');
          }
        } else {
          logger.i('Username not found. Registering new user...');
          await firestore.collection('users').add({
            'username': username,
            'password': password,
          });
          logger.i('New user registered. Redirecting to home page.');
          Get.off(HomePage());
        }
      } catch (e) {
        logger.i('An error occurred: $e');
        // showErrorDialog('An error occurred. Please try again.');
        Get.off(HomePage()); // need to solve firebase issue
      }
    }
  }

  // Future<void> login() async {
  //   if (_formKey.currentState!.validate()) {
  //     String username = _usernameController.text;
  //     String password = _passwordController.text;

  //     // Connect to MongoDB database
  //     final db = Db('mongodb://localhost:27017/demo');
  //     await db.open();

  //     final usersCollection = db.collection('flutter_users');

  //     try {
  //       var result = await usersCollection
  //           .find(where.eq('username', username))
  //           .toList();

  //       if (result.isNotEmpty) {
  //         String? savedPassword = result.first['password'];
  //         if (savedPassword == password) {
  //           logger.i('Login successful. Redirecting to home page.');
  //           Get.off(HomePage());
  //         } else {
  //           logger.i('Password is not correct.');
  //           showErrorDialog('Password is incorrect');
  //         }
  //       } else {
  //         logger.i('Username not found. Registering new user...');
  //         await usersCollection.insert({'username': username, 'password': password});
  //         logger.i('New user registered. Redirecting to home page.');
  //         Get.off(HomePage());
  //       }
  //     } catch (e) {
  //       logger.i('An error occurred: $e');
  //       showErrorDialog('An error occurred: $e');
  //     } finally {
  //       await db.close();
  //     }
  //   }
  // }

  void showErrorDialog(String errorMessage) {
    showDialog(
      context: Get.overlayContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Little Red Book',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Your Life Guide',
                    style: TextStyle(
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 227, 222, 222),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 227, 222, 222),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: Size(200, 50),
                    ),
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'New user can sign up and log in automatically.\n',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            agreed = !agreed;
                          });
                        },
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: agreed ? Colors.red : Colors.white,
                            border: Border.all(
                              color: agreed ? Colors.red : Colors.black,
                            ),
                          ),
                          child: Icon(
                            Icons.check,
                            size: 5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 7),
                      Text(
                        'I have read and agree to user agreement and data privacy rule.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
