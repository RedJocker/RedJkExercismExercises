"""
Module with a function to calculate leap years
"""

def leap_year(year):
    """
    Calculate if year is a leap year
    year : int
    return : bool
    """
    return year % 400 == 0 \
        or (not year % 100 == 0 and year % 4 == 0)
