import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:worktest/cubit/home_cubit/home_cubit.dart';
import 'package:worktest/cubit/home_cubit/home_cubit_states.dart';

class DeliveryBody extends StatelessWidget {
  DeliveryBody({Key? key}) : super(key: key);

  List<String> pageViewImage = [
    "assets/images/1.jpg",
    "assets/images/2.jpeg",
    "assets/images/3.jpeg",
    "assets/images/4.jpeg",
    "assets/images/5.jpg",
  ];
  List<PageController> controller=[
    PageController(),
    PageController(),
    PageController(),
    PageController(),
    PageController(),
  ];


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeCubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return SingleChildScrollView(

          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              buildRow(context, cubit),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return buildItem(context, index, cubit);
                },
                itemCount: pageViewImage.length,
              ),
            ],
          ),
        );
      },
    );
  }

  Container buildItem(BuildContext context, int index, HomeCubit cubit) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.7,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        child: Column(
          children: [
            Expanded(
              child: buildPageView(index, cubit),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 1,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                "assets/images/burger.png",
                              ),
                              radius: 40,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "برجر كينج",
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                    const Spacer(),
                                    ...List.generate(
                                        5,
                                        (index) => Icon(
                                              Icons.star,
                                              color: index == 4
                                                  ? Colors.grey
                                                  : Colors.yellow,
                                              size: 15,
                                            )),
                                    const Text(" 4.2 "),
                                    const Text("(39K)")
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      "امريكي,ماكولات سريعة,برجر,ساندويت.",
                                      style: (TextStyle(fontSize: 10)),
                                    ),
                                    Spacer(),
                                    CircleAvatar(
                                      radius: 10,
                                      child: Icon(
                                        Icons.credit_card,
                                        size: 10,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.greenAccent.withOpacity(.4),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(" % خصم 40 ج بحد ادنى 120 ج")),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.access_time,
                            color: Colors.green,
                          ),
                          Text(
                            "24دقيقه",
                            style: TextStyle(color: Colors.green),
                          ),
                          Spacer(),
                          Icon(
                            Icons.delivery_dining,
                            color: Colors.green,
                          ),
                          Text(
                            "20.24 ج.م",
                            style: TextStyle(color: Colors.green),
                          ),
                          Spacer(),
                          Icon(
                            Icons.location_pin,
                            color: Colors.yellow,
                          ),
                          Text(
                            "تتبع الاوردر",
                            style: TextStyle(color: Colors.yellow),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  PageView buildPageView(int cc, HomeCubit cubit) {
    return PageView.builder(
      onPageChanged: (value) {

      },
      controller: controller[cc],
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return SafeArea(
          child: Stack(
            children: [
              Image.asset(
                pageViewImage[index],
                fit: BoxFit.fitWidth,
                width: double.infinity,
              ),
              Positioned(
                  bottom: 50,
                  right: 10,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.3),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            bottomLeft: Radius.circular(40))),
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Column(
                          children: const [
                            Text(
                              "ساندوتش دوبل وابر",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              " 116.00 -85.00 جنيه ",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        IconButton(
                          color: Colors.white,
                          onPressed: () {
                            controller[cc].animateToPage(3,
                                duration: const Duration(seconds: 2),
                                curve: Curves.linear);
                          },
                          icon: const Icon(Icons.arrow_forward_ios),
                        )
                      ],
                    ),
                  )),
              Positioned(
                bottom: 70,
                left: 10,
                child: buildSmoothPageIndicator(cubit,cc),
              )
            ],
          ),
        );
      },
      itemCount: pageViewImage.length,
    );
  }

  SmoothPageIndicator buildSmoothPageIndicator(HomeCubit cubit,int index) {
    return SmoothPageIndicator(
        controller: controller[index],
        effect: const WormEffect(
          activeDotColor: Colors.white,
          dotHeight: 8,
          dotWidth: 8,
          spacing: 4,
          dotColor: Colors.grey,
        ),
        count: pageViewImage.length);
  }

  Row buildRow(BuildContext context, HomeCubit cubit) {
    return Row(
      children: [
        Text("مطاعم ", style: Theme.of(context).textTheme.headline4),
        const Text("(260)"),
        const Spacer(),
        const Icon(
          Icons.verified_user_outlined,
          color: Colors.green,
          size: 20,
        ),
        const Text(
          "اوردر اونلاين",
          style: TextStyle(color: Colors.green),
        ),
        Switch(
          value: cubit.switchValue,
          onChanged: (value) {
            cubit.changeSwitch(value);
          },
          activeColor: Colors.red,
        ),
      ],
    );
  }
}
