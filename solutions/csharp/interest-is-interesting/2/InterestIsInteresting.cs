using System;

static class SavingsAccount
{
    public static float InterestRate(decimal balance)
    {
        return balance switch {
            < 0m => 3.213f,
            < 1000m => 0.5f,
            < 5000m => 1.621f,
            _ => 2.475f
        };
    }

    public static decimal Interest(decimal balance)
    {
        return (balance * Convert.ToDecimal(InterestRate(balance))) / 100m; 
    }

    public static decimal AnnualBalanceUpdate(decimal balance)
    {
        return balance + Interest(balance);
    }

    public static int YearsBeforeDesiredBalance(decimal balance, decimal targetBalance)
    {
        int years = 0;
        decimal updatedBalance = balance;

        while (updatedBalance < targetBalance) {
            years++;
            updatedBalance = AnnualBalanceUpdate(updatedBalance);
        }
        return years;
    }
}
