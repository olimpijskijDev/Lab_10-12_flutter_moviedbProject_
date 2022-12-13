import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:kinoapp/resources/resources.dart';

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie(
      {required this.id,
      required this.imageName,
      required this.title,
      required this.time,
      required this.description});
}

class MovieListWidget extends StatefulWidget {
  MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
        id: 1,
        imageName: AppImages.animeGirl,
        title: 'Anime girls',
        time: 'December 8',
        description:
            'Get access to maintain your own custom personal lists, track what you'
            've seen and search and filter for what to watch next—regardless if it'
            's in theatres, on TV or available on popular streaming services like Netflix, Amazon Prime Video, Disney Plus, and Canal+.'),
    Movie(
        id: 2,
        imageName: AppImages.animeGirl,
        title: 'Anime mans',
        time: 'December 8',
        description:
            'Get access to maintain your own custom personal lists, track what you'
            've seen and search and filter for what to watch next—regardless if it'
            's in theatres, on TV or available on popular streaming services like Netflix, Amazon Prime Video, Disney Plus, and Canal+.'),
    Movie(
        id: 3,
        imageName: AppImages.animeGirl,
        title: 'Vikings',
        time: 'December 8',
        description:
            'Get access to maintain your own custom personal lists, track what you'
            've seen and search and filter for what to watch next—regardless if it'
            's in theatres, on TV or available on popular streaming services like Netflix, Amazon Prime Video, Disney Plus, and Canal+.'),
  ];

  var _filterMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filterMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filterMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _searchMovies();
    _filterMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  void _onMovieTab(int index) {
    final id = _filterMovies[index].id;
    Navigator.of(context)
        .pushNamed('/second_screen/movie_details', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top: 75),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: _filterMovies.length,
          itemExtent: 163,
          itemBuilder: ((context, index) {
            final movie = _filterMovies[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8.0,
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border:
                            Border.all(color: Colors.black.withOpacity(0.2))),
                    child: Row(
                      children: [
                        Image(image: AssetImage(movie.imageName)),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  movie.title,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  movie.time,
                                  style: TextStyle(color: Colors.grey),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  movie.description,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => _onMovieTab(index),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: OutlineInputBorder(),
              labelText: 'Поиск',
            ),
          ),
        ),
      ],
    );
  }
}
