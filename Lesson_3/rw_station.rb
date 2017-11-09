class Station
  
  attr_reader :name, :train_list  
  
  def initialize(name) 
    @name = name
    @train_list = []
  end
  
  def take_train=(train)
    @train = train
    @train_list << train
  end

  def train_type=(train_type)
    count = 0
    train_list.each do |train|  
      count += 1 if train.type == train_type
    end 
    puts count   
  end
  
  def send_train=(train)
    @train_list.delete(train)
  end
end

class Route

  attr_reader :stations

  def initialize(from, to)
    @stations = [from, to]
  end

  def inter=(inter_station)       
    @stations.insert -2, inter_station
  end

  def remove_inter=(inter_station)   
    @stations.delete(inter_station)
  end
end

class Train

  self
   
  attr_reader :carr_count,:type, :tr_numb, :speed 
   
  def initialize(tr_numb, type, carr_count) 
    @tr_numb = tr_numb
    @type = type
    @carr_count = carr_count
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

  def take_route=(taken_route, station_index = 0)
    @station_index = station_index
    @taken_route = taken_route
    @station_arr = @taken_route.stations
    if self.current_station.train_list.include?(self) == false    
      self.current_station.take_train = self
    end        
  end

  def current_station
    @current_station = @station_arr[@station_index]
  end

  def go_forward 
    self.current_station.send_train = self
    @station_index = @station_arr.index(self.next_station)
    self.current_station.take_train = self
   end

  def go_back
    self.current_station.send_train = self
    @station_index = @station_arr.index(self.prev_station)
    self.current_station.take_train = self
  end

  def next_station
    if (@station_index + 1) < @station_arr.size
      @station_arr[@station_index + 1]
    else 
      @station_arr.last
    end
  end 

  def prev_station
    if @station_index != 0
      @station_arr[@station_index - 1]
    else 
      @station_arr[0]
    end
  end
end
