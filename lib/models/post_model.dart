class Post {

  String title;
  String description;
  String image;
  String author;
  String avatar;
  String topic;
  String comments;
  String upvotes;
  String downvotes;

  Post({this.title, this.description, this.image, this.author, this.avatar,
      this.topic, this.comments, this.upvotes, this.downvotes});

  factory Post.fromMap(Map<String, dynamic> val){
    return Post(
      title: val['title'],
      author: val['author'],
      topic: val['topic'],
      description: val['description'],
      avatar: val['avatar'],
      image: val['image'],
      upvotes: val['upvotes'],
      downvotes: val['downvotes'],
      comments: val['comments'],
    );
  }

  Map<String, dynamic> toMap() => {
    'title': title,
    'description': description,
    'image': image,
    'author': author,
    'avatar': avatar,
    'topic': topic,
    'comments': comments,
    'upvotes': upvotes,
    'downvotes': downvotes,
  };

}

List<Post> fetchedPostList = [];
List<Post> offlineFetchedList = [];