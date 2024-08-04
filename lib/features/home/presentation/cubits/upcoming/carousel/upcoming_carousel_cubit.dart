import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'upcoming_carousel_state.dart';

class UpcomingCarouselCubit extends Cubit<UpcomingCarouselState> {
  UpcomingCarouselCubit()
      : super(const UpcomingCarouselInitial(currentIndex: 0));

  setIndex(int index) {
    emit(UpcomingCarouselInitial(currentIndex: index));
  }
}
