import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../bloc/main_cubit.dart';
import '../../models/dealers_model.dart';
import '../../models/feeds_model.dart';
import '../../models/keepers_model.dart';


//keepers update widget dialog
customKeepersUpdateDialog({
  required context,
  required TextEditingController nameController,
  required TextEditingController phoneController,
  required TextEditingController farmNumberController,
  required TextEditingController motherCountController,
  required GlobalKey<FormState> formKey,
  required MainCubit cubit,
  required List<KeepersModel> keepersList,
  required int index,
}) =>
    showDialog(
        context: context,
        builder: (context) => Dialog(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          maxLength: 16,
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          validator: (value) =>
                              value!.isEmpty ? 'قم بإدخال الاسم الصحيح' : null,
                          decoration: InputDecoration(
                              hintText: 'ادخل الأسم',
                              hintStyle: Theme.of(context).textTheme.subtitle1,
                              suffixIcon: Icon(Icons.person)),
                        ),
                        TextFormField(
                          maxLength: 11,
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          maxLines: 1,
                          validator: (value) =>
                              value!.isEmpty ? 'قم بإدخال رقم الهاتف' : null,
                          decoration: InputDecoration(
                              hintText: 'ادخل رقم الهاتف',
                              hintStyle: Theme.of(context).textTheme.subtitle1,
                              suffixIcon: Icon(Icons.phone)),
                        ),
                        TextFormField(
                          maxLength: 7,
                          controller: farmNumberController,
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          validator: (value) =>
                              value!.isEmpty ? 'قم بإدخال رقم المزراعه' : null,
                          decoration: InputDecoration(
                              hintText: 'ادخل رقم المزراعه',
                              hintStyle: Theme.of(context).textTheme.subtitle1,
                              suffixIcon: Icon(Icons.home_filled)),
                        ),
                        TextFormField(
                          maxLength: 4,
                          controller: motherCountController,
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          validator: (value) =>
                              value!.isEmpty ? 'قم بإدخال عدد الأمهات' : null,
                          decoration: InputDecoration(
                              hintText: 'ادخل عدد الأمهات',
                              hintStyle: Theme.of(context).textTheme.subtitle1,
                              suffixIcon: Icon(Icons.add)),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: MaterialButton(
                                color: Colors.greenAccent[200],
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.updateKeepersTable(
                                      context: context,
                                      name: nameController.text,
                                      phoneNumber: phoneController.text,
                                      farmNumber: farmNumberController.text,
                                      motherCount: motherCountController.text,
                                      id: keepersList[index].id!.toInt(),
                                    );
                                    nameController.text = '';
                                    phoneController.text = '';
                                    farmNumberController.text = '';
                                    motherCountController.text = '';
                                    Navigator.pop(context);
                                  } else {}
                                },
                                child: Text(
                                  'اضافه مربي جديد',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: MaterialButton(
                                color: Colors.red[300],
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'إلغاء الأمر',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));


//dealers update widget dialog
customDealersUpdateDialog({
  required context,
  required TextEditingController nameController,
  required TextEditingController phoneController,
  required TextEditingController purchasingPowerController,
  required TextEditingController countryController,
  required TextEditingController cityController,
  required GlobalKey<FormState> formKey,
  required MainCubit cubit,
  required List<DealersModel> dealersList,
  required int index,
}) =>
    showDialog(
        context: context,
        builder: (context) => Dialog(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_forward_ios)),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          maxLength: 16,
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          validator: (value) =>
                              value!.isEmpty ? 'قم بإدخال الاسم الصحيح' : null,
                          decoration: InputDecoration(
                              hintText: 'ادخل الأسم',
                              hintStyle: Theme.of(context).textTheme.subtitle1,
                              suffixIcon: Icon(Icons.person)),
                        ),
                        TextFormField(
                          maxLength: 11,
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          maxLines: 1,
                          validator: (value) =>
                              value!.isEmpty ? 'قم بإدخال رقم الهاتف' : null,
                          decoration: InputDecoration(
                              hintText: 'ادخل رقم الهاتف',
                              hintStyle: Theme.of(context).textTheme.subtitle1,
                              suffixIcon: Icon(Icons.phone)),
                        ),
                        TextFormField(
                          maxLength: 9,
                          controller: purchasingPowerController,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          validator: (value) => value!.isEmpty
                              ? 'قم بإدخال قدراتك الشرائيه'
                              : null,
                          decoration: InputDecoration(
                              hintText: 'قم بإدخال قدراتك الشرائيه',
                              hintStyle: Theme.of(context).textTheme.subtitle1,
                              suffixIcon: Icon(Icons.home_filled)),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                enabled: false,
                                controller: countryController,
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                validator: (value) => value!.isEmpty
                                    ? 'قم بإدخال المحافظه'
                                    : null,
                                decoration: InputDecoration(
                                  hintText: 'قم بإدخال المحافظه',
                                  hintStyle:
                                      Theme.of(context).textTheme.subtitle1,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width / 3,
                                child: DropdownSearch<String>(
                                  popupBackgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  validator: (item) =>
                                      item!.isEmpty ? 'اختار المحافظه' : null,
                                  mode: Mode.DIALOG,
                                  showSelectedItem: true,
                                  items: cubit.countryItems,
                                  label: "Menu mode",
                                  hint: "country in menu mode",
                                  onChanged: (print) =>
                                      countryController.text = print!,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          maxLength: 12,
                          controller: cityController,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          validator: (value) =>
                              value!.isEmpty ? 'قم بإدخال المدينه' : null,
                          decoration: InputDecoration(
                              hintText: 'قم بإدخال المدينه',
                              hintStyle: Theme.of(context).textTheme.subtitle1,
                              suffixIcon: Icon(Icons.add)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: MaterialButton(
                                color: Colors.greenAccent[200],
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.updateDealersTable(
                                      context: context,
                                      name: nameController.text,
                                      phoneNumber: phoneController.text,
                                      purchasingPower:
                                          purchasingPowerController.text,
                                      country: countryController.text,
                                      city: cityController.text,
                                      id: dealersList[index].id!.toInt(),
                                    );
                                    nameController.text = '';
                                    phoneController.text = '';
                                    purchasingPowerController.text = '';
                                    countryController.text = '';
                                    cityController.text = '';
                                    Navigator.pop(context);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                                Text('تأكد من جميع الحقول')));
                                  }
                                },
                                child: AutoSizeText(
                                  'اضافه مربي جديد',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: MaterialButton(
                                color: Colors.red[300],
                                onPressed: () {
                                  nameController.text = '';
                                  phoneController.text = '';
                                  purchasingPowerController.text = '';
                                  countryController.text = '';
                                  cityController.text = '';
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'إلغاء الأمر',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));


//feeds update widget dialog
customFeedsUpdateDialog({
  required context,
  required TextEditingController nameController,
  required TextEditingController phoneController,
  required TextEditingController checkerWeightController,
  required TextEditingController checkerPriceController,
  required GlobalKey<FormState> formKey,
  required MainCubit cubit,
  required List<FeedsModel> feedsList,
  required int index,
}) =>
    showDialog(
        context: context,
        builder: (context) => Dialog(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          maxLength: 16,
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          validator: (value) =>
                              value!.isEmpty ? 'قم بإدخال الاسم الصحيح' : null,
                          decoration: InputDecoration(
                              hintText: 'ادخل الأسم',
                              hintStyle: Theme.of(context).textTheme.subtitle1,
                              suffixIcon: Icon(Icons.person)),
                        ),
                        TextFormField(
                          maxLength: 11,
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          maxLines: 1,
                          validator: (value) =>
                              value!.isEmpty ? 'قم بإدخال رقم الهاتف' : null,
                          decoration: InputDecoration(
                              hintText: 'ادخل رقم الهاتف',
                              hintStyle: Theme.of(context).textTheme.subtitle1,
                              suffixIcon: Icon(Icons.phone)),
                        ),
                        TextFormField(
                          maxLength: 9,
                          controller: checkerWeightController,
                          keyboardType: TextInputType.text,
                          validator: (value) =>
                              value!.isEmpty ? 'قم بإدخال الوزن الصحيح' : null,
                          decoration: InputDecoration(
                              hintText: 'ادخل الوزن الصحيح',
                              hintStyle: Theme.of(context).textTheme.subtitle1,
                              suffixIcon: Icon(Icons.home_filled)),
                        ),
                        TextFormField(
                          maxLength: 9,
                          controller: checkerPriceController,
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              value!.isEmpty ? 'قم بإدخال سعر الشيكاره' : null,
                          decoration: InputDecoration(
                              hintText: 'قم بإدخال سعر الشيكاره',
                              hintStyle: Theme.of(context).textTheme.subtitle1,
                              suffixIcon: Icon(Icons.add)),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: MaterialButton(
                                color: Colors.greenAccent[200],
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.updateFeedsTable(
                                      context: context,
                                      name: nameController.text,
                                      phoneNumber: phoneController.text,
                                      checkerWeight:
                                          checkerWeightController.text,
                                      checkerPrice: checkerPriceController.text,
                                      id: feedsList[index].id!.toInt(),
                                    );
                                    nameController.text = '';
                                    phoneController.text = '';
                                    checkerWeightController.text = '';
                                    checkerPriceController.text = '';
                                    Navigator.pop(context);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'من فضلك إملاء جميع البيانات')));
                                  }
                                },
                                child: Text(
                                  'اضافه مربي جديد',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: MaterialButton(
                                color: Colors.red[300],
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'إلغاء الأمر',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
