# The input will be an array of arrays representing the daily bird counts.
# The data is organized into weekly arrays.
# The data is organized chronologically: 
# - this week's data is the last element of the array, and 
# - today's count is the last element of this week's data

# The output of this exercise is a JSON object,
# one key:value pair per task.

def last_week:
    .[-2]
;

def this_week:
    .[-1]
;

def yesterday:
    this_week[-2]
;

def count:
    map(1) | if . == [] then 0 else add end
;

{
  # Task 1: output the array for last week's data
  last_week: last_week,

  # Task 2: output count for yesterday in this week's data
  yesterday: yesterday,
  
  # Task 3: output sum of counts for this week's data
  total: (this_week | add),
  
  # Task 4: output number of days with 5 or more birds in this week's data
  busy_days: (this_week | map(select(. >= 5)) | count),
  
  # Task 5: output true if any day this week has zero birds
  has_day_without_birds: (this_week | any(. == 0))
}
