// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';

class Movie {
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}

class MovieListWidget extends StatefulWidget {

  MovieListWidget({Key? key}) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
      imageName: AppImages.title,
      title: 'Співай 2',
      time: '15 грудня 2021',
      description:
          'Уперше за всю кіноісторію Людини-павука улюбленого супергероя викрито. Пітер Паркер більше не в змозі поєднувати звичайне життя та супергеройські обов’язки. Щоб повернути все назад, він звертається за допомогою до Доктора Стренджа.',
    ),
    Movie(
      imageName: AppImages.title,
      title: 'Мисливці на привидів: З того світу',
      time: '15 грудня 2021',
      description:
          'Уперше за всю кіноісторію Людини-павука улюбленого супергероя викрито. Пітер Паркер більше не в змозі поєднувати звичайне життя та супергеройські обов’язки. Щоб повернути все назад, він звертається за допомогою до Доктора Стренджа.',
    ),
    Movie(
      imageName: AppImages.title,
      title: 'Людина-павук: Додому шляху нема',
      time: '15 грудня 2021',
      description:
          'Уперше за всю кіноісторію Людини-павука улюбленого супергероя викрито. Пітер Паркер більше не в змозі поєднувати звичайне життя та супергеройські обов’язки. Щоб повернути все назад, він звертається за допомогою до Доктора Стренджа.',
    ),
    Movie(
      imageName: AppImages.title,
      title: 'Енканто: Світ магії',
      time: '15 грудня 2021',
      description:
          'Уперше за всю кіноісторію Людини-павука улюбленого супергероя викрито. Пітер Паркер більше не в змозі поєднувати звичайне життя та супергеройські обов’язки. Щоб повернути все назад, він звертається за допомогою до Доктора Стренджа.',
    ),
    Movie(
      imageName: AppImages.title,
      title: 'Оселя зла: Вітаємо у Раккун-Сіті',
      time: '15 грудня 2021',
      description:
          'Уперше за всю кіноісторію Людини-павука улюбленого супергероя викрито. Пітер Паркер більше не в змозі поєднувати звичайне життя та супергеройські обов’язки. Щоб повернути все назад, він звертається за допомогою до Доктора Стренджа.',
    ),
    Movie(
      imageName: AppImages.title,
      title: 'Вічні',
      time: '15 грудня 2021',
      description:
          'Уперше за всю кіноісторію Людини-павука улюбленого супергероя викрито. Пітер Паркер більше не в змозі поєднувати звичайне життя та супергеройські обов’язки. Щоб повернути все назад, він звертається за допомогою до Доктора Стренджа.',
    ),
    Movie(
      imageName: AppImages.title,
      title: 'Матриця: Воскресіння',
      time: '15 грудня 2021',
      description:
          'Уперше за всю кіноісторію Людини-павука улюбленого супергероя викрито. Пітер Паркер більше не в змозі поєднувати звичайне життя та супергеройські обов’язки. Щоб повернути все назад, він звертається за допомогою до Доктора Стренджа.',
    ),
    Movie(
      imageName: AppImages.title,
      title: 'Веном 2: Карнаж',
      time: '15 грудня 2021',
      description:
          'Уперше за всю кіноісторію Людини-павука улюбленого супергероя викрито. Пітер Паркер більше не в змозі поєднувати звичайне життя та супергеройські обов’язки. Щоб повернути все назад, він звертається за допомогою до Доктора Стренджа.',
    ),
  ];

  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if(query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {
      
    });
  }

  @override
  void initState() {
    super.initState();

    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top: 70),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: _filteredMovies.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            final movie = _filteredMovies[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(0.2)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Image(image: AssetImage(movie.imageName)),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Text(
                                movie.title,
                                style: TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 5),
                              Text(
                                movie.time,
                                style: TextStyle(color: Colors.grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 20),
                              Text(
                                movie.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        )
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          print('Hello');
                        }),
                  ),
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Пошук',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
