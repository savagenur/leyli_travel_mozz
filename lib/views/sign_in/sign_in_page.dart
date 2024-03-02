import 'package:flutter/material.dart';
import 'package:leyli_travel_mozz/app/dimension/design_dimension.dart';
import 'package:leyli_travel_mozz/app/theme/app_text_theme/app_text_theme.dart';
import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';
import 'package:leyli_travel_mozz/core/widgets/appbar/adaptive_app_bar.dart';
import 'package:leyli_travel_mozz/core/widgets/button/primary_button.dart';
import 'package:leyli_travel_mozz/core/widgets/input/text/primary_text_form_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdaptiveAppBar(
        text: "Вход",
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.message_outlined,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: DDimens.biggerPadding.all,
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  buildHeaderTitle(),
                  DDimens.doubleLargePadding.verticalBox,
                  buildNameTextField(),
                  DDimens.largePadding.verticalBox,
                  buildPasswordTextField(),
                  DDimens.largePadding.verticalBox,
                  buildForgotPassword()
                ],
              ),
            ),
            if (MediaQuery.of(context).viewInsets.bottom == 0)
              Expanded(
                child: buildBtns(),
              )
          ],
        ),
      ),
    );
  }

  GestureDetector buildForgotPassword() {
    return GestureDetector(
      onTap: () {},
      child: Text(
        "Забыли пароль?",
        style: context.textTheme.titleMedium!.copyWith(
          decoration: TextDecoration.underline,
          decorationColor: context.colors.primaryGreen,
          color: context.colors.primaryGreen,
        ),
      ),
    );
  }

  PrimaryTextFormField buildPasswordTextField() {
    return PrimaryTextFormField(
      labelText: "Пароль",
      hintText: "Введите пароль",
      obscureText: true,
    );
  }

  PrimaryTextFormField buildNameTextField() {
    return PrimaryTextFormField(
      labelText: "Имя",
      hintText: "Введите имя",
    );
  }

  Text buildHeaderTitle() {
    return Text(
      "Войдите или\nсоздайте аккаунт",
      textAlign: TextAlign.center,
      style: context.textTheme.titleMediumPlus,
    );
  }

  Padding buildBtns() {
    return Padding(
      padding: DDimens.hugePadding.horizontal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PrimaryButton(
            text: "Войти",
            onTap: () {},
          ),
          DDimens.biggerPadding.verticalBox,
          PrimaryButton(
            backgroundColor: context.colors.white,
            foregroundColor: context.colors.primaryGreen,
            borderColor: context.colors.primaryGreen,
            borderWidth: 2,
            text: "Создать аккаунт",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
