import 'package:connance_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import '../../utils/consts/color_consts.dart';
import '../../utils/routes/navigator_app.dart';
import '../../widgets/patterns/background_1.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final _formKey = GlobalKey<FormState>();
    final AuthController authController = AuthController();

    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    final TextEditingController confirmPassword = TextEditingController();
    final TextEditingController phoneNumber = TextEditingController();

    SnackBar showSnack(String text) {
      return const SnackBar(
        content: Text(
          'Email ou senha inválidos.',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (_formKey.currentState!.validate()) {
            bool logged = await authController.login(email.text, password.text);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
            bool created =
                await authController.createAccount(email.text, password.text);
            if (created) {
              // ignore: use_build_context_synchronously
              NavigatorApp().goToHomePage(context);
            } else {
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context)
                  .showSnackBar(showSnack('Não foi possível criar uma conta'));
            }
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(showSnack('As senhas precisam ser iguais'));
          }
        },
        backgroundColor: ColorConsts().darkGreen,
        child: const Icon(Icons.arrow_circle_right),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: height * .3,
              width: width,
              child: Stack(
                children: <Widget>[
                  const Background1(),
                  Padding(
                    padding: const EdgeInsets.only(top: 100, left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Crie sua conta',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextButton(
                          onPressed: () {
                            NavigatorApp().goToLogin(context);
                          },
                          child: const Text(
                            'Já tenho conta',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
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
                        controller: email,
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
                      height: 10,
                    ),
                    SizedBox(
                      height: 70,
                      child: TextFormField(
                        validator: (pass) {
                          if (pass == null || pass.length < 6) {
                            return "A senha precisa ter pelo menos 6  caracteres";
                          } else if (pass != confirmPassword.text) {
                            return "As senhas precisam ser iguais";
                          }
                        },
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
                      height: 10,
                    ),
                    SizedBox(
                      height: 70,
                      child: TextFormField(
                        validator: (pass) {
                          if (pass == null || pass.length < 6) {
                            return "A senha precisa ter pelo menos 6  caracteres";
                          } else if (pass != password.text) {
                            return "As senhas precisam ser iguais";
                          }
                        },
                        controller: confirmPassword,
                        decoration: InputDecoration(
                          labelText: 'Confirmar senha',
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
                      height: 10,
                    ),
                    SizedBox(
                      height: 70,
                      child: TextFormField(
                        controller: phoneNumber,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Telefone',
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
