import 'package:flutter/material.dart';
import 'package:netflix_clone/domain/entities/on_boarding_entity.dart';
import 'package:netflix_clone/presentation/pages/choose_your_plan_page.dart';
import 'package:netflix_clone/presentation/widgets/header_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final onBoardingData = OnBoardingEntity.onBoardingData;
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [_pageViewBuilderWidget(), _columnWidget(), HeaderWidget()],
      ),
    );
  }

  Widget _pageViewBuilderWidget() {
    return PageView.builder(
        itemCount: onBoardingData.length,
        onPageChanged: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        itemBuilder: (ctx, index) {
          return Stack(
            fit: StackFit.passthrough,
            children: [
              index == 3
                  ? Container(
                      height: double.infinity,
                      child: Image.asset(
                        onBoardingData[index].image,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(bottom: 40),
                      child: Image.asset(onBoardingData[index].image),
                    ),
              index == 3
                  ? Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Colors.black.withOpacity(.5),
                            Colors.black.withOpacity(.1),
                            Colors.black.withOpacity(.9),
                          ],
                              tileMode: TileMode.clamp,
                              begin: Alignment(0.9, 0.0),
                              end: Alignment(0.8, 0.38))),
                    )
                  : Container(),
              Container(
                margin: EdgeInsets.only(top: 230, left: 40, right: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      onBoardingData[index].heading,
                      style: TextStyle(fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      onBoardingData[index].description,
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )
            ],
          );
        });
  }

  Widget _columnWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: onBoardingData.map((data) {
                //get index
                int index = onBoardingData.indexOf(data);

                return Container(
                  height: 10,
                  width: 10,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color:
                          index == currentPageIndex ? Colors.red : Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ChooseYourPlanPage()));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 10, left: 15, right: 15),
              padding: EdgeInsets.symmetric(vertical: 12),
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.red),
              child: Text("GET STARTED"),
            ),
          )
        ],
      ),
    );
  }
}
