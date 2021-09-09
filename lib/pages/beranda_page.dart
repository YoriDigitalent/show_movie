part of 'pages.dart';

class BerandaPage extends StatefulWidget {
  final Movie movie;
  const BerandaPage({Key key, this.movie}) : super(key: key);

  @override
  _BerandaPageState createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  List movie = [];
  List ori = [];
  TextEditingController textQuery = new TextEditingController();

  void loadData() async {
    List<Movie> movie = await MovieServices.getMovies(1);
    movie = movie;
    ori = movie;
    setState(() {});
  }

  void search(String query) {
    if (query.isEmpty) {
      movie = ori;
      setState(() {});
      return;
    }

    query = query.toLowerCase();
    print(query);
    List result = [];
    movie.forEach((p) {
      var placename = p["placename"].toString().toLowerCase();
      if (placename.contains(query)) {
        result.add(p);
      }
    });

    movie = result;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Movie Javan'),
          backgroundColor: mainColor,
        ),
        drawer: DrawerWidget(),
        body: SafeArea(
            child: ListView(children: <Widget>[
          Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                      controller: textQuery,
                      onChanged: search,
                      decoration: InputDecoration(
                          hintText: "Cari Movie",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: mainColor)),
                          prefixIcon: Icon(Icons.search, color: mainColor),
                          suffixIcon: IconButton(
                              onPressed: () {
                                textQuery.text = '';
                                search(textQuery.text);
                              },
                              icon: Icon(Icons.clear, color: mainColor)))),
                  // NOTE: NOW PLAYING
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        defaultMargin, 30, defaultMargin, 12),
                    child: Text(
                      "Now Playing",
                      style: blackTextFont.copyWith(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: BlocBuilder<MovieBloc, MovieState>(
                      builder: (_, movieState) {
                        if (movieState is MovieLoaded) {
                          List<Movie> movies = movieState.movies.sublist(0, 10);

                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: movies.length,
                              itemBuilder: (_, index) => Container(
                                    margin: EdgeInsets.only(
                                        left: (index == 0) ? defaultMargin : 0,
                                        right: (index == movies.length - 1)
                                            ? defaultMargin
                                            : 10),
                                    child: NowPlayingWidget(
                                      movie: movies[index],
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MovieDetailPage(
                                                        movies[index])));
                                      },
                                    ),
                                  ));
                        } else {
                          return SpinKitFadingCircle(
                            color: mainColor,
                            size: 50,
                          );
                        }
                      },
                    ),
                  ),

                  // note: UPCOMING
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        defaultMargin, 30, defaultMargin, 12),
                    child: Text(
                      "UpComing",
                      style: blackTextFont.copyWith(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 160,
                    child: BlocBuilder<MovieBloc, MovieState>(
                      builder: (_, movieState) {
                        if (movieState is MovieLoaded) {
                          List<Movie> movies = movieState.movies.sublist(10);

                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: movies.length,
                              itemBuilder: (_, index) => Container(
                                    margin: EdgeInsets.only(
                                        left: (index == 0) ? defaultMargin : 0,
                                        right: (index == movies.length - 1)
                                            ? 5
                                            : 5),
                                    child: UpComingWidget(movie: movies[index]),
                                  ));
                        } else {
                          return SpinKitFadingCircle(
                            color: mainColor,
                            size: 50,
                          );
                        }
                      },
                    ),
                  ),
                  // note: TOP RATED
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        defaultMargin, 30, defaultMargin, 12),
                    child: Text(
                      "Top Rated",
                      style: blackTextFont.copyWith(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 220,
                    child: BlocBuilder<MovieBloc, MovieState>(
                      builder: (_, movieState) {
                        if (movieState is MovieLoaded) {
                          List<Movie> movies = movieState.movies.sublist(10);

                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: movies.length,
                              itemBuilder: (_, index) => Container(
                                    margin: EdgeInsets.only(
                                        left: (index == 0) ? defaultMargin : 0,
                                        right: (index == movies.length - 1)
                                            ? 5
                                            : 5),
                                    child: TopRatedWidget(movie: movies[index]),
                                  ));
                        } else {
                          return SpinKitFadingCircle(
                            color: mainColor,
                            size: 50,
                          );
                        }
                      },
                    ),
                  ),
                ],
              )),
        ])));
  }
}
