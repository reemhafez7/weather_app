class StoryModel{
   int? id;
   String? title,image,video;

  StoryModel(this.id, this.title,this.image, this.video);

  StoryModel.fromJson(Map<String, dynamic>map){
    this.id= map['id'];
    this.title= map['title'];
    this.image= map['image']['url'];
    this.video= map['video']['url'];

  }

}