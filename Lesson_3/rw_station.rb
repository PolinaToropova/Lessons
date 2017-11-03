class Station

  def initialize(name) 
    @name = name
    @train_list = []
    @train_passeng = 0
    @train_freight = 0
  end
  
  def take_train(tr_numb, type)   #принимает поезд
    @tr_numb = tr_numb
    @type = type
    @train_list << tr_numb
    @train_passeng += 1 if type == "пассажирский"
    @train_freight += 1 if type == "грузовой"   
  end

  def send_train(tr_numb)       #отправляет поезд
    @train_list.delete(tr_numb)   
  end
  
  def train_list                #возвращает список поездов на станции
    puts "Поезда на станции #{@name}:"
    puts @train_list
  end
  
  def train_type          #возвращает список поездов на станции по типу
    puts "На станции #{@name}: \nпассажирских поездов: #{@train_passeng}"
    puts "грузовых поездов: #{@train_freight}"
  end
end

class Route
  
  $routs = []   #все станции
  attr_reader :inter_station

  def initialize(from, to) 
    @from = [from]
    @to = [to]
    @inters = []
    r = []
    r << @from << @inters << @to
    $routs << r
  end
  
  def inter(inter_station)       #добавляет промежут. станции в маршрут
    @inters << inter_station
  end
  
  def remove_inter(inter_station)   #удаляет промежут. станции из маршрута
    @inters.delete(inter_station)
  end

  def route_info        #возвращает список станций в маршруте
    puts "Станции маршрута #{@from[0]}-#{@to[0]}:"
    puts @from + @inters + @to
  end
   
end

class Train

  attr_accessor :speed
  attr_reader :carr_count, :trainplace
   
  def initialize(tr_numb, type, carr_count) 
    @tr_numb = tr_numb
    @type = type
    @carr_count = carr_count
    @speed = 0
  end

  def current_speed    #возвращает текущую скорость
    puts self.speed
  end
    
  def stop              #останавливает поезд
    self.speed = 0
  end

  def carriage_count    #возвращает количество вагонов
    puts self.carr_count
  end

  def carr_clutch       #прицепляет вагон
    @carr_count += 1 if self.speed == 0
  end
  
  def carr_break        #отцепляет вагон
    @carr_count -= 1 if self.speed == 0
  end

  def take_route(from, to)    #присваивает поезду маршрут
    @from = [from]
    @to = [to]
    @trainplace = from
    $routs.each do |arr_route|
      if arr_route[0] == @from && arr_route[-1] == @to
        @taken_route = arr_route.flatten
      else 
        @taken_route = @from + @to
      end
    end
  end

  def train_route     #возвращает маршрут поезда
    puts @taken_route
  end
  
  def go_forward      #перемещает поезд на станцию вперед
    i = @taken_route.index(@trainplace)
    if (i+1) < @taken_route.size
      @trainplace = @taken_route[i+1]
    else 
      @trainplace = @taken_route[-1]
    end
  end

  def go_back   #перемещает поезд на станцию назад
    i = @taken_route.index(@trainplace)
    if (i-1) > 0
      @trainplace = @taken_route[i-1]
    else @trainplace = @taken_route[0]
    end
  end

  def stant_info   #возвращает инф-ю о текущей,предыдущей,следующей станции
    i = @taken_route.index(@trainplace)
    puts "текущая станция #{@trainplace}"
    puts "предыдущая:"
    if  (i-1) > 0   
      puts @taken_route[i-1]
    else
      puts @taken_route[0]
    end 
    puts "следущая:"
    if (i+1) < @taken_route.size
      puts @taken_route[i+1]
    else
      puts  @taken_route[-1]
    end
  end  
end
