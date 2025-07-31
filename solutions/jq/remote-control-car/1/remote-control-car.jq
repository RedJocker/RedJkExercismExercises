def new_remote_control_car:
    # Populate the object with the required attributes
    {
	battery_percentage: 100,
    	distance_driven_in_meters: 0,
    	nickname: null
    }
;

def new_remote_control_car(nickname):
    # Populate the object with the required attributes
    new_remote_control_car
    | .nickname = nickname
;

def display_distance:
    # Implement the required output string
    "\(.distance_driven_in_meters) meters"
;

def display_battery:
    (if .battery_percentage == 0 then
        "empty"
    else
	"at \(.battery_percentage)%"
    end) as $level	
    | "Battery \($level)"
;

def drive:
  if .battery_percentage == 0 then
      .
  else
      (.battery_percentage -= 1
      |.distance_driven_in_meters += 20)
  end 
;
