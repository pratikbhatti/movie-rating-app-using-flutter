import 'package:demo35/screens/movie/modal/movie_rating_modal.dart';
import 'package:demo35/screens/search/controller/search_controller.dart';
import 'package:demo35/screens/utility/apis/api_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  SearchController searchController = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<MovieRatingModal?>(
        future: ApiCall().getData(searchController.search.value),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            List<D>? l1 = snapshot.data!.d;
            return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 1.7,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          "${l1![index].i!.imageUrl}",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Divider(
                        color: Colors.orange,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Rating :- ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            "${l1[index].rank}",
                            style: TextStyle(
                                color: Colors.orangeAccent, fontSize: 15),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.orange,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "year :- ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            "${l1[index].y}",
                            style: TextStyle(
                                color: Colors.orangeAccent, fontSize: 15),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.orange,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "heroes :- ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              "${l1[index].s}",
                              style: TextStyle(
                                  color: Colors.orangeAccent, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.orange,
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
