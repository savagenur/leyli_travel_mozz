import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leyli_travel_mozz/app/dimension/design_dimension.dart';
import 'package:leyli_travel_mozz/core/converters/card_formatter.dart';
import 'package:leyli_travel_mozz/core/extension/build_context_extension.dart';
import 'package:leyli_travel_mozz/core/widgets/appbar/adaptive_app_bar.dart';
import 'package:leyli_travel_mozz/core/widgets/button/primary_button.dart';
import 'package:leyli_travel_mozz/core/widgets/colored_box/main_colored_box.dart';
import 'package:leyli_travel_mozz/core/widgets/input/text/primary_text_form_field.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdaptiveAppBar(
        text: "Оплата",
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.message_outlined,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: DDimens.biggerPadding.all,
        child: Column(
          children: [
            buildCardBox(),
            DDimens.biggerPadding.verticalBox,
            buildRememberCard(),
            DDimens.biggerPadding.verticalBox,
            buildReceiptBox(),
            DDimens.doubleHugePadding.verticalBox,
            buildPayBtn()
          ],
        ),
      ),
    );
  }

  PrimaryButton buildPayBtn() {
    return PrimaryButton(
      margin: DDimens.largePadding.horizontal,
      text: "Оплатить (1 642 846 тнг.)",
      onTap: () {},
    );
  }

  MainColoredBox buildReceiptBox() {
    return MainColoredBox(
      child: Column(
        children: [
          DDimens.bigPadding.verticalBox,
          buildReceiptTitle(),
          const Divider(),
          buildEmailTextField(),
          DDimens.bigPadding.verticalBox,
        ],
      ),
    );
  }

  Padding buildEmailTextField() {
    return Padding(
      padding: DDimens.bigPadding.all,
      child: PrimaryTextFormField(
        isFilled: false,
        labelText: "Адрес эл. почты",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: "Введите адрес эл. почты",
        suffixIcon: Icon(
          Icons.calendar_month_outlined,
          color: context.colors.gray20,
        ),
      ),
    );
  }

  Padding buildReceiptTitle() {
    return Padding(
      padding: DDimens.bigPadding.horizontal,
      child: Row(
        children: [
          Icon(
            Icons.list_alt_outlined,
            color: context.colors.gray20,
          ),
          DDimens.bigPadding.horizontalBox,
          Text("Получить квитанцию (Не обязательно) ")
        ],
      ),
    );
  }

  ListTile buildRememberCard() {
    return ListTile(
      tileColor: context.colors.gray80,
      title: Text("Запомнить карту"),
      trailing: Switch(
        value: true,
        onChanged: (value) {},
      ),
    );
  }

  MainColoredBox buildCardBox() {
    return MainColoredBox(
      child: Column(
        children: [
          DDimens.bigPadding.verticalBox,
          buildCardTitle(),
          const Divider(),
          DDimens.bigPadding.verticalBox,
          buildTextFields(),
          DDimens.biggerPadding.verticalBox,
        ],
      ),
    );
  }

  Padding buildTextFields() {
    return Padding(
      padding: DDimens.bigPadding.horizontal,
      child: Column(
        children: [
          buildCardTextField(),
          DDimens.largePadding.verticalBox,
          Row(
            children: [
              Expanded(child: buildMMYYTextField()),
              DDimens.bigPadding.horizontalBox,
              Expanded(
                child: buildCVCTextField(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  PrimaryTextFormField buildCVCTextField() {
    return PrimaryTextFormField(
      isFilled: false,
      textInputType: TextInputType.number,
      labelText: "CVC",
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintText: "---",
      inputFormatters: [
        LengthLimitingTextInputFormatter(3),
      ],
      suffixIcon: Icon(
        Icons.calendar_month_outlined,
        color: context.colors.gray20,
      ),
    );
  }

  PrimaryTextFormField buildMMYYTextField() {
    return PrimaryTextFormField(
      isFilled: false,
      textInputType: TextInputType.number,
      labelText: "ММ/ГГ",
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintText: "--/--",
      inputFormatters: [
        LengthLimitingTextInputFormatter(4 + 1 * 1),
        CardMonthYearFormatter(separator: "/"),
      ],
      suffixIcon: Icon(
        Icons.calendar_month_outlined,
        color: context.colors.gray20,
      ),
    );
  }

  PrimaryTextFormField buildCardTextField() {
    return PrimaryTextFormField(
      isFilled: false,
      textInputType: TextInputType.number,
      textAlign: TextAlign.center,
      labelText: "Номер карты",
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintText: "----  ----  ----  ----",
      inputFormatters: [
        /// allows card number length of 18 and 4 separators
        LengthLimitingTextInputFormatter(16 + 3 * 3),
        CardFormatter(separator: ' - '),
      ],
      suffixIcon: Icon(
        Icons.calendar_month_outlined,
        color: context.colors.gray20,
      ),
    );
  }

  Padding buildCardTitle() {
    return Padding(
      padding: DDimens.bigPadding.horizontal,
      child: Row(
        children: [
          Icon(
            Icons.payment_outlined,
            color: context.colors.gray20,
          ),
          DDimens.bigPadding.horizontalBox,
          Text("К оплате - 1 642 846 тнг.")
        ],
      ),
    );
  }
}
