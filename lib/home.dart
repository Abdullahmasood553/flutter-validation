import 'package:flutter/material.dart';

class UserData {
  String? fname;
  String? lname;
  String? email;
  String? password;
  UserData({this.fname, this.lname, this.email, this.password});
}

class SignUpForm extends StatefulWidget {
  SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  validated(BuildContext context) {
  

      UserData user = new UserData(
        fname: firstNameController.text,
        lname: lastNameController.text,
        email: emailController.text,
        password: passwordController.text);


    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      print("Form Validated");
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomeScreen(user: user)));
    } else {
      print("Form Not Validated");
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up Form'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.sort),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Enter the first Name'),
                        controller: firstNameController,
                    validator: (String? value) {
                      if (value == null || value.trim().length == 0) {
                        return "Required";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Enter the Last Name'),
                        controller: lastNameController,
                    validator: (String? value) {
                      if (value == null || value.trim().length == 0) {
                        return "Required";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Enter the Email'),
                    controller: emailController,
                    validator: (String? value) {
                      if (value == null && value!.trim().length == 0) {
                        return "Field is required";
                      }
                      if (!RegExp(
                              r"^([a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?)$")
                          .hasMatch(value)) {
                        return "please Enter the valid email address";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Enter the Password'),
                        controller: passwordController,
                    obscureText: true,
                    validator: (String? value) {
                      if (value == null && value!.trim().length == 0) {
                        return "Field is required";
                      }
                      if (value.length <= 6) {
                        return "Password length should be > 6";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    validated(context);
                  },
                  child: Text('Sign Up'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}





class HomeScreen extends StatelessWidget {
  final UserData user;
  HomeScreen({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text("First Name: ${user.fname}"),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text("Last Name: ${user.lname}"),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text("Email: ${user.email}"),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text("Password: ${user.password}"),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Go Back"))
            ],
          ),
        ),
      ),
    );
  }
}