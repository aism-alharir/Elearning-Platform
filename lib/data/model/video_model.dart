class VideoModel {
  int? id;
  String? course;
  String? title;
  String? image;
  int? order;
  String? videoUrl;

  VideoModel(
      {this.id,
      this.course,
      this.title,
      this.image,
      this.order,
      this.videoUrl});

  VideoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    course = json['course'];
    title = json['title'];
    image = json['image'];
    order = json['order'];
    videoUrl = json['video_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['course'] = this.course;
    data['title'] = this.title;
    data['image'] = this.image;
    data['order'] = this.order;
    data['video_url'] = this.videoUrl;
    return data;
  }
}