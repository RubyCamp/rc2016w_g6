class Scene
  @@scenes = {}

  @@current_scene_name = nil

  # 配列にシーンのインスタンスを代入する
  # ここに代入しないとロートできない
  def self.add_scene(scene_obj, scene_name)
    @@scenes[scene_name.to_sym] = scene_obj
  end

  # シーンの名前を読み取って使うシーンを指定する
  def self.set_current_scene(scene_name)
    @@current_scene_name = scene_name.to_sym
  end

  # カレントのシーンのplayを実行する
  def self.play_scene
    @@scenes[@@current_scene_name].play
  end
end

# シーンの切り替えメモ

# Scene.set_current_scene(:Battle)
# Scene.play_scene
