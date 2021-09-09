part of 'widget.dart';

class UpComingWidget extends StatelessWidget {
  final Movie movie;
  final Function onTap;

  const UpComingWidget({Key key, this.movie, this.onTap}) : super(key: key);

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
          height: 160,
          width: 120,
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
          ]),
        ),
      ),
    );
  }
}
