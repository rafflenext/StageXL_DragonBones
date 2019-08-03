part of stagexl_dragonbones;

class Armature {
  String _name;
  List<Bone> _bones;
  List<Slot> _slots;
  List<Skin> _skins;
  List<Animation> _animations;

  Armature(this._name, this._bones, this._slots, this._skins, this._animations);
  Armature.Format5();
  //---------------------------------------------------------------------------

  Animation getAnimation(String animationName) {
    for (var animation in this._animations) {
      if (animation.name == animationName) {
        return animation;
      }
    }
    return null;
  }

  Skin getSkin(String skinName) {
    for (var skin in this._skins) {
      if (skin.name == skinName) {
        return skin;
      }
    }
    return null;
  }

  //---------------------------------------------------------------------------
  // 5.0 Data Format changes
  //name Skeleton name (one DragonBones data can contain multiple skeleton)
  String get name => this._name;
  set name(String name) {
    this._name = name;
  }

  //bones  Bone list of this skeleton contains
  List<Bone> get bones => this._bones;
  set bones(List<Bone> bones) {
    this._bones = bones;
  }

  //slots Slot list of this skeleton
  List<Slot> get slots => this._slots;
  set slots(List<Slot> slots) {
    this._slots = slots;
  }

  //skins Skin list of this skeleton contains
  List<Skin> get skins => this._skins;
  set skins(List<Skin> skins) {
    this._skins = skins;
  }

//animations The animations list of this skeleton contains
  List<Animation> get animations => this._animations;
  set animations(List<Animation> animations) {
    this._animations = animations;
  }

  @override
  String toString() => "Armature '$_name'";
}
