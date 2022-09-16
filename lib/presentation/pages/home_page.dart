import 'package:flutter/material.dart';
import 'package:netflix_clone/domain/entities/movie_entity.dart';
import 'package:netflix_clone/domain/entities/response_list_data.dart';
import 'package:netflix_clone/presentation/screens/router/router_screen_stacks.dart';
import 'package:netflix_clone/presentation/widgets/bottom_nav_widget.dart';
import 'package:netflix_clone/presentation/widgets/header_tab_widget.dart';
import 'package:netflix_clone/presentation/widgets/home_page_material_widget.dart';
import 'package:netflix_clone/service/apis.dart';
import 'package:netflix_clone/service/image_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: const Key("home_page"));

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _preBackPress;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        DateTime now = DateTime.now();
        if (_preBackPress == null ||
            now.difference(_preBackPress) > Duration(seconds: 2)) {
          _preBackPress = now;

          final snack = SnackBar(
              content: Text("Press back button again to Exit"),
              duration: Duration(seconds: 1));
          ScaffoldMessenger.of(context).showSnackBar(snack);
          return false;
        }
        RouterScreenStacks.clearStack();
        return true;
      },
      child: Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  HeaderTabWidget(),
                  _buildBody(
                      category: MovieCategory.Popular,
                      sectionName: "Popular on Netflix"),
                  _buildBody(
                      category: MovieCategory.Trending,
                      sectionName: "Trending Now"),
                  _buildBody(
                      category: MovieCategory.TopRated,
                      sectionName: "Top Rated"),
                  _buildBody(
                      category: MovieCategory.NowPlaying,
                      sectionName: "Now Playing"),
                ])),
          ),
          bottomNavigationBar: BottomNavWidget(menu: BottomNavMenu.Home)),
    );
  }

  FutureBuilder<ResponseListData> _buildBody(
      {required MovieCategory category, required String sectionName}) {
    return FutureBuilder(
        future: category.task,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var entities = <MovieEntity>[];
            snapshot.data?.results.asMap().forEach((key, value) {
              var entity = MovieEntity.fromJson(value);
              entities.add(entity);
            });
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 4),
                    child: sectionTitleWidget(sectionName),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(height: 180, child: _buildList(entities))
                ]);
          }
          return _loadingPlaceHolder();
        });
  }

  String _getMovieName(String? source1, String? source2) {
    return source1 ?? source2!;
  }

  Widget _buildList(List<MovieEntity> entities) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: entities.map((e) {
        return _box(
            _getMovieName(e.name, e.title), e.poster_path, Colors.grey[900]!);
      }).toList(),
    );
  }

  Widget _box(String title, String imagePath, Color backgroundcolor) {
    return Container(
        margin: EdgeInsets.only(left: 4),
        width: 122,
        color: backgroundcolor,
        alignment: Alignment.center,
        child: ImageService.loadImage(imagePath: imagePath));
  }

  Widget _loadingPlaceHolder() {
    return Container(
        margin: EdgeInsets.only(left: 8),
        width: 125,
        color: Colors.black54,
        alignment: Alignment.center);
  }
}
