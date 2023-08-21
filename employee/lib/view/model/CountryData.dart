
class CountryData {
  List<Countries>? countries;

  CountryData({this.countries});

  fromJson(Map<String, dynamic> json) {
    if (json['Countries'] != null) {
      countries = <Countries>[];
      json['Countries'].forEach((v) {
        countries!.add(Countries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (countries != null) {
      data['Countries'] = countries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Countries {
  List<States>? states;
  String? countryName;

  Countries({this.states, this.countryName});

  Countries.fromJson(Map<String, dynamic> json) {
    if (json['States'] != null) {
      states = <States>[];
      json['States'].forEach((v) {
        states!.add(States.fromJson(v));
      });
    }
    countryName = json['CountryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (states != null) {
      data['States'] = states!.map((v) => v.toJson()).toList();
    }
    data['CountryName'] = countryName;
    return data;
  }

  @override
  String toString() {
    return countryName!;
  }
}

class States {
  List<String>? cities;
  String? stateName;

  States({this.cities, this.stateName});

  States.fromJson(Map<String, dynamic> json) {
    cities = json['Cities'].cast<String>();
    stateName = json['StateName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Cities'] = cities;
    data['StateName'] = stateName;
    return data;
  }
}
