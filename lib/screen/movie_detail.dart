import 'package:flutter/material.dart';
import '../model/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie selectedMovie; //1

  const MovieDetail({Key? key, required this.selectedMovie})
      : super(key: key); //2

  @override
  Widget build(BuildContext context) {
    String path; //3
    double screenHeight =
        MediaQuery.of(context).size.height; //ambil tinggi layar

    if (selectedMovie.posterPath != null) {
      path = 'https://image.tmdb.org/t/p/w500/${selectedMovie.posterPath}'; //4
    } else {
      //5
      path =
          'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('${selectedMovie.title}'), //6
        ),
        body: SingleChildScrollView(
          //menambahkan fitur scroll
          child: Center(
            //menempatkan widget agar di tengah
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16), //menambahkan padding
                    height: screenHeight / 1.5, //tinggi gambar
                    child: Image.network(path),
                  ), //7
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${selectedMovie.overview}'),
                  ), //8
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Rate: ${selectedMovie.voteAverage}'),
                        Expanded(
                          child: Container(),
                        ),
                        Text('Release: ${selectedMovie.releaseDate}'),
                      ],
                    ),
                  ),
                  Text('Created by Budi Santoso, NIM: 001'),
                ],
              ),
            ),
          ),
        ));
  }
}
