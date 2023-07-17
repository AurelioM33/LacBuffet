import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lac_buffet/scr/config/custom_colors.dart';
import 'package:lac_buffet/scr/pages/auth/controller/auth_controller.dart';
import 'package:lac_buffet/scr/pages/auth/view/components/forgot_password_dialog.dart';
import 'package:lac_buffet/scr/pages/common_widgets/app_name_widget.dart';
import 'package:lac_buffet/scr/pages_routes/app_pages.dart';
import 'package:lac_buffet/scr/services/utils_services.dart';
import 'package:lac_buffet/scr/services/validators.dart';
import '../../common_widgets/custom_text_field.dart';

class SingInScreen extends StatelessWidget {
  SingInScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  //Controlador de campos

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Nome do App

                  AppNameWidget(
                    lacTitleColor: Colors.white,
                    textsize: 40,
                  ),

                  //Categorias
                  SizedBox(
                    height: 30,
                    child: DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 25,
                      ),
                      child: AnimatedTextKit(
                        pause: Duration.zero,
                        repeatForever: true,
                        animatedTexts: [
                          FadeAnimatedText(
                            'Bolos',
                          ),
                          FadeAnimatedText(
                            'Doces',
                          ),
                          FadeAnimatedText(
                            'Bolos De Pote',
                          ),
                          FadeAnimatedText(
                            'Copos Felicidade',
                          ),
                          FadeAnimatedText(
                            'Salgados',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),

              //Formulario

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 40,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //Email
                      CustomTextField(
                        controller: emailController,
                        icon: Icons.email,
                        label: 'Email',
                        validator: emailValidator,
                      ),

                      //senha

                      CustomTextField(
                        controller: passwordController,
                        icon: Icons.lock,
                        label: 'Senha',
                        isSecret: true,
                        validator: passwordValidator,
                      ),

                      //Entrar

                      SizedBox(
                        height: 50,
                        child: GetX<AuthController>(
                          builder: (authcontroller) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              onPressed: authcontroller.isLoading.value
                                  ? null
                                  : () {
                                      FocusScope.of(context).unfocus();

                                      if (_formKey.currentState!.validate()) {
                                        String email = emailController.text;
                                        String password =
                                            passwordController.text;

                                        authcontroller.signIn(
                                          email: email,
                                          password: password,
                                        );
                                      }
                                    },
                              child: authcontroller.isLoading.value
                                  ? CircularProgressIndicator()
                                  : Text(
                                      'Entrar',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                            );
                          },
                        ),
                      ),

                      //Esqueceu a Senha

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () async {
                            final bool? result = await showDialog(
                                context: context,
                                builder: (_) {
                                  return ForgotPasswordDialog(
                                    email: emailController.text,
                                  );
                                });
                            if (result ?? false) {
                              utilsServices.showToast(
                                message:
                                    'Um link de recuperação ja foi enviado para seu email.',
                              );
                            }
                          },
                          child: const Text(
                            'Esqueceu a Senha?',
                            style: TextStyle(
                              color: Color.fromARGB(255, 207, 91, 83),
                            ),
                          ),
                        ),
                      ),

                      //Divisor

                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.black.withAlpha(90),
                                thickness: 2,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: const Text('ou'),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.black.withAlpha(90),
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                      ),

                      //Botao de Usuario

                      SizedBox(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            side: BorderSide(width: 2, color: Colors.black12),
                          ),
                          onPressed: () {
                            Get.toNamed(PagesRoutes.signUpRoute);
                          },
                          child: const Text('Criar Conta',
                              style: TextStyle(fontSize: 18)),
                        ),
                      )
                    ],
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
