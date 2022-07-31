class CoachInfo {
  List<Results>? results;
  Info? info;

  CoachInfo({this.results, this.info});

  CoachInfo.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    if (info != null) {
      data['info'] = info!.toJson();
    }
    return data;
  }
}

class Results {
  String? gender;
  Name? name;
  String? email;
  String? phone;
  Picture? picture;
  late bool isClicked;

  Results({
    this.gender,
    this.name,
    this.email,
    this.phone,
    this.picture,
    this.isClicked = false,
  });

  Results.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;

    email = json['email'];

    phone = json['phone'];

    picture =
        json['picture'] != null ? Picture.fromJson(json['picture']) : null;

    isClicked = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['gender'] = gender;
    if (name != null) {
      data['name'] = name!.toJson();
    }

    data['email'] = email;

    data['phone'] = phone;

    if (picture != null) {
      data['picture'] = picture!.toJson();
    }
    return data;
  }
}

class Name {
  String? title;
  String? first;
  String? last;

  Name({this.title, this.first, this.last});

  Name.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    first = json['first'];
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['first'] = first;
    data['last'] = last;
    return data;
  }
}

class Picture {
  String? large;
  String? medium;
  String? thumbnail;

  Picture({this.large, this.medium, this.thumbnail});

  Picture.fromJson(Map<String, dynamic> json) {
    large = json['large'];
    medium = json['medium'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['large'] = large;
    data['medium'] = medium;
    data['thumbnail'] = thumbnail;
    return data;
  }
}

class Info {
  String? seed;
  int? results;
  int? page;
  String? version;

  Info({this.seed, this.results, this.page, this.version});

  Info.fromJson(Map<String, dynamic> json) {
    seed = json['seed'];
    results = json['results'];
    page = json['page'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['seed'] = seed;
    data['results'] = results;
    data['page'] = page;
    data['version'] = version;
    return data;
  }
}
