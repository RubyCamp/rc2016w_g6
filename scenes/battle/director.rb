require 'dxruby'
require 'smalrubot'
#puts "mae"
#require_relative 'score'
#puts "dekita"
require_relative 'ball'
require_relative 'player'
require_relative 'Action'
require_relative 'sensor'

$sensor = Sensor.new



module Battle

   # 音は0か1で帰ってくる
  # センサーも0か1かで帰ってくる
  @MoveBall = false
  class Director

    def initialize
      @bg_img = Image.load("images/tennis.png")
      # ボールとプレイヤー定義
#     @sensor = Sensor.new
      @ball = Ball.new(150, 130, "images/ball.png")
      @player = [Player.new(100, 100, "images/player1.png"), Player.new(600, 400, "images/player2.png")]
 #     @score = Score.new

    end

    # 一番最初に呼び出されるメソッド
    def play
      Window.draw(0, 0, @bg_img)
        # ボールが移動するメソッド
      setupPlayer
      moveBallPrint
    end
    def setupPlayer
      @player[0].image = $TEAM_A_IMAGE
      @player[1].image = $TEAM_B_IMAGE
      @player[0].draw
      @player[1].draw
    end

    # ボールの移動を描画する
    def moveBallPrint
      setupCollision                  # 衝突範囲を設定
      Sprite.check([@ball], @player)  #ボールとプレイヤーがぶつかった場合の処理を実行させるためもの
      #if Input.key_push?(K_RETURN) && ($ballX >= 225 || $ballX <= 575) && ($actionOK == false)
     # if (@sensor.ir? == true) && ($ballX >= 225 || $ballX <= 575) && ($actionOK == false)
       
     # end 

      #if Input.key_push?(K_RETURN) && ($ballX < 225 || $ballX > 575) && $actionOK
      #if Input.key_push?(K_RETURN) && $ballX < 310 && $actionOK
      if ( Input.key_push?(K_RETURN) || ($sensor.ir? == true)) && ($ballX < 225 || $ballX > 575)  && $actionOK  #TODO:ハード使用時に有効
      #if (@sensor.ir? == true) && $ballX < 310   && $actionOK
       # puts "ir"
        $soundShot.play
        $last_shot_player = 3
        $dx = -$dx
        $dy = -$dy
        # ここに評価処理
  #       @score.check
        check

        $actionOK = false
      else
        @ball.move                      #判定する必要がないのでmove
#        if $dx > 0 && (320 <= $ballX.to_i && $ballX.to_i <= 323)
#          $dx = 0
#          puts "miss"
#        end

      end
      @ball.draw                      #描画
       gameover?
    end
    # TODO:ヒットした時の様々な処理は別のクラス
    def check
      excellent = 3
      great = 15
      standard = 25
      miss = 100
      just_point1 = 150
      just_point2 = 550
      kakegoe_speed = 1
      if ($ballX - just_point1).abs < excellent
        #puts "excellent"
        $ball_speed = 2
        if $sensor.voice?
          $ball_speed += kakegoe_speed
          puts "Voice!!!!!!!!"
        end  
      elsif ($ballX - just_point1).abs <  great  
        #puts "great"
        $ball_speed = 1.5
        if $sensor.voice?
          $ball_speed += kakegoe_speed
          puts "Voice!!!!!!!!"
        end  
      #elsif ($ballX - just_point1).abs <  standard  
      else
        #puts "standard"
        $ball_speed = 1
        if $sensor.voice?
          $ball_speed += kakegoe_speed
          puts "Voice!!!!!!!!"
        end  
      #elsif ($ballX - just_point1).abs <  miss  
        #puts "miss"
        #$ball_speed = 0
      end
      if ($ballX - just_point2).abs < excellent
        #puts "excellent"
        $ball_speed = 2
        if $sensor.voice?
          $ball_speed += kakegoe_speed
          puts "Voice!!!!!!!!"
        end  
      elsif ($ballX - just_point2).abs <  great  
        #puts "great"
        $ball_speed = 1.5
        if $sensor.voice?
          $ball_speed += kakegoe_speed
          puts "Voice!!!!!!!!"
        end  
      #elsif ($ballX - just_point2).abs <  standard  
      else
        #puts "standard"
        $ball_speed = 1
        if $sensor.voice?
          $ball_speed += kakegoe_speed
          puts "Voice!!!!!!!!"
        end    
      end
              
    end

    # 衝突範囲を設定
    def setupCollision
      @ball.collision = [50,50,50]
      @player[0].collision = [50,50,50]
      @player[1].collision = [50,50,50]
    end

    def gameover?
      if 50 > $ballX
        $WinTeam = $TEAM_B
        puts "B win!" 

        Scene.set_current_scene(:Result)


      end
      if 750 < $ballX 
        $WinTeam = $TEAM_A
        puts "A win!"
        Scene.set_current_scene(:Result) 
      end
    end

#    def errs
#      if $ballX < 213
#        $ballX = 212.5
#        $ballY = 162.2
#      end
#      if $ballX > 552
#        $ballX = 552.5
#        $ballY = 502.5
#      end
#    end

  end
end
