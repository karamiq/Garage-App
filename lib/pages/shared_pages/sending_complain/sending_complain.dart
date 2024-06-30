import 'package:Trip/components/custom_app_bar.dart';
import 'package:Trip/components/custom_elevated_button.dart';
import 'package:Trip/components/custom_item_select.dart';
import 'package:Trip/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import '../../../config/constant.dart';

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
    final String id = data['id'];
    final String feeNumber = data['feeNumber'];
    final String feeDate = data['feeDate'];
    final String feeReason = data['feeReason'];
    final String fee = data['fee'];
    final bool isFromProfile = data['isFromProfile'];

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
                      'غرامة $feeNumber#',
                      style: TextStyle(
                        fontSize: CustomFontsTheme.bigSize,
                      ),
                    ),
                    SizedBox(width: Insets.exSmall),
                    Text(
                      feeDate,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              SizedBox(height: Insets.medium),
              if (!isFromProfile) Text('لقد حصلت على غرامة بسبب $feeReason'),
              if (!isFromProfile) SizedBox(height: Insets.medium),
              if (!isFromProfile)
                Text(
                  'قيمة الغرامة: $fee',
                  style: TextStyle(
                    fontSize: CustomFontsTheme.bigSize,
                  ),
                ),
              if (isFromProfile)
                CustomItemSelect(
                    labelText: 'أختر نوع الشكوى',
                    controller: complainTypeController,
                    itemsList: [
                      'شكوى عامة', // General Complaint
                      'شكوى عن خدمة عملاء', // Customer Service Complaint
                      'شكوى عن منتج', // Product Complaint
                      'شكوى عن خدمة', // Service Complaint
                      'شكوى عن فاتورة', // Billing Complaint
                      'شكوى عن تسليم', // Delivery Complaint
                    ],
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
