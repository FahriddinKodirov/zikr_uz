abstract class QuranState {}

class QuranInitial extends QuranState {}

class QuransLoadInSuccess extends QuranState {
  final int quranPage;
  final int index;
  
  QuransLoadInSuccess({required this.quranPage, required this.index});

}
