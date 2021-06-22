class Election {
  String designation;
  String name;
  String locality;
  String from;
  String to;
  String startTime;
  String endTime;
  String description;
  bool liveResults;
  List rejectedCandidates;

  Election({
    this.designation,
    this.name,
    this.locality,
    this.from,
    this.to,
    this.startTime,
    this.endTime,
    this.description,
    this.liveResults,
    this.rejectedCandidates,
  });
}
