require 'dxruby'


module Battle
  class Action
      

    # 反射した時のアクション
    def self.onHitAction
      if (147 - $ballX).abs < 6 && $dx < 0
        $soundHit.play
      end
      if (650 - $ballX).abs < 6 && $dx > 0 
        $soundHit.play
      end
      #$ball_speed += 0.2
    end
    # 移動しているときのアクション
    def self.onMoveAction
      soundAction

    end

    # ボールの打つ他タイミングのサウンドを一回再生
    def self.soundAction

      
    #  if $ballX == 210 + 115 || $ballX == 210 + (115*2) then
      if((( ($ballX.to_i - 316.6).abs < 6) || (($ballX.to_i - 483.3).abs < 6) ) && ($soundRengeOn == true))
        $sound.play
        $actionOK = true
        $soundRengeOn = false
      else
        $soundRengeOn = true
      end

    end


    # ヒット時の評価をするメソッド
    def actionEvaluation
      #
    end

    # 最後のサウンドがなったときに呼び出されるメソッド
    def hitAction

    end




  end
end
