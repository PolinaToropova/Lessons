class PassengerTrain < Train

  def carr_clutch(carriage)
    super if carriage.class == PassengerCarriage
  end
  
end
