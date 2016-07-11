require_relative 'Action'

class Ball < Sprite
  def initialize(x, y, image_file)
    super(x, y, Image.load(image_file))
    $dx, $dy = 5, 3
    self.x, self.y = x, y
    @image = Image.load(image_file)
    @image.set_color_key([0, 0, 0])
  end
# 移動をするメソッド
  def move
    Battle::Action.onMoveAction
    self.x += $dx*$ball_speed
    self.y += $dy*$ball_speed
    # 座費用を記録
    $ballX = self.x + 50
    $ballY = self.x + 50
    if 50 > $ballX || 750 < $ballX 
        $dx = 0
        $dy = 0
    end
  end
# オブジェクト同士がぶつかった場合に呼び出されるメソッド
  def shot
    Battle::Action.onHitAction
    #if $ballX < 300
    #    self.x = 162.5
    #    self.y = 177.5
    #    if $last_shot_player ==  3
    #    #puts self.x , self.y
    #  end
    #  if $ballX > 500
    #    self.x = 502.5
    #  self.y = 381.5
    #    $last_shot_player = 2
    #     $dx = -$dx
    #$dy = -$dy
    #  end
   
  end
end
