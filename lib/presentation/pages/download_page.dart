import 'package:flutter/material.dart';
import 'package:netflix_clone/domain/entities/download_entity.dart';
import 'package:netflix_clone/presentation/screens/router/router_screen_stacks.dart';
import 'package:netflix_clone/presentation/widgets/bottom_nav_widget.dart';
import 'package:netflix_clone/service/image_service.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({Key? key}) : super(key: key);

  final double iconSize = 25;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        RouterScreenStacks.clearStack();
        return true;
      },
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 24),
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, size: iconSize),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: Row(
                      children: [
                        Text("Smart Downloads",
                            style: TextStyle(color: Colors.white)),
                        SizedBox(width: 10),
                        Text("ON", style: TextStyle(color: Colors.blueAccent))
                      ],
                    )),
                    Container(
                      child: Icon(Icons.edit_outlined, size: iconSize),
                    )
                  ],
                ),
              ),
              _buildSection(DownloadEntity.sampel1)
            ],
          ),
        ),
        bottomNavigationBar: BottomNavWidget(menu: BottomNavMenu.Downloads),
      ),
    );
  }

  Widget _buildSection(List<DownloadEntity> downloads) {
    final List<Widget> body = [];
    for (int i = 0; i < downloads.length; i++) {
      var section = downloads[i];
      body.add(Row(children: [
        Icon(Icons.person_3_rounded, size: iconSize),
        SizedBox(width: 4),
        Text(section.owner, style: TextStyle(fontSize: 16),)
      ]));
      section.movies.forEach((movie) {
        body.add(_buildChild(movie: movie));
      });
    }
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: body,
        ),
      ),
    );
  }

  Widget _buildChild({required DownloadedMovieEntity movie}) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          children: [
            Container(
              height: 70,
              width: 124,
              color: Colors.grey[800],
              child: ImageService.loadImage(imagePath: movie.backdropPath),
            ),
            SizedBox(width: 18),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title, style: TextStyle(fontSize: 20)),
                SizedBox(height: 5),
                Text("${movie.chapterCount} Episodes | ${movie.totalSize}GB")
              ],
            )),
            Icon(
              Icons.chevron_right_outlined,
              size: 30,
            )
          ],
        ),
      ),
      SizedBox(height: 10),
    ]);
  }
}
