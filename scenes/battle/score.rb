class Score
  def initialize
  	@excellent = 5
    @great = 20
    @standard = 100
    put "aaa"
  end 

  def check
    if $ballX < 212.2 + @excellent
      puts "excellent"
    elsif $ballX < 212.2 + @great
      puts "great"
    elsif $ballX < 212.2 + @standard
      puts "standard"
    end
  end