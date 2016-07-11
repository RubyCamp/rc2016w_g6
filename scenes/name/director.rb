require 'dxruby'
module Name
  class Director

    @@SecondSelect = true

    def initialize
      @immage_name
      @bg_img1 = Image.load("images/chra/select1.png")
      @bg_img2 = Image.load("images/chra/select2.png")
      @bg_img3 = Image.load("images/chra/select3.png")
      @bg_img4 = Image.load("images/chra/select4.png")
      @bg_img5 = Image.load("images/chra/select5.png")
      @bg_img6 = Image.load("images/chra/select6.png")

      @icon_1 = Image.load("images/icon/1.png")
      @icon_2 = Image.load("images/icon/2.png")
      @icon_3 = Image.load("images/icon/3.png")
      @icon_4 = Image.load("images/icon/4.png")
      @icon_5 = Image.load("images/icon/5.png")
      @icon_6 = Image.load("images/icon/6.png")

      $TEAM_A_IMAGE = @icon_6
      $TEAM_B_IMAGE = @icon_6
      @title = Image.load("images/charsel.png")
    end

    def play
      # デバッグ用
      if Input.keyPush?( K_RETURN )
        Scene.set_current_scene(:Battle)
      end

      if Input.mouse_push?(M_LBUTTON )
        if (0 < Input.mouse_x && Input.mouse_x < 133)
          if @@SecondSelect
            $TEAM_A_IMAGE = @icon_1
            @@SecondSelect = false
          else
            $TEAM_B_IMAGE = @icon_1
            Scene.set_current_scene(:Battle)
            @@SecondSelect = true
          end
        elsif (133 < Input.mouse_x && Input.mouse_x < 266)
          if @@SecondSelect
            $TEAM_A_IMAGE = @icon_2
            @@SecondSelect = false
          else
            $TEAM_B_IMAGE = @icon_2
            Scene.set_current_scene(:Battle)
            @@SecondSelect = true
          end
        elsif (266 < Input.mouse_x && Input.mouse_x < 399)
          if @@SecondSelect
            $TEAM_A_IMAGE = @icon_3
            @@SecondSelect = false
          else
            $TEAM_B_IMAGE = @icon_3
            Scene.set_current_scene(:Battle)
            @@SecondSelect = true
          end
        elsif (399 < Input.mouse_x && Input.mouse_x < 532)
          if @@SecondSelect
            $TEAM_A_IMAGE = @icon_4
            @@SecondSelect = false
          else
            $TEAM_B_IMAGE = @icon_4
            Scene.set_current_scene(:Battle)
            @@SecondSelect = true
          end
        elsif (532 < Input.mouse_x && Input.mouse_x < 655)
          if @@SecondSelect
            $TEAM_A_IMAGE = @icon_5
            @@SecondSelect = false
          else
            $TEAM_B_IMAGE = @icon_5
            Scene.set_current_scene(:Battle)
            @@SecondSelect = true
          end
        else
          if @@SecondSelect
            $TEAM_A_IMAGE = @icon_6
            @@SecondSelect = false
          else
            $TEAM_B_IMAGE = @icon_6
            Scene.set_current_scene(:Battle)
            @@SecondSelect = true
          end
  	end
  end

        if (0 < Input.mouse_x && Input.mouse_x < 133)
          @image_name = @bg_img1
        elsif (133 < Input.mouse_x && Input.mouse_x < 266)
          @image_name = @bg_img2
        elsif (266 < Input.mouse_x && Input.mouse_x < 399)
          @image_name = @bg_img3
        elsif (399 < Input.mouse_x && Input.mouse_x < 532)
          @image_name = @bg_img4
        elsif (532 < Input.mouse_x && Input.mouse_x < 655)
          @image_name = @bg_img5
        else
          @image_name = @bg_img6
        end

      Window.draw(0, 0, @image_name)
      Window.draw(220, 50, @title)
    end
  end
end
