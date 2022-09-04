import 'package:connance_app/utils/consts/color_consts.dart';
import 'package:connance_app/utils/routes/navigator_app.dart';
import 'package:connance_app/widgets/patterns/background_1.dart';
import 'package:flutter/material.dart';

import '../../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final _formKey = GlobalKey<FormState>();
    final AuthController authController = AuthController();

    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: height * .5,
              width: width,
              child: Stack(
                children: <Widget>[
                  const Background1(),
                  Padding(
                    padding: const EdgeInsets.only(top: 180, left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Bem-vindo!',
                          style: TextStyle(
                              color: ColorConsts().accentGreen,
                              fontSize: 30,
                              fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Entre para continuar',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 70,
                      child: TextFormField(
                        controller: email,
                        validator: (em) {
                          if (em == null || em.isEmpty) {
                            return 'Por favor, digite seu e-mail.';
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(email.text)) {
                            return 'Por favor, digite um e-mail correto.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Endereço de e-mail',
                          labelStyle:
                              TextStyle(color: ColorConsts().accentGreen),
                          enabled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: ColorConsts().accentGreen, width: 1.5),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: ColorConsts().accentGreen, width: 1.5),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 70,
                      child: TextFormField(
                        validator: (pass) {
                          if (pass == null || pass.length < 6) {
                            return "A senha precisa ter pelo menos 6  caractres";
                          }
                        },
                        obscureText: true,
                        controller: password,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          labelStyle:
                              TextStyle(color: ColorConsts().accentGreen),
                          enabled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: ColorConsts().accentGreen, width: 1.5),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: ColorConsts().accentGreen, width: 1.5),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 60,
                      width: 500,
                      child: ElevatedButton(
                        onPressed: () async {
                          FocusScopeNode currentFocus = FocusScope.of(context);

                          if (_formKey.currentState!.validate()) {
                            bool logged = await authController.login(
                                email.text, password.text);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            if (logged) {
                              // ignore: use_build_context_synchronously
                              NavigatorApp().goToHomePage(context);
                            } else {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          }
                        },
                        child: const Text('Login'),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            NavigatorApp().goToRegister(context);
                          },
                          child: const Text(
                            'Criar conta',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Esqueci a senha',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final snackBar = const SnackBar(
    content: Text(
      'Email ou senha inválidos.',
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.redAccent,
  );
}
