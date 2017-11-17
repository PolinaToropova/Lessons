class Station
  
  attr_reader :name, :trains  
  
  def initialize(name) 
    @name = name
    @trains = []
  end
  
  def train_type(train_type)
    count = 0
    trains.each do |train|  
      count += 1 if train.type == train_type
    end
    count 
  end

  def take_train(train)
   @trains << train
  end

  def send_train(train)
   @trains.delete(train)
  end
 
end
