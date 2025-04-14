import 'package:flutter/material.dart';
import 'package:notes_proj/features/home_note/views/widget/custom_list_view_widget.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../add_note/views/add_note_view.dart';

class HomeNoteView extends StatelessWidget {
  const HomeNoteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            spacing: 10,
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
                      children: [
                        CustomListViewWidget(),
                        SizedBox(height: 16),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: const AddNoteView(),
    );
  }
}
