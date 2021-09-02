import 'package:farm_keepers/bloc/main_cubit.dart';
import 'package:farm_keepers/models/feeds_model.dart';
import 'package:flutter/material.dart';
import 'package:farm_keepers/bloc/main_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

import '../reuse_widgets/build_items_widgets.dart';
import '../reuse_widgets/dialog_widgets.dart';

class FeedsScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final checkerWeightController = TextEditingController();
  final checkerPriceController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MainCubit.get(context);
        List<FeedsModel> feedsList = MainCubit.get(context).feedsList;
        return Scaffold(
          appBar: AppBar(
            title: Text('الأعـــلاف'),
          ),
          body: Conditional.single(
            context: context,
            conditionBuilder: (context) =>
                state is! GetFeedsDataLoadingState && feedsList.length > 0,
            widgetBuilder: (context) => ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildFeedsItem(
                context: context,
                index: index,
                feedsList: feedsList,
                cubit: cubit,
                name: nameController,
                phoneController: phoneController,
                checkerWeightController: checkerWeightController,
                checkerPriceController: checkerPriceController,
                formKey: formKey
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 5.0,
              ),
              itemCount: feedsList.length,
            ),
            fallbackBuilder: (context) =>
                Center(child: CircularProgressIndicator()),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              customFeedsDialog(
                context: context,
                nameController: nameController,
                phoneController: phoneController,
                checkerWeightController: checkerWeightController,
                checkerPriceController: checkerPriceController,
                formKey: formKey,
                cubit: cubit,
              );
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
