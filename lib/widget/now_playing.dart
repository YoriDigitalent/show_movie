part of 'widget.dart';

class NowPlayingWidget extends StatelessWidget {
  final Movie movie;
  final Function onTap;

  const NowPlayingWidget({Key key, this.movie, this.onTap}) : super(key: key);

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
          height: 300,
          width: 150,
          child: Column(children: <Widget>[
            Container(
              height: 200,
              width: 150,
              decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: NetworkImage(
                          imageBaseUrl + "w500" + (movie.posterPath)),
                      fit: BoxFit.cover)),
            ),
            Container(
              height: 100,
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      movie.title,
                      style: blueTextFont.copyWith(fontSize: 12),
                      textAlign: TextAlign.left,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Release " + movie.releaseDate,
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
