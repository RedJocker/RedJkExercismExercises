using System;

class BirdCount
{
    private int[] birdsPerDay;

    public BirdCount(int[] birdsPerDay)
    {
        this.birdsPerDay = birdsPerDay;
    }

    public static int[] LastWeek()
    {
	return new int[] { 0, 2, 5, 3, 7, 8, 4 };
    }

    public int Today()
    {
	return this.birdsPerDay[this.birdsPerDay.Length - 1];
    }

    public void IncrementTodaysCount()
    {
        this.birdsPerDay[this.birdsPerDay.Length - 1]++;
    }

    public bool HasDayWithoutBirds()
    {
        foreach (var count in this.birdsPerDay)
            if (count == 0) return true;
        return false;
    }

    public int CountForFirstDays(int numberOfDays)
    {
        int sum = 0;
        int limit = Math.Min(numberOfDays, this.birdsPerDay.Length);
        for (int i = 0; i < limit; i++) {
            sum += this.birdsPerDay[i];
        }
        return sum;
    }

    public int BusyDays()
    {
        int numBusyDays = 0;
        for (int i = 0; i < this.birdsPerDay.Length; i++) {
            if (this.birdsPerDay[i] >= 5)
                numBusyDays++;
        }
        return numBusyDays;
    }
}
