import 'package:farm_keepers/bloc/main_cubit.dart';
import 'package:farm_keepers/views/farm_screens/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/main_cubit.dart';
import 'constances/const_theme.dart';
import 'networking/ob_server.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(FarmKeepers());
}

class FarmKeepers extends StatelessWidget {
  const FarmKeepers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit()..createDataBase(),
      child: MaterialApp(
          theme: darkTheme(context),
          debugShowCheckedModeBanner: false,
          home: MainView(),
          builder: (context, child) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: child!,
            );
          }
      ),

    );
  }
}
