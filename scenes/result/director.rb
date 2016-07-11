require 'dxruby'

module Result
    class Director

      @@noLodeTeamImage = true
      @@bg_img = Image.load("images/result.png")
      def initialize
        @win = Image.load("images/win.png")
        @lose = Image.load("images/lose.png")
        
        @TeamA = Sprite.new(130, 270, Image.load("images/piza1.png"))
        @TeamB = Sprite.new(530, 270, Image.load("images/piza1.png"))
        @noLodeTeamImage = true
      end

      def getWinTeamAndImage
        if @noLodeTeamImage
            @TeamA.image = $TEAM_A_IMAGE
            @TeamB.image = $TEAM_B_IMAGE
            @noLodeTeamImage = false
        end
      end

      def play
        Window.draw(0, 0, @@bg_img)
        getWinTeamAndImage
        # 勝利したチームをプリントする
        printWinTeam
        # エンターキーを押すとタイトルへ戻る
        if Input.keyPush?( K_RETURN )
          
          @noLodeTeamImage = true
          #Scene.add_scene(Result::Director.new,  :Result)
          $ball_speed = 0.5
          Scene.add_scene(Battle::Director.new,  :Battle)
          Scene.set_current_scene(:Title)
        end
      end

      private
      def img_scale(n)
        @TeamA.scale_x = @TeamA.scale_y = n
        @TeamB.scale_x = @TeamB.scale_y = n
      end

      def printWinTeam
        win_font = Font.new(32)
        lose_font = Font.new(20)
        img_scale(2.2)
        if $WinTeam == $TEAM_A then

          Window.draw(40, 70, @win)
          Window.draw_font(150, 80, "#{$TEAM_A_NAME}", win_font)  # チームAの勝利を描画する
	        @TeamA.draw

          Window.draw(440, 70, @lose)
          Window.draw_font(550, 80, "#{$TEAM_B_NAME}", lose_font)  # チームAの敗北を描画する
	        @TeamB.draw
        else
          Window.draw(40, 70, @win)
          Window.draw_font(150, 80, "#{$TEAM_B_NAME}", win_font)  # チームAの勝利を描画する
	        @TeamB.draw

          Window.draw(440, 70, @lose)
          Window.draw_font(550, 80, "#{$TEAM_A_NAME}", lose_font)  # チームAの敗北を描画する
	        @TeamA.draw
        end
      end
    end
end
