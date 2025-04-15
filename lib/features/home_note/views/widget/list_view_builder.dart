import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../add_note/data/model.dart';
import '../../logic/home_note_cubit.dart';
import '../../logic/home_note_state.dart';
import 'custom_list_view_widget.dart';

class ListViewBuilder extends StatefulWidget{
  const ListViewBuilder({super.key});

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  @override
  initState() {
    BlocProvider.of<HomeNoteCubit>(context).geDataNote();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeNoteCubit, HomeNoteState>(
      builder: (context, state) {
        List <AddNoteModel> note = BlocProvider.of<HomeNoteCubit>(context).note! ;
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount:note.length ,
          itemBuilder: (context, index) {
            return Column(
              children: [
                CustomListViewWidget(note:note[index],),
                const SizedBox(height: 16),
              ],
            );
          },
        );
      },
    );
  }
}