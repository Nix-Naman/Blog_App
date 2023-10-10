import 'package:blog_app/data/model/blog_model.dart';
import 'package:blog_app/logic/cubits/fav_cubit/fav_cubit.dart';
import 'package:blog_app/logic/cubits/fav_cubit/fav_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  final String id;
  final String title;
  final String imgUrl;
  final String desc =
      "He was after the truth. At least, that's what he told himself. He believed it, but any rational person on the outside could see he was lying to himself. It was apparent he was really only after his own truth that he'd already decided and was after this truth because the facts didn't line up with the truth he wanted. So he continued to tell everyone he was after the truth oblivious to the real truth sitting right in front of him.";

  const DetailScreen(
      {super.key, required this.id, required this.title, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: BlocConsumer<FavCubit, FavState>(
        listener: (context, state) {
          if (state is AddingToFavState) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Blog Added To Favourites")));
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Color(0xFFEEEEEE),
            body: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  height: _height * .45,
                  width: _width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(imgUrl), fit: BoxFit.cover),
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Divider(color: Colors.transparent),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    title,
                    maxLines: 4,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.aBeeZee(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(color: Colors.transparent),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    desc,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.lato(fontSize: 18),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                BlocProvider.of<FavCubit>(context).addToFav(
                    BlogModel(id: id, imageUrl: imgUrl, title: title));
              },
              backgroundColor: Color(0xFFF1B4BB),
              child: Icon(
                Icons.favorite,
                color: Colors.redAccent,
              ),
            ),
          );
        },
      ),
    );
  }
}
