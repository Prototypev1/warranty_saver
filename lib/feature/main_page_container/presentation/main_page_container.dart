import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warranty_saver/core/presentation/common/widgets/bottom_navigation/custom_bottom_navigation.dart';
import 'package:warranty_saver/di/di.dart';
import 'package:warranty_saver/feature/main_page_container/domain/cubit/main_page_cubit.dart';
import 'package:warranty_saver/feature/main_page_container/domain/cubit/main_page_state.dart';

class MainPageContainer extends StatefulWidget {
  final Widget child;
  const MainPageContainer({super.key, required this.child});

  @override
  State<MainPageContainer> createState() => _MainPageContainerState();
}

class _MainPageContainerState extends State<MainPageContainer> {
  late final MainPageCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<MainPageCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              top: kToolbarHeight,
              child: BlocBuilder<MainPageCubit, MainPageState>(
                bloc: _cubit,
                builder: (context, state) {
                  if (state is MainPageStateInitial) {
                    return widget.child;
                  } else if (state is MainPageStateLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is MainPageStateReady) {
                    return Center(
                      child: Text('Page ready', style: TextStyle(color: Colors.white)),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomBottomNavigation(
                page: _cubit.state.page,
                onPageChanged: _cubit.changePage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
