class MovieRatingModal {
  List<D>? d;
  String? q;
  int? v;

  MovieRatingModal({this.d, this.q, this.v});

  MovieRatingModal.fromJson(Map<String, dynamic> json) {
    if (json['d'] != null) {
      d = <D>[];
      json['d'].forEach((v) {
        d!.add(new D.fromJson(v));
      });
    }
    q = json['q'];
    v = json['v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.d != null) {
      data['d'] = this.d!.map((v) => v.toJson()).toList();
    }
    data['q'] = this.q;
    data['v'] = this.v;
    return data;
  }
}

class D {
  I? i;
  String? id;
  String? l;
  String? s;
  String? q;
  String? qid;
  int? rank;
  int? y;
  String? yr;

  D(
      {this.i,
      this.id,
      this.l,
      this.s,
      this.q,
      this.qid,
      this.rank,
      this.y,
      this.yr});

  D.fromJson(Map<String, dynamic> json) {
    i = json['i'] != null ? new I.fromJson(json['i']) : null;
    id = json['id'];
    l = json['l'];
    s = json['s'];
    q = json['q'];
    qid = json['qid'];
    rank = json['rank'];
    y = json['y'];
    yr = json['yr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.i != null) {
      data['i'] = this.i!.toJson();
    }
    data['id'] = this.id;
    data['l'] = this.l;
    data['s'] = this.s;
    data['q'] = this.q;
    data['qid'] = this.qid;
    data['rank'] = this.rank;
    data['y'] = this.y;
    data['yr'] = this.yr;
    return data;
  }
}

class I {
  int? height;
  String? imageUrl;
  int? width;

  I({this.height, this.imageUrl, this.width});

  I.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    imageUrl = json['imageUrl'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['imageUrl'] = this.imageUrl;
    data['width'] = this.width;
    return data;
  }
}
