import 'package:e_learning_app/constants.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:e_learning_app/screens/login_screen.dart';
import 'package:e_learning_app/screens/template/main_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class RegisterScreeen extends StatefulWidget {
  const RegisterScreeen({Key? key}) : super(key: key);

  @override
  State<RegisterScreeen> createState() => _RegisterScreeenState();
}

class _RegisterScreeenState extends State<RegisterScreeen> {
  bool _isObscure = true;
  String dropdownValue = 'Daftar sebagai';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.symmetric(vertical: 50),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Image.network(
                    "https://cdn.discordapp.com/attachments/1008921423915532368/1035754167509200936/undraw_Bookshelves_re_lxoy-removebg-preview.png",
                    fit: BoxFit.contain,
                    height: 250.0,
                    width: 250.0,
                  )),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        style: TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          hintText: "Masukkan Nama",
                          prefixIcon: Icon(
                            PhosphorIcons.userCircleBold,
                            size: 30,
                            color: kpink,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7.0),
                              borderSide: BorderSide(color: kpink, width: 2.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7.0),
                              borderSide: BorderSide(color: kpink, width: 2.0)),
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        style: TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          hintText: "Masukkan Email",
                          prefixIcon: Icon(
                            PhosphorIcons.envelope,
                            size: 30,
                            color: kpink,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7.0),
                              borderSide: BorderSide(color: kpink, width: 2.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7.0),
                              borderSide: BorderSide(color: kpink, width: 2.0)),
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        style: TextStyle(fontSize: 12),
                        obscureText: _isObscure,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          hintText: "Masukkan Password",
                          prefixIcon: Icon(
                            PhosphorIcons.lockBold,
                            size: 30,
                            color: kpink,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: kpink,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7.0),
                              borderSide: BorderSide(color: kpink, width: 2.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7.0),
                              borderSide: BorderSide(color: kpink, width: 2.0)),
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        style: TextStyle(fontSize: 12),
                        obscureText: _isObscure,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          hintText: "Konfirmasi Password",
                          prefixIcon: Icon(
                            PhosphorIcons.lockBold,
                            size: 30,
                            color: kpink,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: kpink,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7.0),
                              borderSide: BorderSide(color: kpink, width: 2.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7.0),
                              borderSide: BorderSide(color: kpink, width: 2.0)),
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.only(bottom: 15),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    border: Border.all(color: kpink, width: 2.0),
                  ),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 12,
                    iconEnabledColor: kpink,
                    elevation: 0,
                    hint: Text("Daftar sebagai"),
                    style: TextStyle(color: Colors.black),
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['Daftar sebagai', 'Siswa', 'Guru']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 11),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: EdgeInsets.symmetric(horizontal: 60).horizontal,
                  child: TextButton(
                    onPressed: () {
                      goPush(MainTemplate(), context);
                    },
                    child: Text(
                      "Daftar",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(10),
                      backgroundColor: kpink,
                    ),
                  ),
                ),
              ),
              Container(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (LoginScreen())));
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
