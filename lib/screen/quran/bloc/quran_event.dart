abstract class QuranEvent {}

class GetPage extends QuranEvent {
  final int quranPage;
  final int index;

  GetPage({required this.quranPage, required this.index});
}




