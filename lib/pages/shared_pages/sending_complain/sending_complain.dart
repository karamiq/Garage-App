import 'package:Trip/components/custom_app_bar.dart';
import 'package:Trip/components/custom_elevated_button.dart';
import 'package:Trip/components/custom_item_select.dart';
import 'package:Trip/components/custom_text_form_field.dart';
import 'package:Trip/model/DriverAppViolations/vehicle_violations.dart';
import 'package:Trip/model/MobileHomes/vehicle_debt_statement.dart';
import 'package:flutter/material.dart';
import '../../../config/constant.dart';
import '../../../services/dio_govs&cities.dart';

class SendingComplainPage extends StatefulWidget {
  const SendingComplainPage({Key? key}) : super(key: key);

  @override
  State<SendingComplainPage> createState() => _SendingComplainPageState();
}

class _SendingComplainPageState extends State<SendingComplainPage> {
  final complainTypeController = TextEditingController();
  TextEditingController complainController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int textLength = 0;
  void countTextLength(String query) {
    setState(() {
      textLength = query.length;
    });
  }

  String? validator(String? query) {
    if (query!.length > 100) {
      return 'يجب الا يتجاوز ١٠٠ حرف';
    }
    return validateInfo(query);
  }

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final bool isFromProfile = data['isFromProfile'];
    final Violation? debtStatementReceipt = data['violation'];
    void send() {
      if (_formKey.currentState!.validate()) {
        if (isFromProfile) {
          print('Its from profile');
        } else {
          print('Its not from profile');
        }
      }
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: isFromProfile ? 'تقديم شكوى ' : 'شكوى غرامية',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Insets.medium, vertical: Insets.medium),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isFromProfile)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'غرامة ${debtStatementReceipt!.number}#',
                      style: TextStyle(
                        fontSize: CustomFontsTheme.bigSize,
                      ),
                    ),
                    SizedBox(width: Insets.exSmall),
                    Text(
                      makeDate(debtStatementReceipt.creationDate),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              SizedBox(height: Insets.medium),
              if (!isFromProfile) Text('لقد حصلت على غرامة بسبب لايوجد'),
              if (!isFromProfile) SizedBox(height: Insets.medium),
              if (!isFromProfile)
                Text(
                  'قيمة الغرامة: ${debtStatementReceipt!.totalAmount}',
                  style: TextStyle(
                    fontSize: CustomFontsTheme.bigSize,
                  ),
                ),
              if (isFromProfile)
                CustomApiItemSelect(
                    labelText: 'أختر نوع الشكوى',
                    controller: complainTypeController,
                    itemListFuture: GovsService.gov(),
                    validator: validator),
              if (!isFromProfile) SizedBox(height: Insets.exLarge),
              if (isFromProfile) Gap(Insets.medium),
              CustomTextFormField(
                prefixIcon: Assets.assetsIconsNotePencil,
                onChanged: countTextLength,
                maxLines: 5,
                controller: complainController,
                labelText: 'الملاحظات',
                validator: validator,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '( $textLength / 100 )',
                    style: TextStyle(
                        color: textLength > 100
                            ? Theme.of(context).colorScheme.error
                            : null),
                  ),
                ],
              ),
              Spacer(),
              ElevatedButton(
                onPressed: send,
                child: ElevatedButtonChild(
                    text: 'أرسال الشكوى', icon: Assets.assetsIconsReciept3),
              ),
              SizedBox(height: Insets.medium),
            ],
          ),
        ),
      ),
    );
  }
}
