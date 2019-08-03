part of stagexl_dragonbones;

class DragonBones {
  String _name;
  String _version;
  int _frameRate;
  bool _isGlobal = false;
  List<Armature> _armatures;

  DragonBones(this._name, this._version, this._frameRate, this._isGlobal, this._armatures);
  DragonBones.Format5();

  //---------------------------------------------------------------------------

  static DragonBones fromJson(String jsonSource) {
    var data = json.decode(jsonSource);
    var version = data["version"];
    if (version == "4.0") return _DragonBonesParserJson4.parse(data);
    if (version == "4.5") return _DragonBonesParserJson4.parse(data);
    if (version == "5.0" || version == "5.5") return _DragonBonesParserJson5.parse(data);
    throw new ArgumentError("Unsupported format.");
  }

  //--x-------------------------------------------------------------------------

  Armature getArmature(String armatureName) {
    for (var armature in _armatures) {
      if (armature.name == armatureName) {
        return armature;
      }
    }
    return null;
  }

  Skeleton createSkeleton(String armatureName) {
    var armature = this.getArmature(armatureName);
    if (armature == null) throw new ArgumentError("armatureName");
    return new Skeleton(armature, this._frameRate);
  }

  // 5.0 Data Format changes
  //name  DragonBones data name
  String get name => this._name;
  set name(String name) {
    this._name = name;
  }

  //version data version format
  String get version => this._version;
  set version(String version) {
    this._version = version;
  }

//frameRate  animation frame rate
  int get frameRate => this._frameRate;
  set frameRate(int frameRate) {
    this._frameRate = frameRate;
  }

  //armatures skeleton list
  List<Armature> get armatures => this._armatures;
  set armatures(List<Armature> armatures) {
    this._armatures = armatures;
  }
}
