import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_proj/core/resources/app_color.dart';
import 'package:notes_proj/features/home_note/views/widget/list_view_builder.dart';
import '../../../core/helper/my_navigator_app.dart';
import '../../../core/helper/notify_app.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../add_note/views/add_note_view.dart';
import '../logic/home_note_cubit.dart';

class HomeNoteView extends StatelessWidget {
  const HomeNoteView({super.key,});

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
             const Expanded(
                child:
                ListViewBuilder(),
              ),
              TextButton(
                style:TextButton.styleFrom(
                  padding:const EdgeInsetsDirectional.symmetric(horizontal: 24),
                  backgroundColor: AppColor(context).whiteColor,
                ),
                  onPressed: () async {
                    final cubit=BlocProvider.of<HomeNoteCubit>(context);
                    AppNotify.showErrorDialog(
                      message: "you Want to delete the All Notes ",
                      context: context,
                      onPressed: ()  async {
                        AppNavigator.navigatorPop(context: context);
                        await cubit.clear();
                        cubit.geDataNote();
                      },
                    );
                    cubit.geDataNote();
                  },
                  child: Text("Clear All",
                    style: TextStyle(
                    color: AppColor(context).blackColor,
                      fontSize: 18
                  ),)
                ,),
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
