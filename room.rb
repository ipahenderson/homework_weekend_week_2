class Room

  attr_reader :room_name, :capacity
  attr_accessor :seats, :song_list

  def initialize(room_name, capacity)
    @room_name = room_name
    @capacity = capacity
    @seats = []
    @song_list = []

  end


  def enough_space
    return true if (@capacity - @seats.count) >= 1
    return false
  end

  def check_in(guest)
    if enough_space == true
      @seats << guest
    end
  end

  def check_out(guest)
    if @seats.include?(guest)
      @seats.delete(guest)
    end
  end

  def add_song(song)
    if @song_list.include?(song)
      return "Already on the list!"
    else
      @song_list << song
    end
  end


end
