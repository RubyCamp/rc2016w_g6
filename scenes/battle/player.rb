class Player < Sprite
  # 初期座標と画像ファイルをSpriteクラスに代入
  def initialize(x, y, img_file)
    super(x, y, Image.load(img_file))
  end
end
