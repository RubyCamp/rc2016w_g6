class Sensor
  def initialize
  	@board = Smalrubot::Board.new(Smalrubot::TxRx::Serial.new)
    @ir_recv = 0
    @voice_recv = 0
    @ir_port = 3
    @voice_port = 2
  end 

  def ir_check
     @ir_recv = @board.analog_read(@ir_port)
     #puts "IR #{@ir_recv}"
  end

  def voice_check
     @voice_sum = 0
     4.times do
       @voice_recv = @board.analog_read(@voice_port)
       @voice_sum =+ @voice_recv
     end
     @voice_ave = @voice_sum / 4
     #puts "voice #{@voice_ave} "
     
  end

  def ir?
    ir_check
    if  @ir_recv > 120
      true
    else 
      false
    end
  end

  def voice?
    voice_check
    10.times 
      if  @voice_ave > 178
        return true 
    end  
    false
  end 
end