import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:farm_keepers/bloc/main_cubit.dart';
import 'package:farm_keepers/views/reuse_widgets/update_all_items.dart';
import 'package:flutter/material.dart';
import '../../constances/reuse_widgets.dart';
import '../../models/dealers_model.dart';
import '../../models/feeds_model.dart';
import '../../models/keepers_model.dart';


//Feeds item widget
buildFeedsItem({
  required context,
  required int index,
  required List<FeedsModel> feedsList,
  required MainCubit cubit,
  required TextEditingController name,
  required TextEditingController phoneController,
  required TextEditingController checkerWeightController,
  required TextEditingController checkerPriceController,
  required GlobalKey<FormState> formKey,
}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      AutoSizeText('الأسـم',
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(
                        width: 10,
                      ),
                      AutoSizeText(' : ',
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: AutoSizeText(
                        '${feedsList[index].name}',
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline6,
                      )),
                    ],
                  ),
                  Container(
                    height: 2,
                    color: Colors.grey[300],
                  ),
                  Row(
                    children: [
                      AutoSizeText('رقم التليفون',
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(
                        width: 10,
                      ),
                      AutoSizeText(' : ',
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: AutoSizeText(
                        '${feedsList[index].phone}',
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline6,
                      )),
                    ],
                  ),
                  Container(
                    height: 2,
                    color: Colors.grey[300],
                  ),
                  Row(
                    children: [
                      AutoSizeText('وزن الشيكاره',
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(
                        width: 10,
                      ),
                      AutoSizeText(' : ',
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(
                        width: 10,
                      ),
                      AutoSizeText(
                        '${feedsList[index].checkerWeight}',
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  Container(
                    height: 2,
                    color: Colors.grey[300],
                  ),
                  Row(
                    children: [
                      AutoSizeText('سعر الشيكاره',
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(
                        width: 10,
                      ),
                      AutoSizeText(' : ',
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: AutoSizeText(
                            '${feedsList[index].checkerPrice} جنيهاً',
                            maxLines: 1,
                            style: Theme.of(context).textTheme.headline6),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: MaterialButton(
                          color: Colors.greenAccent,
                          onPressed: () {
                            customFeedsUpdateDialog(
                              context: context,
                              nameController: name,
                              phoneController: phoneController,
                              checkerWeightController: checkerWeightController,
                              checkerPriceController: checkerPriceController,
                              formKey: formKey,
                              cubit: cubit,
                              feedsList: feedsList,
                              index: index,
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.edit,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              AutoSizeText(
                                'تعديل البيانات',
                                style: Theme.of(context).textTheme.bodyText1,
                              )
                            ],
                          ))),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: MaterialButton(
                          color: Colors.red[300],
                          onPressed: () {
                            defaultAwesomeDialog(
                              context: context,
                              btnOkOnPress: () {
                                cubit.deleteFromFeedsTable(
                                  context: context,
                                  id: feedsList[index].id!,
                                );
                              },
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.remove,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              AutoSizeText(
                                'حذف البيانات',
                                style: Theme.of(context).textTheme.bodyText1,
                              )
                            ],
                          )))
                ],
              )
            ],
          ),
        ),
      ),
    );

//Dealers item widget
buildDealersItem({
  required context,
  required index,
  required List<DealersModel> dealersList,
  required MainCubit cubit,
  required TextEditingController nameController,
  required TextEditingController phoneNumber,
  required TextEditingController purchasingPower,
  required TextEditingController country,
  required TextEditingController city,
  required GlobalKey<FormState> formKey,
}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      AutoSizeText('الأسـم',
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(
                        width: 10,
                      ),
                      AutoSizeText(' : ',
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: AutoSizeText(
                        '${dealersList[index].name}',
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline6,
                      )),
                    ],
                  ),
                  Container(
                    height: 2,
                    color: Colors.grey[300],
                  ),
                  Row(
                    children: [
                      AutoSizeText('رقم التليفون',
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(
                        width: 10,
                      ),
                      AutoSizeText(' : ',
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: AutoSizeText(
                        '${dealersList[index].phone}',
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline6,
                      )),
                    ],
                  ),
                  Container(
                    height: 2,
                    color: Colors.grey[300],
                  ),
                  Row(
                    children: [
                      AutoSizeText('قدراته الشرائيه',
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(
                        width: 10,
                      ),
                      AutoSizeText(' : ',
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(
                        width: 10,
                      ),
                      AutoSizeText(
                        '${dealersList[index].purchasingPower}',
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                  Container(
                    height: 2,
                    color: Colors.grey[300],
                  ),
                  Row(
                    children: [
                      AutoSizeText('المحافظه',
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(
                        width: 10,
                      ),
                      AutoSizeText(' : ',
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: AutoSizeText(
                        '${dealersList[index].country}',
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline6,
                      )),
                    ],
                  ),
                  Container(
                    height: 2,
                    color: Colors.grey[300],
                  ),
                  Row(
                    children: [
                      AutoSizeText('العـنـوان',
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(
                        width: 10,
                      ),
                      AutoSizeText(' : ',
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: AutoSizeText(
                        '${dealersList[index].city}',
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline6,
                      )),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: MaterialButton(
                          color: Colors.greenAccent,
                          onPressed: () {
                            customDealersUpdateDialog(
                                context: context,
                                nameController: nameController,
                                phoneController: phoneNumber,
                                purchasingPowerController: purchasingPower,
                                countryController: country,
                                cityController: city,
                                formKey: formKey,
                                cubit: cubit,
                                dealersList: dealersList,
                                index: index);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.edit,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              AutoSizeText(
                                'تعديل البيانات',
                                style: Theme.of(context).textTheme.bodyText1,
                              )
                            ],
                          ))),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: MaterialButton(
                          color: Colors.red[300],
                          onPressed: () {
                            defaultAwesomeDialog(
                                context: context,
                                btnOkOnPress: () {
                                  cubit.deleteFromDealersTable(
                                      context: context,
                                      id: dealersList[index].id!);
                                });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.remove,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              AutoSizeText(
                                'حذف البيانات',
                                style: Theme.of(context).textTheme.bodyText1,
                              )
                            ],
                          )))
                ],
              )
            ],
          ),
        ),
      ),
    );

//Keepers item widget
buildKeepersItem(
        context,
        index,
        List<KeepersModel> keepersList,
        MainCubit cubit,
        GlobalKey<FormState> formKey,
        TextEditingController nameController,
        TextEditingController phoneController,
        TextEditingController farmNumberController,
        TextEditingController motherCountController) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        if (keepersList[index].image != '')
                          SizedBox(
                            width: 5,
                          ),
                        AutoSizeText('الأسـم',
                            style: Theme.of(context).textTheme.headline6),
                        SizedBox(
                          width: 10,
                        ),
                        AutoSizeText(' : ',
                            style: Theme.of(context).textTheme.headline6),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 2,
                          child: AutoSizeText(
                            '${keepersList[index].name}',
                            maxLines: 1,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        if (keepersList[index].image != '')
                          Icon(
                            Icons.verified,
                            color: Colors.blue,
                          )
                      ],
                    ),
                    Container(
                      height: 2,
                      color: Colors.grey[300],
                    ),
                    Row(
                      children: [
                        AutoSizeText('رقم التليفون',
                            style: Theme.of(context).textTheme.headline6),
                        SizedBox(
                          width: 10,
                        ),
                        AutoSizeText(' : ',
                            style: Theme.of(context).textTheme.headline6),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: AutoSizeText(
                          '${keepersList[index].phone}',
                          maxLines: 1,
                          style: Theme.of(context).textTheme.headline6,
                        )),
                      ],
                    ),
                    Container(
                      height: 2,
                      color: Colors.grey[300],
                    ),
                    Row(
                      children: [
                        AutoSizeText('رقم المزرعه',
                            style: Theme.of(context).textTheme.headline6),
                        SizedBox(
                          width: 10,
                        ),
                        AutoSizeText(' : ',
                            style: Theme.of(context).textTheme.headline6),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: AutoSizeText(
                          '${keepersList[index].farmNumber}',
                          maxLines: 1,
                          style: Theme.of(context).textTheme.headline6,
                        )),
                      ],
                    ),
                    Container(
                      height: 2,
                      color: Colors.grey[300],
                    ),
                    Row(
                      children: [
                        AutoSizeText('عدد الأمهات',
                            style: Theme.of(context).textTheme.headline6),
                        SizedBox(
                          width: 10,
                        ),
                        AutoSizeText(' : ',
                            style: Theme.of(context).textTheme.headline6),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: AutoSizeText(
                          '${keepersList[index].motherCount}',
                          maxLines: 1,
                          style: Theme.of(context).textTheme.headline6,
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: MaterialButton(
                                color: Colors.greenAccent,
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  customKeepersUpdateDialog(
                                      context: context,
                                      nameController: nameController,
                                      phoneController: phoneController,
                                      farmNumberController:
                                          farmNumberController,
                                      motherCountController:
                                          motherCountController,
                                      formKey: formKey,
                                      cubit: cubit,
                                      keepersList: keepersList,
                                      index: index);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      color: Theme.of(context).iconTheme.color,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    AutoSizeText(
                                      'تعديل البيانات',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    )
                                  ],
                                ))),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: MaterialButton(
                                color: Colors.red[300],
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  defaultAwesomeDialog(
                                      context: context,
                                      btnOkOnPress: () {
                                        cubit.deleteFromKeepersTable(
                                            context: context,
                                            id: keepersList[index].id!);
                                      });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.remove,
                                      color: Theme.of(context).iconTheme.color,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    AutoSizeText('حذف البيانات',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1)
                                  ],
                                )))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
