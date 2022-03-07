import 'package:exam/test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      initialRoute: '/',
      routes: {
        '/main': (context) => NavigationDrawer(),
        '/settings': (context) => FourthScreen(),
      },
    );
  }

  NavigationDrawer() {}

  FourthScreen() {}
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _secureText = true;

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _loginController = TextEditingController();

  var _passwordError;
  var _loginError;

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Авторизация',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 56,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _loginController,
                        decoration: InputDecoration(
                            hintText: "+7",
                            labelText: "Номер телефона",
                            //errorText: _loginError,
                            labelStyle:
                                TextStyle(fontSize: 16, color: Colors.black),
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                            hintText: "Password",
                            labelText: "Пароль",
                            errorText: _passwordError,
                            labelStyle:
                                TextStyle(fontSize: 16, color: Colors.black),
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(_secureText
                                  ? Icons.remove_red_eye
                                  : Icons.security),
                              onPressed: () {
                                setState(() {
                                  _secureText = !_secureText;
                                });
                              },
                            )),
                        obscureText: _secureText,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  )),
              SizedBox(
                width: 154,
                height: 42,
                child: ElevatedButton(
                  onPressed: () {
                    print("Password : " + _passwordController.text);
                    setState(() {
                      if (_passwordController.text == 'Admin' &&
                          _loginController.text == '+79097777777') {
                        Navigator.pushNamed(context, '/main');
                        _passwordError = null;
                        _loginError = null;
                      } else {
                        _passwordError = "Неверный логин или пароль";
                        _loginError = 'Неверный логин или пароль';
                      }
                    });
                  },
                  child: Text("Войти"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
