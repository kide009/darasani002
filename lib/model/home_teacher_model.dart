class HomeTeacherModel {
  const HomeTeacherModel({
    this.image,
    this.nameTitle,
    this.subject,
    this.form,
    this.time,
  });

  final image;
  final nameTitle;
  final subject;
  final form;
  final time;
}

List<HomeTeacherModel> homeTeacher = const [
  HomeTeacherModel(
      image: "assets/teacher1.jpg",
      nameTitle: "Joseph   Masanja",
      subject: "Maths, Physics, Chemistr",
      form: "Form I, Form II, Form IV",
      time: "Tzs 2000 /hr "),
  HomeTeacherModel(
      image: "assets/teacher2.jpg",
      nameTitle: "Olivah  Nelson",
      subject: "Maths, Physics, Chemistr",
      form: "Form I, Form II, Form IV",
      time: "Tzs 2000 /hr "),
  HomeTeacherModel(
      image: "assets/teacher1.jpg",
      nameTitle: "Joseph   Masanja",
      subject: "Maths, Physics, Chemistr",
      form: "Form I, Form II, Form IV",
      time: "Tzs 2000 /hr "),
  HomeTeacherModel(
      image: "assets/teacher2.jpg",
      nameTitle: "Olivah  Nelson",
      subject: "Maths, Physics, Chemistr",
      form: "Form I, Form II, Form IV",
      time: "Tzs 2000 /hr "),
  HomeTeacherModel(
      image: "assets/teacher1.jpg",
      nameTitle: "Joseph   Masanja",
      subject: "Maths, Physics, Chemistr",
      form: "Form I, Form II, Form IV",
      time: "Tzs 2000 /hr "),
  HomeTeacherModel(
      image: "assets/teacher2.jpg",
      nameTitle: "Olivah  Nelson",
      subject: "Maths, Physics, Chemistr",
      form: "Form I, Form II, Form IV",
      time: "Tzs 2000 /hr "),
];

List<HomeTeacherModel> get homeTeacherList => homeTeacher;

// final SponsoreAddHomeModel? sponsore;
//
// const SponsoredAdsWidget({Key? key, this.sponsore}) : super(key:
