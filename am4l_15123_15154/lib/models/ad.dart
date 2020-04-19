class Ad {
  final String concerned;
  final String date;
  final String title;
  final String description;

  Ad({this.concerned, this.date, this.description, this.title});

  factory Ad.fromJSON(Map<String,dynamic> json) {
    return Ad(
      concerned: json["concerned"],
      date: json["date"],
      title: json["title"],
      description: json["description"],
    );
  }

}