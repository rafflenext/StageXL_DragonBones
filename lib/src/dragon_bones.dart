part of stagexl_dragonbones;

class DragonBones {
  final String name;
  final String version;
  final int frameRate;
  final bool isGlobal;
  final List<Armature> armatures;

  DragonBones(this.name, this.version, this.frameRate, this.isGlobal, this.armatures);

  //---------------------------------------------------------------------------

  static DragonBones fromJson(String jsonSource) {
    var data = json.decode(jsonSource);
    String ver = data["version"];
    //todo add error handling
    double version = double.parse(ver);
    assert(version is double);
    print(version);
    if (version == 4.0) return _DragonBonesParserJson4.parse(data);
    if (version == 4.5) return _DragonBonesParserJson4.parse(data);
    if (version > 5 && version < 6) return _coaToolsParserJson.parse(data);
    throw new ArgumentError("Unsupported format.");
  }

  //--x-------------------------------------------------------------------------

  Armature getArmature(String armatureName) {
    for (var armature in armatures) {
      if (armature.name == armatureName) {
        return armature;
      }
    }
    return null;
  }

  Skeleton createSkeleton(String armatureName) {
    var armature = this.getArmature(armatureName);
    if (armature == null) throw new ArgumentError("armatureName");
    return new Skeleton(armature, this.frameRate);
  }
}
