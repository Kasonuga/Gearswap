# Gearswap

Personalized versions, based on Mote's lua file's ( see: https://github.com/Kinematics/GearSwap-Jobs/wiki )
Designed around 75 cap and personal preference.

Data/:
  Contains Job lua files, place in /Addons/Gearswap/data/
  
  Most of the jobs present( excluding rng, blm, sch ) are completely filled out; simply change the gear in each set to whatever you use. For other jobs or to start more from scratch, template.lua contains some basic example sets with some general, all-job gear plugged in. No further rules are required for the files to work, most processing is taken care of in the libraries
  
Libs/:
  required libraries, see above wiki link for details.
  files go in /Addons/Gearswap/libs/
  Mote-Globals.lua contains global gear assignments, i.e. gear.staff.HMP, gear.staff.PDT
  
Flow.lua: Commented out a line which causes a lock-on when performing an action with a monster targeted; not      necesary but it gave me a headache so I "fixed" it. Place in /Addons/Gearswap, overwrite when prompted.
