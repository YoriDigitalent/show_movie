part of 'widget.dart';

class TopRatedWidget extends StatelessWidget {
  final Movie movie;
  final Function onTap;

  const TopRatedWidget({Key key, this.movie, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Card(
        margin: EdgeInsets.only(left: defaultMargin, right: defaultMargin),
        child: Container(
          height: 220,
          width: 150,
          child: Column(children: <Widget>[
            Container(
              height: 160,
              width: 120,
              decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: NetworkImage(
                          imageBaseUrl + "w500" + (movie.posterPath)),
                      fit: BoxFit.cover)),
            ),
            Container(
              height: 60,
              width: 150,
              margin: EdgeInsets.only(left: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Popularity " + movie.popularity.toString(),
                    style: greyTextFont.copyWith(fontSize: 10),
                  ),
                  Text(
                    "Rating:  " + movie.voteAverage.toString() + "/10",
                    style: greyTextFont.copyWith(fontSize: 10),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
