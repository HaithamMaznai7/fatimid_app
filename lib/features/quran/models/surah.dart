class Surah {
  Surah(this.id, this.name, this.nameEn, this.nameEnTranslate, this.ayahsNumber, this.revelationType);

  static fromApi({required dynamic surah, bool isList = false}) {
    if(surah.runtimeType == Map<String,dynamic>) {
      return Surah(
        surah['number'],
        surah['name'],
        surah['englishName'],
        surah['englishNameTranslation'],
        surah['numberOfAyahs'],
        surah['revelationType'],
      );
    }
    else{
      List<Surah> all = [];
      for(Map map in surah){
        all.add(Surah(
          map['number'],
          map['name'],
          map['englishName'],
          map['englishNameTranslation'],
          map['numberOfAyahs'],
          map['revelationType'],
        ));
      }
      return all;
    }
  }

  int id;
  String name;
  String nameEn;
  String nameEnTranslate;
  int ayahsNumber;
  RevelationType revelationType;
}

enum RevelationType{ Meccan , Medinan }