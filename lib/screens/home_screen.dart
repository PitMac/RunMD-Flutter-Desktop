import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown_editor/widgets/side_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 35),
        child: SideBar(),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: textController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write your md text here...',
                  ),
                  maxLines: null,
                  onChanged: (query) {
                    setState(() {});
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Markdown(
                data: textController.text,
                styleSheet: MarkdownStyleSheet(
                  h1: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            tooltip: 'Copy',
            onPressed: textController.text != ""
                ? () {
                    Clipboard.setData(ClipboardData(text: textController.text));
                  }
                : null,
            backgroundColor: textController.text != ""
                ? ThemeData.dark().primaryColor
                : ThemeData.dark().backgroundColor,
            child: const Icon(Icons.copy),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            tooltip: 'Download',
            onPressed: textController.text != ""
                ? () {
                    Clipboard.setData(ClipboardData(text: textController.text));
                  }
                : null,
            backgroundColor: textController.text != ""
                ? ThemeData.dark().primaryColor
                : ThemeData.dark().backgroundColor,
            child: const Icon(Icons.download),
          ),
        ],
      ),
    );
  }
}
