-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

	-- Load and initialize the include file.
	include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

end


-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
  	state.OffenseMode:options('Normal', 'Acc')
	state.RangedMode:options('Normal')
	state.HybridMode:options('Normal', 'Acc')
	state.WeaponskillMode:options('Normal')
	state.CastingMode:options('Normal')
	state.IdleMode:options('Normal', 'PDT', 'MDT')
	state.RestingMode:options('Normal')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')

    -- Additional local binds
    send_command('bind ^` input /ja "Hasso" <me>')
    send_command('bind !` input /ja "Seigan" <me>')
	
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------
	
	-- Sets to apply to arbitrary JAsgit pu
s	
	-- Sets to apply to any actions of spell.type
	sets.precast.Waltz = {
  	ammo="Bibiki Seashell", waist="Warwolf Belt" }
		
	-- Sets for specific actions within spell.type
	sets.precast.Waltz['Healing Waltz'] = {}

    -- Sets for fast cast gear for spells
	sets.precast.FC = {ear2="Loquacious Earring"}

    -- Fast cast gear for specific spells or spell maps
	sets.precast.FC.Utsusemi = { }

	-- Weaponskill sets
	sets.precast.WS = {
  	ammo="Tiphia Sting", head="Hecatomb Cap +1", neck=gear.ElementalGorget, lear="Tmph. Earring +1",
  	rear="Brutal Earring", body="Hct. Harness +1", hands="Hct. Mittens +1", ring1="Triumph Ring +1", ring2="Rajas Ring",
  	back="Cerb. Mantle +1", waist="Warwolf Belt", legs="Hct. Subligar +1", feet="Hct. Leggings +1" }

	-- Specific weaponskill sets.

	
	--------------------------------------
	-- Midcast sets
	--------------------------------------

    -- Generic spell recast set
	sets.midcast.FastRecast = {
   	head="Walahra Turban", hands="Dusk Gloves +1", waist="Velocious Belt",
   	legs="Byakko's Haidate", feet="Homam Gambieras", ring1="Blitz ring" }
		
	-- Specific spells
	sets.midcast.Utsusemi = {}

  	sets.midcast.Stoneskin = { body="Blood Scale Mail" }

	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------
	
	-- Resting sets
	sets.resting = {
    ammo="Bibiki Seashell", head="Coral Visor +1", neck="Orochi Nodowa +1", lear="Merman's Earring",
    body="Conte Corazza", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", rear="Merman's Earring",
    waist="Resolute Belt", ring2="Merman's Ring", back="Lamia Mantle +1", legs="Blood Cuisses",
    feet="Askar Gambieras" }

	
	-- Idle sets
	sets.idle = {
   	ammo="Bibiki Seashell", head="Coral Visor +1", neck="Orochi Nodowa +1", lear="Merman's Earring",
   	body="Conte Corazza", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", rear="Merman's Earring",
   	waist="Resolute Belt", ring2="Merman's Ring", back="Lamia Mantle +1", legs="Blood Cuisses",
   	feet="Askar Gambieras" }

	sets.idle.Town = {
    ammo="Bibiki Seashell", head="Coral Visor +1", neck="Orochi Nodowa +1", lear="Merman's Earring",
    body="Conte Corazza", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", rear="Merman's Earring",
    waist="Resolute Belt", ring2="Merman's Ring", back="Lamia Mantle +1", legs="Blood Cuisses",
    feet="Askar Gambieras" }

	
	sets.idle.Weak = {
    ammo="Bibiki Seashell", head="Coral Visor +1", neck="Orochi Nodowa +1", lear="Merman's Earring",
    body="Conte Corazza", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", rear="Merman's Earring",
    waist="Resolute Belt", ring2="Merman's Ring", back="Lamia Mantle +1", legs="Blood Cuisses",
    feet="Askar Gambieras" }

	
	-- Defense sets
	sets.defense.PDT = {
   	ammo="Bibiki Seashell", head="Dst. Cap +1", neck="Orochi Nodowa +1", body="Dst. Harness +1",
   	hands="Dst. Mittens +1", ring1="Jelly Ring", legs="Dst. Subligar +1", feet="Askar Gambieras" }

	sets.defense.MDT = {
   	head="Coral Visor +1", neck="Jeweled Collar +1", body="Cor. Scale Mail +1", hands="Coral Fng. Gnt. +1",
   	ring1="Merman's Ring", ring2="Merman's Ring", waist="Resolute Belt", lear="Merman's Earring",
   	back="Lamia Mantle +1", waist="Resolute Belt", rear="Merman's Earring", legs="Coral Cuisses +1",
   	feet="Askar Gambieras" }

    -- Gear to wear for kiting
	sets.Kiting = { legs="Blood Cuisses" }

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	sets.engaged = {
  	ammo="Tiphia Sting", head="Walahra Turban", neck="Ancient Torque", body="Homam Corazza",
 	hands="Dusk Gloves +1", waist="Velocious Belt", back="Cerb. Mantle +1",  legs="Aurum Cuisses",
	feet="Homam Gambieras", lear="Assault Earring", rear="Brutal Earring", ring1="Blitz ring", ring2="Rajas Ring" }

  	sets.engaged.Acc = {
  	ammo="Tiphia Sting", head="Walahra Turban", neck="Ancient Torque", body="Homam Corazza",
  	hands="Homam Manopolas", waist="Velocious Belt", back="Cerb. Mantle +1",  legs="Aurum Cuisses",
  	feet="Aurum Sabatons", lear="Assault Earring", rear="Brutal Earring", ring1="Toreador's ring", ring2="Rajas Ring" }

	--------------------------------------
	-- Custom buff sets
	--------------------------------------

end