require_relative 'title/director'
require_relative 'result/director'
require_relative 'battle/director'
require_relative 'name/director'

Scene.add_scene(Title::Director.new,  :Title)
Scene.add_scene(Result::Director.new,  :Result)
Scene.add_scene(Battle::Director.new,  :Battle)
Scene.add_scene(Name::Director.new,  :Name)