class Station
  
  attr_reader :train_list  
  
  def initialize(name) 
    @name = name
    @train_list = []
  end
  
  def take_train=(train)
    @train = train
    train_list << @train.train_array
  end

  def train_type
    train_passeng = 0
    train_freight = 0
    train_list.flatten.each do|element|
      train_passeng += 1 if element == "пассажирский"
      train_freight += 1 if element == "грузовой"
    end    
    puts "пассажирских поездов: #{train_passeng}"
    puts "грузовых поездов: #{train_freight}"
  end
  
  def send_train=(train)
    @train = train
    @train_list.delete(@train.train_array)
  end
  
end

class Route

  attr_reader :route

  def initialize(from, to)
    @from = from
    @to = to
    @route = [@from, @to]
  end

  def inter=(inter_station)       
    @route.insert -2, inter_station
  end

  def remove_inter=(inter_station)   
    @route.delete(inter_station)
  end

end

class Train

  attr_reader :carr_count,:type, :tr_numb, :train_array, :speed, :trainplace 
   
  def initialize(tr_numb, type, carr_count) 
    @tr_numb = tr_numb
    @type = type
    @carr_count = carr_count
    @train_array = [tr_numb,type,carr_count]
    @speed = 0
  end

  def add_speed(add_speed)
    @speed += add_speed
  end

  def stop              
    self.speed = 0
  end

  def carr_clutch      
    @carr_count += 1 if self.speed == 0
  end
  
  def carr_break        
    if self.speed == 0 && @carr_count != 0
      @carr_count -= 1
    else  @carr_count
    end
  end

  def take_route=(taken_route)
    @taken_route = taken_route.route  
    @trainplace = @taken_route[0]
  end

  def go_forward      
    @trainplace = self.next_station 
  end

  def go_back
    @trainplace = self.prev_station
  end

  def curr_station
    self.trainplace
  end

  def next_station
    i = @taken_route.index(@trainplace)
    if (i+1) < @taken_route.size
     i += 1
    else 
     i = -1
    end
   next_station = @taken_route[i]
  end

  def prev_station
    i = @taken_route.index(@trainplace)
    if (i-1) > 0
      i -= 1
    else i = 0
    end
    prev_station = @taken_route[i]
  end

end

