import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:zikr_uz/screen/dua/widget/duo_widget.dart';
import 'package:zikr_uz/utils/my_utils.dart';

class DuaScreen extends StatefulWidget {
  const DuaScreen({super.key});

  @override
  State<DuaScreen> createState() => _DuaScreenState();
}

class _DuaScreenState extends State<DuaScreen> {
  final TextEditingController searchWord = TextEditingController();
  late PdfViewerController _pdfViewerController;
  late PdfTextSearchResult _searchResult;

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    _searchResult = PdfTextSearchResult();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Duolar'),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                              content: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.16,
                            width: MediaQuery.of(context).size.height * 0.9,
                            child: Column(
                              children: [
                                TextField(
                                  controller: searchWord,
                                  decoration:
                                      getInputDecorationTwo(label: 'search'),
                                ),
                                SizedBox(
                                  height: height(context) * 0.02,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      _searchResult = _pdfViewerController
                                          .searchText(searchWord.text,
                                              searchOption: TextSearchOption
                                                  .caseSensitive);
                                      if (kIsWeb) {
                                        setState(() {});
                                      } else {
                                        _searchResult.addListener(() {
                                          if (_searchResult.hasResult) {
                                            setState(() {});
                                          }
                                        });
                                      }

                                      Navigator.pop(context);
                                    },
                                    child: const Text('Accept'))
                              ],
                            ),
                          )));
                }),
            Visibility(
              visible: _searchResult.hasResult,
              child: IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _searchResult.clear();
                  });
                },
              ),
            ),
            Visibility(
              visible: _searchResult.hasResult,
              child: IconButton(
                icon: const Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.white,
                ),
                onPressed: () {
                  _searchResult.previousInstance();
                },
              ),
            ),
            Visibility(
              visible: _searchResult.hasResult,
              child: IconButton(
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
                onPressed: () {
                  _searchResult.nextInstance();
                },
              ),
            ),
          ],
        ),
        body: DuoWidget(
          pdfViewerController: _pdfViewerController,
        ));
  }
}
