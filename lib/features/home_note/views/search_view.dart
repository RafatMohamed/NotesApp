import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_proj/features/home_note/logic/home_note_cubit.dart';
import 'package:notes_proj/features/home_note/logic/home_note_state.dart';
import 'package:notes_proj/features/home_note/views/widget/custom_list_view_widget.dart';

import '../../../core/constant/app_constant.dart';
import '../../../core/data/model.dart';
import '../../../core/helper/my_navigator_app.dart';
import '../../../core/helper/notify_app.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_text_form_field_widget.dart';
import '../../edite_note/views/edit_note_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key, required this.cubit});
  final HomeNoteCubit cubit;

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: BlocBuilder<HomeNoteCubit, HomeNoteState>(
            builder: (context, state) {
              if (state is HomeNoteLoading) {
                return AppNotify.circularProgress();
              }

              List<NoteModel> filteredNotes = [];
              if (state is HomeNoteSearchSuccess) {
                filteredNotes = state.notes;
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBar(text: "Search"),
                  const SizedBox(height: 12),
                  if (widget.cubit.isSearch)
                    TextFormFieldApp(
                      controller: widget.cubit.searchController,
                      textInputAction: TextInputAction.search,
                      labelText: 'Search Notes',
                      labelColor: kPrimaryColor,
                      hintText: 'Enter title...',
                      onChange: (value) {
                        widget.cubit.searchNote(value);
                      },
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          setState(() {
                            widget.cubit.searchController.clear();
                            widget.cubit.resetSearch();
                          });
                        },
                      ),
                      onFieldSubmitted: (p0) {
                        widget.cubit.geDataNote();
                        Navigator.pop(context, true);
                      },

                    ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: filteredNotes.isEmpty
                        ? const Center(child: Text("No notes match your search."))
                        : ListView.separated(
                      itemCount: filteredNotes.length,
                      separatorBuilder: (context, index)  => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        return CustomListViewWidget(
                          isShow: true,
                          note: filteredNotes[index],
                          index: index,
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

}
