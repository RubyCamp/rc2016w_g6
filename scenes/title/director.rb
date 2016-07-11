require 'dxruby'

module Title
    class Director

    def initialize
      @bg_img = Image.load("images/title.png")
      @enter_img = Image.load("images/enter!.png")
    end

    def play
      Window.draw(0, 0, @bg_img)
      Window.draw(190, 450, @enter_img)

      if Input.keyPush?( K_RETURN )
        Scene.set_current_scene(:Name)
      end

    end
  end
end
