import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:farm_keepers/models/dealers_model.dart';
import 'package:farm_keepers/models/feeds_model.dart';
import 'package:farm_keepers/models/keepers_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:farm_keepers/bloc/main_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainInitialState());

  static MainCubit get(context) => BlocProvider.of(context);

  var pageController = PageController();
  Database? database;
  KeepersModel? keepersModel;
  FeedsModel? feedsModel;
  DealersModel? dealersModel;
  List<KeepersModel> keepersList = [];
  List<DealersModel> dealersList = [];
  List<FeedsModel> feedsList = [];
  List<String> countryItems = [
    'الدقهليه',
    'الغربيه',
    'كفر الشيخ',
    'المنوفيه',
    'دمياط',
    'بورسعيد',
    'الاسماعيليه',
    'السويس',
    'شمال سيناء',
    'اسيوط',
    'الوادي الجديد',
    'البحر الاحمر',
    'بني سويف',
    'المنيا',
    'الفيوم',
    'جنوب سيناء',
    'القليوبيه',
    'قنا',
    'نجع حمادي',
    'الأقصر',
    'أسوان',
    'مرسي مطروح',
  ];

  //****************************************************************************
  //BOTTOM_NAVIGATION_BAR
  int currentIndex = 0;
  List<BottomNavyBarItem> items = [
    BottomNavyBarItem(
        icon: CircleAvatar(
          radius: 16,
          backgroundImage: AssetImage('assets/images/keepers.png'),
        ),
        title: AutoSizeText(
          'المربيين',
          textAlign: TextAlign.center,
        ),
        textAlign: TextAlign.center),
    BottomNavyBarItem(
        icon: CircleAvatar(
          radius: 16,
          backgroundImage: AssetImage('assets/images/dealer.png'),
        ),
        title: AutoSizeText(
          'التجـار',
          textAlign: TextAlign.center,
        ),
        textAlign: TextAlign.center),
    BottomNavyBarItem(
        icon: CircleAvatar(
          radius: 16,
          backgroundImage: AssetImage('assets/images/feed.png'),
        ),
        title: AutoSizeText(
          'الأعـلاف',
          textAlign: TextAlign.center,
        ),
        textAlign: TextAlign.center),
  ];

  changeBottomNav(int index) {
    currentIndex = index;
    pageController.jumpToPage(index);
    emit(ChangeBottomNavState());
  }

//****************************************************************************
//sqfLite
//****************************************************************************
  void createDataBase() async {
    emit(CreateDatabaseLoadingState());
    database = await openDatabase(
      'farm.db',
      version: 1,
      onCreate: (database, version) =>
          onCreate(database, version).then((value) {
        print('tables created');
        emit(OnCreateDataBaseSuccess());
      }).catchError((error) {
        print(error.toString());
        emit(OnCreateDataBaseError());
      }),
      onOpen: (database) async {
        emit(OnCreateDataBaseLoading());
        await getKeepersData(database);
        await getDealersData(database);
        await getFeedsData(database);
        print('on opened database');
      },
    );
  }

  Future<void> onCreate(Database database, int version) async {
    await database.execute(
        'CREATE TABLE keepers (id INTEGER PRIMARY KEY,name TEXT,phoneNumber TEXT ,farmNumber TEXT,motherCount TEXT,image TEXT)');
    await database.execute(
        'CREATE TABLE dealers (id INTEGER PRIMARY KEY,name TEXT,phoneNumber TEXT ,purchasingPower TEXT ,country TEXT,city TEXT,image TEXT)');
    await database.execute(
        'CREATE TABLE feeds (id INTEGER PRIMARY KEY,name TEXT,phone TEXT,checkerWeight TEXT,checkerPrice TEXT)');
  }

  insertInKeepersTable(context,
      {required String name,
      required String phone,
      required farmNumber,
      required String motherCount,
      image}) {
    database!.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO keepers (name,phoneNumber,farmNumber,motherCount,image)VALUES("$name","$phone","$farmNumber","$motherCount","${image ?? ''}")')
          .then((value) {
        getKeepersData(database!);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('تمت اضافته بنجاح')));
        emit(InsertInKeeperTableSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(InsertInKeeperTableSuccessState());
      });
    }).then((value) {
      emit(InsertInKeeperTableSuccessState());
    }).catchError((error) {
      emit(InsertInKeeperTableSuccessState());
    });
  }

  insertInDealersTable(context,
      {required String name,
      required String phoneNumber,
      required String purchasingPower,
      required String country,
      required String city,
      var image}) {
    database!.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT INTO dealers (name,phoneNumber,purchasingPower,country,city,image) VALUES("$name","$phoneNumber","$purchasingPower","$country","$city","${image ?? ''}")');
    }).then((value) {
      getDealersData(database!);
      print(value);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('تمت اضافته بنجاح')));
      emit(InsertInDealersTableSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(InsertInDealersTableErrorState());
    });
  }

  insertInFeedsTable(
    context, {
    required String name,
    required String phone,
    required String checkerWeight,
    required String checkerPrice,
  }) {
    database!.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT INTO feeds (name,checkerWeight,checkerPrice,phone) VALUES ("$name","$checkerWeight","$checkerPrice","$phone")');
    }).then((value) {
      getFeedsData(database!);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('تمت إضافته بنجاح')));
      emit(InsertInFeedsTableSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(InsertInFeedsTableErrorState());
    });
  }

  getKeepersData(Database database) {
    emit(GetKeepersDataLoadingState());
    return database.rawQuery('SELECT * FROM keepers').then((value) {
      keepersList = value.map((e) => KeepersModel.fromMap(e)).toList();
      emit(GetKeepersDataSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetKeepersDataErrorState());
    });
  }

  getDealersData(Database database) {
    emit(GetDealersDataLoadingState());
    return database.rawQuery('SELECT * FROM dealers').then((value) {
      dealersList = value.map((e) => DealersModel.fromMap(e)).toList();
      emit(GetDealersDataSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetDealersDataErrorState());
    });
  }

  getFeedsData(Database database) {
    emit(GetFeedsDataLoadingState());
    return database.rawQuery('SELECT * FROM feeds').then((value) {
      feedsList = value.map((e) => FeedsModel.fromMap(e)).toList();
      emit(GetFeedsDataSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetFeedsDataErrorState());
    });
  }

  deleteFromKeepersTable({
    required BuildContext context,
    required int id,
  }) async {
    database!.rawDelete('DELETE FROM keepers WHERE id = ?', [id]).then((value) {
      getKeepersData(database!);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('تمت ازالته بنجاح')));
      emit(DeleteFromKeepersTableSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(DeleteFromKeepersTableErrorState());
    });
  }

  deleteFromFeedsTable({
    required BuildContext context,
    required int id,
  }) async {
    database!.rawDelete('DELETE FROM feeds WHERE id = ?', [id]).then((value) {
      getFeedsData(database!);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('تمت ازالته بنجاح')));
      emit(DeleteFromFeedsTableSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(DeleteFromFeedsTableErrorState());
    });
  }

  deleteFromDealersTable({
    required BuildContext context,
    required int id,
  }) async {
    database!.rawDelete('DELETE FROM dealers WHERE id = ?', [id]).then((value) {
      getDealersData(database!);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('تمت ازالته بنجاح')));
      emit(DeleteFromDealersTableSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(DeleteFromDealersTableErrorState());
    });
  }

  updateKeepersTable({
    required BuildContext context,
    required String name,
    required String phoneNumber,
    required String farmNumber,
    required String motherCount,
    required int id,
  }) {
    database!.rawUpdate(
        'UPDATE keepers SET name = ?, phoneNumber = ? ,farmNumber = ?,motherCount = ? WHERE id = ?',
        [
          '$name',
          '$phoneNumber',
          '$farmNumber',
          '$motherCount',
          id
        ]).then((value) {
      getKeepersData(database!);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('تم التعديل بنجاح')));
      emit(UpdateKeepersTableSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(UpdateKeepersTableError());
    });
  }

  updateDealersTable({
    required BuildContext context,
    required String name,
    required String phoneNumber,
    required String purchasingPower,
    required String country,
    required String city,
    required int id,
  }) {
    database!.rawUpdate(
        'UPDATE dealers SET name = ?, phoneNumber = ? ,purchasingPower = ?,country = ?,city =?  WHERE id = ?',
        [
          '$name',
          '$phoneNumber',
          '$purchasingPower',
          '$country',
          '$city',
          id
        ]).then((value) {
      getDealersData(database!);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('تم التعديل بنجاح')));
      emit(UpdateDealersTableSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(UpdateDealersTableError());
    });
  }

  updateFeedsTable({
    required BuildContext context,
    required String name,
    required String phoneNumber,
    required String checkerWeight,
    required String checkerPrice,
    required int id,
  }) {
    database!.rawUpdate(
        'UPDATE feeds SET name = ?, phone = ? ,checkerWeight = ?,checkerPrice = ? WHERE id = ?',
        [
          '$name',
          '$phoneNumber',
          '$checkerWeight',
          '$checkerPrice',
          id
        ]).then((value) {
      getFeedsData(database!);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('تم التعديل بنجاح')));
      emit(UpdateFeedsTableSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(UpdateFeedsTableError());
    });
  }

//IMAGE_PICKER
//****************************************************************************
  var keepersImage;
  var picker = ImagePicker();

  Future<void> getKeepersImageWithGallery(context) async {
    picker.pickImage(source: ImageSource.gallery).then((value) {
      keepersImage = value!.readAsBytes();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('تمت اضافة الصورة بنجاح')));
      emit(KeepersImagePickerSuccessState());
    }).catchError((error) {
      print('no image selected');
      emit(KeepersImagePickerErrorState());
    });
  }

  Future<void> getKeepersImageWithCamera(context) async {
    picker.pickImage(source: ImageSource.camera).then((value) {
      keepersImage = value!.readAsBytes();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('تمت اضافة الصورة بنجاح')));
      emit(KeepersImagePickerSuccessState());
    }).catchError((error) {
      print('no image selected');
      emit(KeepersImagePickerErrorState());
    });
  }
}
