using System;

public static class PhoneNumber
{
    public static (bool IsNewYork, bool IsFake, string LocalNumber) Analyze(string phoneNumber)
    {
	string[] splitNumber = phoneNumber.Split("-");
	return (
	    splitNumber[0].Equals("212"),
	    splitNumber[1].Equals("555"),
	    splitNumber[2]
	);
    }

    public static bool IsFake((bool IsNewYork, bool IsFake, string LocalNumber) phoneNumberInfo)
    {
        return phoneNumberInfo.IsFake;
    }
}
