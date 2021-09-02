import 'package:farm_keepers/bloc/main_cubit.dart';
import 'package:farm_keepers/bloc/main_state.dart';
import 'package:farm_keepers/models/keepers_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import '../reuse_widgets/build_items_widgets.dart';
import '../reuse_widgets/dialog_widgets.dart';

class KeepersScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final farmNumberController = TextEditingController();
  final motherCountController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MainCubit.get(context);
        List<KeepersModel> keepersList = MainCubit.get(context).keepersList;
        return Scaffold(
          appBar: AppBar(
            title: Text('المرابيين'),
          ),
          body: Conditional.single(
            context: context,
            conditionBuilder: (context) =>
                state is! GetKeepersDataLoadingState && keepersList.length > 0,
            widgetBuilder: (context) => ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildKeepersItem(
                    context,
                    index,
                    keepersList,
                    cubit,
                    formKey,
                    nameController,
                    phoneController,
                    farmNumberController,
                    motherCountController),
                separatorBuilder: (context, index) => SizedBox(
                      height: 5,
                    ),
                itemCount: keepersList.length),
            fallbackBuilder: (context) =>
                Center(child: CircularProgressIndicator()),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              customKeepersDialog(
                  context: context,
                  nameController: nameController,
                  phoneController: phoneController,
                  farmNumberController: farmNumberController,
                  motherCountController: motherCountController,
                  formKey: formKey,
                  cubit: cubit);
            },
            child: Icon(
              Icons.add,
            ),
          ),
        );
      },
    );
  }
}

customBottomSheet(context, MainCubit cubit) => showModalBottomSheet(
    context: context,
    builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 25.0,
            ),
            MaterialButton(
              height: 50,
              onPressed: () {
                cubit.getKeepersImageWithCamera(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('camera'),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.camera_alt),
                ],
              ),
              minWidth: double.infinity,
            ),
            SizedBox(
              height: 25.0,
            ),
            MaterialButton(
              height: 50,
              onPressed: () {
                cubit.getKeepersImageWithGallery(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Gallery'),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.phone_android_outlined),
                ],
              ),
              minWidth: double.infinity,
            ),
          ],
        ));
