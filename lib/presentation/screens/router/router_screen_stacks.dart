import 'package:netflix_clone/presentation/widgets/bottom_nav_widget.dart';

class RouterScreenStacks {
  static int _currentIndexOfStack = 0;
  static List<BottomNavMenu> _menuStacks = [];

  static addStack(BottomNavMenu menu) => _menuStacks.add(menu);

  static removeStackByIndex(int index) => _menuStacks.removeAt(index);

  static removeStackByValue(BottomNavMenu menu) => _menuStacks.remove(menu);

  static clearStack() => _menuStacks.clear();

  static BottomNavMenu getCurrentScreen() => _menuStacks[_currentIndexOfStack];

  static setCurrentIndex(int currentIndex) =>
      _currentIndexOfStack = currentIndex;

  static BottomNavMenu? getPreviousStack() =>
      _menuStacks.length > 0 ? _menuStacks[_currentIndexOfStack] : null;
}
