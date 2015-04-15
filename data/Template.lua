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
	state.HybridMode:options('Normal', 'Evasion')
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
	
	-- Sets to apply to arbitrary JAs
    sets.precast.JA['Provoke']  = {
	ammo="", head="", neck="", lear="", rear="", 
	body="", hands="", ring1="", ring2="",
	back="", waist="", legs="", feet="" }
	
	-- Sets to apply to any actions of spell.type
	sets.precast.Waltz = {
	ammo="Bibiki Seashell" }
		
	-- Sets for specific actions within spell.type
	sets.precast.Waltz['Healing Waltz'] = { --[[ no gear for erase waltz ]] } 

    -- Sets for fast cast gear for spells
	sets.precast.FC = { rear="Loquacious Earring" }

    -- Fast cast gear for specific spells or spell maps

	-- Weaponskill sets
	sets.precast.WS = {
	ammo="", head="", neck=gear.ElementalGorget, lear="", rear="Brutal Earring", 
	body="", hands="", ring1="Toreador's Ring", ring2="Rajas Ring",
	back="", waist="", legs="", feet="" }

	-- Specific weaponskill sets.

	
	--------------------------------------
	-- Midcast sets
	--------------------------------------

    -- Generic spell recast set
	sets.midcast.FastRecast = {
  	ammo="", head="Walahra Turban", neck="", lear="", rear="Loquacious Earring", 
  	body="", hands="", ring1="", ring2="",
  	back="", waist="", legs="", feet="" }
		
	-- Specific spells
	
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------
	
	-- Resting sets
	sets.resting = {
	ammo="Bibiki Seashell", head="", neck="Orochi Nodowa +1", lear="Merman's Earring", rear="Merman's Earring", 
	body="", hands="", ring1="Merman's Ring", ring2="Merman's Ring",
	back="Lamia Mantle +1", waist="Resolute Belt", legs="", feet="" }

	
	-- Idle sets
	sets.idle = {
	ammo="Bibiki Seashell", head="", neck="Orochi Nodowa +1", lear="Merman's Earring", rear="Merman's Earring", 
	body="", hands="", ring1="Merman's Ring", ring2="Merman's Ring",
	back="Lamia Mantle +1", waist="Resolute Belt", legs="", feet="" }


	sets.idle.Town = {
	ammo="Bibiki Seashell", head="", neck="Orochi Nodowa +1", lear="Merman's Earring", rear="Merman's Earring", 
	body="Kingdom Aketon", hands="", ring1="Merman's Ring", ring2="Merman's Ring",
	back="Lamia Mantle +1", waist="Resolute Belt", legs="", feet="" }


	sets.idle.Weak = {
	ammo="Bibiki Seashell", head="", neck="Orochi Nodowa +1", lear="Merman's Earring", rear="Merman's Earring", 
	body="", hands="", ring1="Merman's Ring", ring2="Merman's Ring",
	back="Lamia Mantle +1", waist="Resolute Belt", legs="", feet="" }


	
	-- Defense sets
	sets.defense.PDT = {
	ammo="", head="", neck="", lear="", rear="", 
	body="", hands="", ring1="", ring2="",
	back="", waist="", legs="", feet="" }

	sets.defense.MDT = {
	ammo="Bibiki Seashell", head="", neck="Orochi Nodowa +1", lear="Merman's Earring", rear="Merman's Earring", 
	body="", hands="", ring1="Merman's Ring", ring2="Merman's Ring",
	back="Lamia Mantle +1", waist="Resolute Belt", legs="", feet="" }


    -- Gear to wear for kiting
	sets.Kiting = { }

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
  	sets.engaged = {
	ammo="", head="", neck="Ancient Torque", lear="", rear="Brutal Earring", 
	body="", hands="", ring1="Toreador's Ring", ring2="Rajas Ring",
	back="", waist="Sonic Belt +1", legs="", feet="" }

  	sets.engaged.Acc = {
	ammo="", head="", neck="Ancient Torque", lear="", rear="Brutal Earring", 
	body="", hands="", ring1="Toreador's Ring", ring2="Rajas Ring",
	back="", waist="Sonic Belt +1", legs="", feet="" }


  	sets.engaged.Evasion = {
	ammo="", head="", neck="Evasion Torque", lear="", rear="Brutal Earring", 
	body="", hands="", ring1="Toreador's Ring", ring2="Rajas Ring",
	back="", waist="Sonic Belt +1", legs="", feet="" }

  	sets.engaged.Acc.Evasion = {
	ammo="", head="", neck="Evasion Torque", lear="", rear="Brutal Earring", 
	body="", hands="", ring1="Toreador's Ring", ring2="Rajas Ring",
	back="", waist="Sonic Belt +1", legs="", feet="" }

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
end