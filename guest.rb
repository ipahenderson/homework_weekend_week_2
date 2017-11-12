class Guest

  attr_reader :guest_name, :fav_song
  attr_accessor :guest_money

  def initialize(guest_name, guest_money, fav_song)
    @guest_name = guest_name
    @guest_money = guest_money
    @fav_song = fav_song
  end

  def enough_money(price)
    return true if @guest_money >= price
    return false
  end

  def pay(price)
    if enough_money(price) == true
      @guest_money -= price
    else
      "You can't afford that"
    end
  end

  def got_fav_song(room)
    if room.song_list.include?(@fav_song)
      return "Whoo!"
    else
      return "Aww!"
    end
  end

end
