part of 'widget.dart';

class CreditCard extends StatelessWidget {
  final Credit credit;

  CreditCard(this.credit);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 70,
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            width: 70,
            decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.circular(8),
                image: (credit.profilePath == null)
                    ? null
                    : DecorationImage(
                        image: NetworkImage(
                            imageBaseUrl + "w185" + credit.profilePath),
                        fit: BoxFit.cover)),
          ),
          Container(
            margin: EdgeInsets.only(top: 6),
            width: 70,
            height: 20,
            child: Text(
              credit.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.clip,
              style: blackTextFont.copyWith(
                  fontSize: 8, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
