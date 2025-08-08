import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warranty_saver/feature/main_page_container/domain/cubit/main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit() : super(const MainPageState.initial(page: 0));

  void changePage(int page) {
    final currState = state;
    if (currState is MainPageStateReady) {
      emit(MainPageStateReady(page: page));
      return;
    }

    emit(currState.copyWith(page: page));
  }
}
