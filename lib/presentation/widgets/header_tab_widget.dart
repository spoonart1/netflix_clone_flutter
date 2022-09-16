import 'package:flutter/material.dart';

class HeaderTabWidget extends StatelessWidget {
  const HeaderTabWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 15),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  print("back to home");
                },
                child: Container(
                  height: 70,
                  width: 50,
                  child: Image.asset('assets/n_symbol.png'),
                ),
              ),
              _makeTabButton(
                  label: "TV Shows",
                  onTap: () {
                    print("showing tv");
                  }),
              SizedBox(
                width: 10,
              ),
              _makeTabButton(
                  label: "Movies",
                  onTap: () {
                    print("showing movies");
                  }),
              SizedBox(width: 10),
              _makeTabButton(
                  label: "My List",
                  onTap: () {
                    print("showing my list");
                  }),
            ],
          )
        ]));
  }

  Widget _makeTabButton({required String label, GestureTapCallback? onTap}) {
    return InkWell(
        onTap: onTap,
        child: Container(padding: EdgeInsets.all(10), child: Text(label)));
  }
}
