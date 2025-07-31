class AssemblyLine

  BASE_PRODUCTION = 221
  
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    success_rate = case @speed
                   when 1..4
                     1.0
                   when 5..8
                     0.9
                   when 9
                     0.8
                   when 10
                     0.77
                   else
                     0.0
                   end
    (BASE_PRODUCTION * @speed).to_f * success_rate
  end

  def working_items_per_minute
    (production_rate_per_hour / 60.0).to_i
  end
end
