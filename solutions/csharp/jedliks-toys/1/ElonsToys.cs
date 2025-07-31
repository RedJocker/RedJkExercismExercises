using System;

class RemoteControlCar
{
    private int distance = 0;
    private int battery = 100;

    public static RemoteControlCar Buy()
    {
        return new RemoteControlCar();
    }

    public string DistanceDisplay()
    {
        return $"Driven {this.distance} meters";
    }

    public string BatteryDisplay()
    {
	string batteryLevel = battery == 0 ? "empty" : $"at {this.battery}%";
	return $"Battery {batteryLevel}";
    }

    public void Drive()
    {
        if (this.battery <= 0)
	    return ;
	this.distance += 20;
	this.battery -= 1;
    }
}
