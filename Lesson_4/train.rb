class Train

  attr_reader :type, :tr_numb, :speed
   
  def initialize(tr_numb, type) 
    @tr_numb = tr_numb
    @type = type
    @carriages = []
    @speed = 0
  end

  def carr_count
    @carr_count = @carriages.size
  end

  def add_speed(add_speed)
    @speed += add_speed
  end

  def stop              
    @speed = 0
  end

  def take_route(route)
    @route = route
    @station_index = 0                     
    self.current_station.take_train(self)
  end

  def current_station
    @route.stations[@station_index]
  end

  def go_forward 
    if self.current_station != @route.stations.last  
      self.current_station.send_train(self)
      @station_index += 1
      self.current_station.take_train(self)
    end
  end

  def go_back
    if self.current_station != @route.stations.first
      self.current_station.send_train(self)
      @station_index -= 1
      self.current_station.take_train(self)
    end
  end

  def next_station
    if (@station_index + 1) < @route.stations.size
      @route.stations[@station_index + 1]
    else 
      @route.stations.last
    end
  end 

  def prev_station
    if @station_index != 0
      @route.stations[@station_index - 1]
    else 
      @route.stations[0]
    end
  end

  def carr_break        
    if self.speed == 0 && @carriages.size != 0
      @carriages.delete_at(-1)
    end
  end

  protected

  def carr_clutch(carriage)      
    @carriages << carriage if self.speed == 0
  end
=begin комментарий к секции protected:
Пользователь не может присоединять произвольно пассажирские или грузовые 
вагоны к объекту класса Train: может присоеденить, только к уже определенному 
поезду - объекту класса CargoTrain или PassengerTrain. 
protected, а не private - чтобы метод был доступен для потомков.  
=end

end
