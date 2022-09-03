import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/pages/create_your_account_page.dart';
import 'package:netflix_clone/presentation/widgets/general_widgets.dart';
import 'package:netflix_clone/presentation/widgets/header_widget.dart';

class PlansPage extends StatefulWidget {
  const PlansPage({Key? key}) : super(key: key);

  @override
  State<PlansPage> createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  final List<String> prices = ["IDR 25.000", "IDR 75.000", "IDR 100.000"];
  final List<String> videos = ["Good", "Better", "Best"];
  final List<String> resolutions = ["480p", "1080p", "4k+HDR"];
  final List<String> screens = ["1", "2", "4"];

  int _selectPlan = 0;
  List<Color> highlights = [Colors.grey, Colors.grey, Colors.grey];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        flexibleSpace: HeaderWidget(),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("STEP 1 OF 3"),
              SizedBox(
                height: 10,
              ),
              Text(
                "Choose the plan that's right for you",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Downgrade or upgrade at any time."),
              SizedBox(
                height: 15,
              ),
              _rowButtonWidget(),
              _plans()
            ],
          ),
        ),
      ),
    );
  }

  Widget _rowButtonWidget() {
    return Row(
      children: [
        _radioButton(title: "Basic", planIndex: 0),
        _radioButton(title: "Standard", planIndex: 1),
        _radioButton(title: "Premium", planIndex: 2),
      ],
    );
  }

  Widget _radioButton({required String title, required int planIndex}) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            _selectPlan = planIndex;
          });
        },
        child: Container(
          margin: EdgeInsets.all(4),
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: planIndex == _selectPlan ? Colors.red : Colors.red[300]!),
          child: Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _plans() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 15,
          ),
          Text("Monthly Price"),
          SizedBox(
            height: 15,
          ),
          _columnWidgets(labels: prices),
          SizedBox(
            height: 15,
          ),
          Text("Video Quality"),
          SizedBox(
            height: 15,
          ),
          _columnWidgets(labels: videos),
          SizedBox(
            height: 15,
          ),
          Text("Resolution"),
          SizedBox(
            height: 15,
          ),
          _columnWidgets(labels: resolutions),
          SizedBox(
            height: 15,
          ),
          Text("Screen you can watch on at the same time"),
          SizedBox(
            height: 15,
          ),
          _columnWidgets(labels: screens),
          SizedBox(
            height: 15,
          ),
          Text("Watch on your laptop, TV, Phones and Tablet"),
          SizedBox(
            height: 15,
          ),
          _columnWidgets(labels: screens, preferIcon: true),
          SizedBox(
            height: 15,
          ),
          Text("Unlimited files and TV Programmers"),
          SizedBox(
            height: 15,
          ),
          _columnWidgets(labels: screens, preferIcon: true),
          SizedBox(
            height: 15,
          ),
          Text("Cancel at any time"),
          SizedBox(
            height: 15,
          ),
          _columnWidgets(labels: screens, preferIcon: true),
          SizedBox(height: 15),
          Text(
            "HD (720p), full HD (1080p), Ultra HD (4k) and HDR availability subject to your internet service and device capabilities. Not all content available in HD, Full HD, Ultra HD or HDR. See Terms Use For More Details,",
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => CreateYourAccountPage()));
            },
            child: NetflixWidget.generalButton,
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

  void resetColorState() {
    highlights = [Colors.grey, Colors.grey, Colors.grey];
  }

  Widget _columnWidgets(
      {required List<String> labels, bool preferIcon = false}) {
    resetColorState();
    highlights[_selectPlan] = Colors.red;
    List<Expanded> children = [];
    labels.asMap().forEach((index, value) {
      Widget? child = preferIcon
          ? Icon(Icons.done, color: highlights[index])
          : Text(
              value,
              style: TextStyle(color: highlights[index]),
            );
      children.add(Expanded(
          child: Center(
        child: child,
      )));
    });
    return Column(children: [
      Row(children: children),
      Divider(thickness: 1.5),
    ]);
  }
}
