import 'package:e_learning_app/core/provider/auth_provider.dart';
import 'package:e_learning_app/core/utils/constants.dart';
import 'package:e_learning_app/helper/navigator_helper.dart';
import 'package:e_learning_app/screens/register_screen.dart';
import 'package:e_learning_app/screens/template/main_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 50),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Image.network(
                      "https://cdn.discordapp.com/attachments/1008921423915532368/1035751439001210880/undraw_Teaching_re_g7e3-removebg-preview.png",
                      fit: BoxFit.contain,
                      height: 300.0,
                      width: 300.0,
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
                          controller: emailController,
                          style: TextStyle(fontSize: 12),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            hintText: "Masukkan Email",
                            prefixIcon: Icon(
                              PhosphorIcons.userCircleBold,
                              size: 30,
                              color: Colors.grey.shade400,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7.0),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade400, width: 2.0)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7.0),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade400, width: 2.0)),
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: passwordController,
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
                              color: Colors.grey.shade400,
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
                                  color: Colors.grey.shade400,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7.0),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade400, width: 2.0)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7.0),
                                borderSide: BorderSide(
                                    color: Colors.grey.shade400, width: 2.0)),
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Consumer<AuthProvider>(builder: (context, authProv, _) {
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: EdgeInsets.symmetric(horizontal: 60).horizontal,
                      child: TextButton(
                        onPressed: () {
                          Map<String, dynamic> requestBody = {
                            'email': emailController.text,
                            'password': passwordController.text
                          };

                          authProv.login(requestBody);
                        },
                        child: authProv.isLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                    color: Colors.white),
                              )
                            : Text(
                                "Masuk",
                                style: TextStyle(color: Colors.white),
                              ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.all(10),
                          backgroundColor: kpink,
                        ),
                      ),
                    ),
                  );
                }),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Lupa Password?",
                      style: TextStyle(color: Colors.black, fontSize: 9),
                    ),
                  ),
                ),
                Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (RegisterScreeen())));
                    },
                    child: Text(
                      "Daftar",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
