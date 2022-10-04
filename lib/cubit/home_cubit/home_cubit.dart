import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worktest/cubit/home_cubit/home_cubit_states.dart';
import 'package:worktest/widgets/5rogat.dart';
import 'package:worktest/widgets/delivery.dart';
import 'package:worktest/widgets/orders.dart';
import 'package:worktest/widgets/profile.dart';
import 'package:worktest/widgets/restraunts.dart';

class HomeCubit extends Cubit<HomeCubitStates> {
  HomeCubit() : super(InitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

//=================================================

  List<Widget> navBarList = [
     DeliveryBody(),
    const Restaurants(),
    const KhrogatBody(),
    const OrderBody(),
    const Profile(),
  ];
  int navbarCurrentIndex = 0;

  void changeNavBar(int index) {
    navbarCurrentIndex = index;
    emit(NavBarChanged());
  }
//=================================================

  bool switchValue = true;
  changeSwitch(bool value){
    switchValue=value;
    emit(SwitchChanged());
  }
//=================================================

}
