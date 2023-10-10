import 'package:blog_app/logic/cubits/blog_cubit/blog_cubit.dart';
import 'package:blog_app/logic/cubits/blog_cubit/blog_state.dart';
import 'package:blog_app/ui/screens/detail_screen.dart';
import 'package:blog_app/ui/screens/fav_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFEEEEEE),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => FavScreen(),
              )),
          label: Text("Favourites"),
          icon: Icon(
            Icons.favorite,
          ),
          backgroundColor: Colors.redAccent,
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Blog App",
                    style: GoogleFonts.comfortaa(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Card(
                    elevation: 5,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image: AssetImage("assets/profile.jpg"),
                              fit: BoxFit.contain)),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.transparent,
              ),
              Container(
                height: _height * .835,
                child: BlocBuilder<BlogCubit, BlogState>(
                  builder: (context, state) {
                    if (state is BlogLoadingState) {
                      return Center(
                        child: Lottie.asset("assets/loading.json",
                            height: _height * .2,
                            width: _width * .75,
                            fit: BoxFit.cover),
                      );
                    }
                    if (state is BlogLoadedState) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.blogs.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
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
                                      id: state.blogs[index].id.toString(),
                                      title:
                                          state.blogs[index].title.toString(),
                                      imgUrl: state.blogs[index].imageUrl
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
                                                  .blogs[index].imageUrl
                                                  .toString()),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      VerticalDivider(
                                          color: Colors.transparent),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            width: _width * .52,
                                            child: Text(
                                              state.blogs[index].title
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
                    return Center(
                      child: Text("Something went Wrong!"),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
