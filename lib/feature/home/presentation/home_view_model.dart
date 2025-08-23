part of 'home_view.dart';

mixin _HomeViewModel on State<Home> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onTapHome(int index) {
    _currentIndex.value = index;
    _pageController.animateToPage(
      index,
      duration: Durations.short3,
      curve: Curves.easeInOut,
    );
  }

  void onTapProfile(int index) {
    _currentIndex.value = index;
    _pageController.animateToPage(
      index,
      duration: Durations.short3,
      curve: Curves.easeInOut,
    );
  }
}
