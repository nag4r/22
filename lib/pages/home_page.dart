import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worktest/components/components.dart';
import 'package:worktest/cubit/home_cubit/home_cubit.dart';
import 'package:worktest/cubit/home_cubit/home_cubit_states.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeCubitStates>(
      listener: (context,state){},
      builder: (context,state){
        HomeCubit cubit =HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title:TextFormField(
              decoration:  const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  )
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black12,
                    )
                ),
                contentPadding: EdgeInsets.all(8),
                hintText: "دور على مطعم او اكلة",
                prefixIcon: Icon(Icons.search,color: Colors.black12,),
              ),
            ),
            actions:  [
              IconButton(color: Colors.red, onPressed: () {  }, icon: const Icon(Icons.add_road_sharp,size: 40,),),
            ],
          ),
          body: cubit.navBarList[cubit.navbarCurrentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              cubit.changeNavBar(index);
            },
            currentIndex: cubit.navbarCurrentIndex,
            type: BottomNavigationBarType.fixed,
            selectedIconTheme: IconThemeData(color: Colors.red),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.delivery_dining),label: "دليفرى"),
              BottomNavigationBarItem(icon: Icon(Icons.restaurant),label: "مطاعم"),
              BottomNavigationBarItem(icon: Icon(Icons.restaurant),label: "خروجات"),
              BottomNavigationBarItem(icon: Icon(Icons.article_outlined),label:"اوردراتى" ),
              BottomNavigationBarItem(icon: Icon(Icons.person,),label: "بروفايل"),
            ],
          ),
        );
      },
    );
  }
}
