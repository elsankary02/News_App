import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/constant.dart';
import 'package:news_app/features/presentation/home/data/manger/featch_search_tabs/featch_search_tabs_cubit.dart';

class TextFiledWidget extends StatelessWidget {
  const TextFiledWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      onSubmitted: (value) {
        BlocProvider.of<FetchSearchTebsCubit>(context)
            .fetchSearch(category: value);
      },
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.lightGrey,
        hintText: 'Search',
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(
          FontAwesomeIcons.magnifyingGlass,
          color: theme.primaryColor,
        ),
        suffixIcon: Icon(
          FontAwesomeIcons.sliders,
          color: theme.primaryColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.lightGrey),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.lightGrey,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
