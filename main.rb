require 'dxruby'

require_relative 'scene'
# ろいろいなグローバル変数が入ってるディレクター
require_relative 'director'
require_relative 'scenes/load_scenes'

Window.caption = "パーリーテニス（仮）"
Window.width   = 800
Window.height  = 600

# 最初に起動するシーンの名前を引数に入力
Scene.set_current_scene(:Title)
# Scene.set_current_scene(:Result)
# Scene.set_current_scene(:Battle)
# サウンドの設定
$sound = Sound.new("sound/pon.wav")  # sound.wav読み込みbgm = Sound.new("bgm.mid")  # bgm.mid読み込み
$soundHit = Sound.new("sound/hit.wav")  # sound.wav読み込みbgm = Sound.new("bgm.mid")  # bgm.mid読み込み
$soundSuka = Sound.new("sound/suka.wav")
$soundShot = Sound.new("sound/shot.wav")
Window.loop do
  # カレントのplayメソッドを実行
  Scene.play_scene
end
