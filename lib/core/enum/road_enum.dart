enum RoadEnum {
  root("/"),
  main("main"),
  searchTour("search-tour"),
  myTour("my-tour"),
  notification("notification"),
  profile("profile"),
  signIn("sing-in"),
  tourList("tour-list"),
  tourInfo("tour-Info"),
  tourDetail("tour-detail"),
  tourRegistration("tour-registration"),
  chooseSeat("choose-seat"),
  payment("payment"),
  connectWithUs("connect-with-us");

  const RoadEnum(this.path);
  final String path;
}
