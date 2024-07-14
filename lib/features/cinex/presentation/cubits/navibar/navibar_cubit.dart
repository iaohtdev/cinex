import 'package:bloc/bloc.dart';

class NaviBarCubit extends Cubit<int> {
  NaviBarCubit() : super(0);

  void updateIndex(int index) {
    emit(index);
  }
}
