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
  state.OffenseMode:options('Normal', 'DualWield')
	state.RangedMode:options('Normal')
	state.HybridMode:options('Normal', 'Acc')
	state.WeaponskillMode:options('Normal')
	state.CastingMode:options('Normal')
	state.IdleMode:options('Normal', 'PDT', 'MDT')
	state.RestingMode:options('Normal')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')

    -- Additional local binds
    send_command('bind ^` input /ma "Utsusemi: Ni" <me>')
    send_command('bind !` input /ma "Utsusemi Ichi" <me>')
	
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
    sets.precast.JA['Charm']  = {
	ammo="", head="", neck="", lear="", rear="", 
	body="", hands="", ring1="", ring2="",
	back="", waist="", legs="", feet="" }

    sets.precast.JA['Reward']  = {
	ammo="", head="", neck="", lear="", rear="", 
	body="", hands="", ring1="", ring2="",
	back="", waist="", legs="", feet="" }
	
	-- Sets to apply to any actions of spell.type
	sets.precast.Waltz = {
  	ammo="Bibiki Seashell"}
		
	-- Sets for specific actions within spell.type
	sets.precast.Waltz['Healing Waltz'] = {}

    -- Sets for fast cast gear for spells
	sets.precast.FC = { rear="Loquacious Earring" }

    -- Fast cast gear for specific spells or spell maps
	sets.precast.FC.Utsusemi = sets.precast.FC

	-- Weaponskill sets
	sets.precast.WS = {
  	ammo="Fire Bomblet", head="Hecatomb Cap +1", neck=gear.ElementalGorget, lear="Tmph. Earring +1", rear="Brutal Earring",
  	body="Armada Hauberk", hands="Hct. Mittens +1", ring1="Triumph Ring +1", ring2="Rajas Ring",
  	back="Cerb. Mantle +1", waist="Warrior's Stone", legs="Hct. Subligar +1", feet="Hct. Leggings +1" }

	-- Specific weaponskill sets.

	
	--------------------------------------
	-- Midcast sets
	--------------------------------------

    -- Generic spell recast set
	sets.midcast.FastRecast = {
  	head="Walahra Turban", neck="Tiercel Necklace", rear="Loquacious Earring", 
  	hands=gear.HasteHands, ring1="Blitz Ring",
  	waist="Velocious Belt", legs="Byakko's Haidate", feet=gear.HasteFeet }
		
	-- Specific spells
	sets.midcast.Utsusemi = sets.midcast.FastRecast

	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------
	
	-- Resting sets
	sets.resting = {
	ammo="Bibiki Seashell", head="Louhi's Mask", neck="Orochi Nodowa +1", lear="Merman's Earring", rear="Merman's Earring", 
	body="Armada Hauberk", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", ring2="Merman's Ring",
	back="Resentment Cape", waist="Resolute Belt", legs="Coral Cuisses +1", feet="Coral Leggings +1" }

	
	-- Idle sets
	sets.idle = {
	ammo="Bibiki Seashell", head="Louhi's Mask", neck="Orochi Nodowa +1", lear="Merman's Earring", rear="Merman's Earring", 
	body="Armada Hauberk", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", ring2="Merman's Ring",
	back="Resentment Cape", waist="Resolute Belt", legs="Coral Cuisses +1", feet="Coral Leggings +1" }


	sets.idle.Town = {
	ammo="Bibiki Seashell", head="Louhi's Mask", neck="Orochi Nodowa +1", lear="Merman's Earring", rear="Merman's Earring", 
	body="Armada Hauberk", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", ring2="Merman's Ring",
	back="Resentment Cape", waist="Resolute Belt", legs="Coral Cuisses +1", feet="Coral Leggings +1" }


	
	sets.idle.Weak = {
	ammo="Bibiki Seashell", head="Louhi's Mask", neck="Orochi Nodowa +1", lear="Merman's Earring", rear="Merman's Earring", 
	body="Armada Hauberk", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", ring2="Merman's Ring",
	back="Resentment Cape", waist="Resolute Belt", legs="Coral Cuisses +1", feet="Coral Leggings +1" }


	
	-- Defense sets
	sets.defense.PDT = {
	ammo="Bibiki Seashell", head="Louhi's Mask", neck="Evasion Torque", lear="Triton Earring", rear="Triton Earring", 
	body="Dst. Harness +1", hands="Dst. Mittens +1", ring1="Jelly Ring", legs="Dst. Subligar +1", feet="Dst. Leggings +1" }

	sets.defense.MDT = {
	ammo="Bibiki Seashell", head="Louhi's Mask", neck="Orochi Nodowa +1", lear="Merman's Earring", rear="Merman's Earring", 
	body="Coral Scale Mail +1", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", ring2="Merman's Ring",
	back="Resentment Cape", waist="Resolute Belt", legs="Coral Cuisses +1", feet="Coral Leggings +1" }


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
	ammo="Fire Bomblet", head="Walahra Turban", neck="Ancient Torque", lear="Assault Earring", rear="Brutal Earring", 
	body="Armada Hauberk", hands=gear.HasteHands, ring1="Toreador's Ring", ring2="Rajas Ring",
	back="Cerb. Mantle +1", waist="Velocious Belt", legs="Byakko's Haidate", feet=gear.HasteFeet }

  	sets.engaged.Acc = {
	ammo="Fire Bomblet", head="Walahra Turban", neck="Ancient Torque", lear="Assault Earring", rear="Brutal Earring", 
	body="Armada Hauberk", hands=gear.HasteHands, ring1="Toreador's Ring", ring2="Rajas Ring",
	back="Cuchulain's Mantle", waist="Velocious Belt", legs="Byakko's Haidate", feet=gear.HasteFeet }

	-- Dual Wield Group
	sets.engaged.DualWield = {
	ammo="Fire Bomblet", head="Walahra Turban", neck="Ancient Torque", lear="Suppanomiimi", rear="Brutal Earring", 
	body="Armada Hauberk", hands=gear.HasteHands, ring1="Toreador's Ring", ring2="Rajas Ring",
	back="Cerb. Mantle +1", waist="Velocious Belt", legs="Byakko's Haidate", feet=gear.HasteFeet }

	sets.engaged.DualWield.Acc = {
	ammo="Fire Bomblet", head="Walahra Turban", neck="Ancient Torque", lear="Suppanomiimi", rear="Brutal Earring", 
	body="Armada Hauberk", hands=gear.HasteHands, ring1="Toreador's Ring", ring2="Rajas Ring",
	back="Cuchulain's Mantle", waist="Velocious Belt", legs="Byakko's Haidate", feet=gear.HasteFeet }

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
end