# These variables are initialized on the command line (using '-v'):
# - num

BEGIN {

	sound = ""
	if (num % 3 == 0)
		sound = sound "Pling"
	if (num % 5 == 0)
		sound = sound "Plang"
	if (num % 7 == 0)
		sound = sound "Plong"
	if (sound == "")
		sound = num
	print sound
}
