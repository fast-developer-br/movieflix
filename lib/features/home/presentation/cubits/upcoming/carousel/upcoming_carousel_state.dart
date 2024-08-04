part of 'upcoming_carousel_cubit.dart';

sealed class UpcomingCarouselState extends Equatable {
  final int currentIndex;
  const UpcomingCarouselState({required this.currentIndex});

  @override
  List<Object> get props => [currentIndex];
}

final class UpcomingCarouselInitial extends UpcomingCarouselState {
  const UpcomingCarouselInitial({required super.currentIndex});
}
