import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:farm_keepers/bloc/main_cubit.dart';
import 'package:farm_keepers/bloc/main_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'dealer.dart';
import 'feeds.dart';
import 'keepers.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MainCubit.get(context);
        return Scaffold(
          bottomNavigationBar: BottomNavyBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            items: cubit.items,
            onItemSelected: (index) => cubit.changeBottomNav(index),
            itemCornerRadius: 100,
            selectedIndex: cubit.currentIndex,
            curve: Curves.fastLinearToSlowEaseIn,
          ),
          body: Conditional.single(
            context: context,
            conditionBuilder: (context) => state is! OnCreateDataBaseLoading,
            widgetBuilder: (context) => SafeArea(
              child: PageView(
                physics: BouncingScrollPhysics(),
                controller: cubit.pageController,
                onPageChanged: (index) {
                  cubit.changeBottomNav(index);
                },
                children: [
                  KeepersScreen(),
                  DealersScreen(),
                  FeedsScreen(),
                ],
              ),
            ),
            fallbackBuilder: (context) =>
                Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
