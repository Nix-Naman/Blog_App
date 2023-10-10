import 'package:blog_app/logic/cubits/blog_cubit/blog_cubit.dart';
import 'package:blog_app/logic/cubits/fav_cubit/fav_cubit.dart';
import 'package:blog_app/ui/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(BlogApp());
}

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BlogCubit(),
        ),
        BlocProvider(
          create: (context) => FavCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
