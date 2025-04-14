import 'package:flutter/material.dart';
import 'package:notes_proj/features/home_note/views/widget/custom_list_view_widget.dart';
import 'package:notes_proj/features/home_note/views/widget/def_bottom_sheet.dart';
import '../../../core/widgets/custom_app_bar.dart';

class HomeNoteView extends StatelessWidget {
  const HomeNoteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              CustomAppBar(
                text: "Notes",
                onPress: () {},
                iconButton: Icons.search_outlined,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const Column(
                      children: [CustomListViewWidget(), SizedBox(height: 16)],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder:(context) => const DefaultBottomSheet(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
