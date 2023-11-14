class LiveClassModel {
  const LiveClassModel({
    this.image,
    this.dp,
    this.name,
    this.discription,
  });

  final image;
  final dp;
  final name;
  final discription;
}

List<LiveClassModel> liveClass = const [
  LiveClassModel(
    image: "assets/thumb.png",
    dp: "assets/_TeacherPhoto.png",
    name: "Kartik",
    discription: "Nike Air Max 270 React ENGfgfgf  ddfdfdf",
  ),
  LiveClassModel(
    image: "assets/Frame 1171274813 (3).png",
    dp: "assets/_TeacherPhoto.png",
    name: "Kartik",
    discription: "Nike Air Max 270 React ENGfgfgf  ddfdfdf",
  ),
  LiveClassModel(
    image: "assets/Frame 1171274813 (4).png",
    dp: "assets/_TeacherPhoto.png",
    name: "Kartik",
    discription: "Nike Air Max 270 React ENGfgfgf  ddfdfdf",
  ),
  LiveClassModel(
    image: "assets/Frame 1171274813 (5).png",
    dp: "assets/_TeacherPhoto.png",
    name: "Kartik",
    discription: "Nike Air Max 270 React ENGfgfgf  ddfdfdf",
  ),
];

List<LiveClassModel> get liveClassList => liveClass;
