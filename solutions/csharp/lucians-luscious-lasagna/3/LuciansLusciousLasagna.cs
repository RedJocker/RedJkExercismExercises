class Lasagna
{
    public int ExpectedMinutesInOven()
	=> 40;
    
    public int RemainingMinutesInOven(int timeInOven)
	=> ExpectedMinutesInOven() - timeInOven;
    
    public int PreparationTimeInMinutes(int layers) 
	=> layers * 2;
    
    public int ElapsedTimeInMinutes(int layers, int timeInOven) 
        => timeInOven + PreparationTimeInMinutes(layers);
}


