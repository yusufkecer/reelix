import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';
import 'package:reelix/core/index.dart';
import 'package:reelix/feature/movies/presentation/movies_view.dart';
import 'package:reelix/feature/profile/presentation/profile_view.dart';

part 'home_view_model.dart';
part 'widgets/custom_navbar.dart';

@RoutePage(name: 'HomeView')
@immutable
final class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with _HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: _currentIndex,
            builder: (context, value, child) => PageView(
              controller: _pageController,
              key: const PageStorageKey('home_page_view'),
              onPageChanged: (index) {
                _currentIndex.value = index;
              },
              children: const [
                _KeepAliveWrapper(child: Movies()),
                _KeepAliveWrapper(child: ProfileView()),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: CustomNavbar(
              onTapHome: _onTapHome,
              onTapProfile: _onTapProfile,
            ),
          ),
        ],
      ),
    );
  }
}
