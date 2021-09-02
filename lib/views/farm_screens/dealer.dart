import 'package:farm_keepers/bloc/main_cubit.dart';
import 'package:farm_keepers/models/dealers_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:farm_keepers/bloc/main_state.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import '../reuse_widgets/build_items_widgets.dart';
import '../reuse_widgets/dialog_widgets.dart';

class DealersScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final purchasingPowerController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MainCubit.get(context);
        List<DealersModel> dealersList = MainCubit.get(context).dealersList;
        return Scaffold(
          appBar: AppBar(
            title: Text('التجـــار'),
          ),
          body: Conditional.single(
            context: context,
            conditionBuilder: (context) =>
                state is! GetDealersDataLoadingState && dealersList.length > 0,
            widgetBuilder: (context) => ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildDealersItem(
                context: context,
                index: index,
                dealersList: dealersList,
                cubit: cubit,
                nameController: nameController,
                phoneNumber: phoneController,
                purchasingPower: purchasingPowerController,
                country: countryController,
                city: cityController,
                formKey: formKey
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 5.0,
              ),
              itemCount: dealersList.length,
            ),
            fallbackBuilder: (context) => Center(
              child: CircularProgressIndicator(),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              customDealersDialog(
                  context,
                  nameController,
                  phoneController,
                  purchasingPowerController,
                  countryController,
                  cityController,
                  formKey,
                  cubit);
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
