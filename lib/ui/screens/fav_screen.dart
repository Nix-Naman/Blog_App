import 'package:blog_app/logic/cubits/fav_cubit/fav_cubit.dart';
import 'package:blog_app/logic/cubits/fav_cubit/fav_state.dart';
import 'package:blog_app/ui/screens/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFEEEEEE),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Favourite Blogs",
            style: GoogleFonts.comfortaa(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: BlocBuilder<FavCubit, FavState>(
          builder: (context, state) {
            if (state is AddingToFavState) {
              print(state.FavBlogs.length);
              return state.FavBlogs.length == 0
                  ? Center(
                      child: Text(
                        "Nothing in favorites",
                        style: GoogleFonts.lato(fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.FavBlogs.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Card(
                          elevation: 5,
                          shadowColor: Colors.redAccent.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => DetailScreen(
                                    id: state.FavBlogs[index].id.toString(),
                                    title:
                                        state.FavBlogs[index].title.toString(),
                                    imgUrl: state.FavBlogs[index].imageUrl
                                        .toString()),
                              ),
                            ),
                            child: Container(
                              height: _height * .16,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFF1EFEF),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      height: _height * .18,
                                      width: _width * .32,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xFFF1B4BB),
                                          image: DecorationImage(
                                            image: NetworkImage(state
                                                .FavBlogs[index].imageUrl
                                                .toString()),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    VerticalDivider(color: Colors.transparent),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          width: _width * .52,
                                          child: Text(
                                            state.FavBlogs[index].title
                                                .toString(),
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.lato(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Text(
                                          "Jan 12  | 8 Min read",
                                          style: GoogleFonts.lato(
                                              fontSize: 16,
                                              color: Colors.black45),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
