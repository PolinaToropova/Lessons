class CargoTrain < Train
 
  def carr_clutch(carriage)
    super if carriage.class == CargoCarriage
  end

end
