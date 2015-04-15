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
	state.OffenseMode:options('Scythe', 'GS', 'DualWield')
	state.RangedMode:options('Normal')
	state.HybridMode:options('Normal')
	state.WeaponskillMode:options('Normal')
	state.CastingMode:options('Normal')
	state.IdleMode:options('Normal', 'PDT', 'MDT')
	state.RestingMode:options('Normal')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')

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
	-- Sets to apply to any actions of spell.type
	sets.precast.Waltz = { waist="Warwolf Belt" }
		
	-- Sets for specific actions within spell.type
	sets.precast.Waltz['Healing Waltz'] = {}

    -- Sets for fast cast gear for spells
	sets.precast.FC = { rear="Loquacious Earring"}

    -- Fast cast gear for specific spells or spell maps

	-- Weaponskill sets
	sets.precast.WS = {
	ammo="Fire Bomblet", head="Hecatomb Cap +1", neck=gear.ElementalGorget, lear="Tmph. Earring +1", rear="Brutal Earring",
	body="Armada Hauberk", hands="Hct. Mittens +1", ring1="Triumph Ring +1", ring2="Rajas Ring",
	back="Cerb. Mantle +1", waist="Warwolf Belt", legs="Onyx Cuisses", feet="Hct. Leggings +1" }

	-- Specific weaponskill sets.
	sets.precast.WS['Guillotine'] = set_combine(sets.precast.WS, {
	back="Abyss Cape", waist="Cuchulain's Belt" } )

	
	--------------------------------------
	-- Midcast sets
	--------------------------------------

    -- Generic spell recast set
	sets.midcast.FastRecast = {
	head="Walahra Turban", rear="Loquacious Earring", hands="Dusk Gloves +1", waist="Velocious Belt", feet="Dusk Ledelsens +1"}
		
	-- Specific spells
	sets.midcast.Utsusemi = { }

	
	sets.midcast.Stoneskin = { body="Blood Scale Mail" }
	
	sets.midcast['Dark Magic'] = set_combine( sets.engaged, {
	head="Chaos Burgeonet",neck="Dark Torque", lear="Dark Earring", rear="Incubus Earring +1",
	body="Corselet +1", hands="Blood Fng. Gnt.", back="Abyss Cape", legs="Abs. Flanchard +1" } )

	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------
	
	-- Resting sets
	sets.resting = {
	ammo="Bibiki Seashell", head="", neck="Parade Gorget", lear="Merman's Earring", rear="Merman's Earring",
	body="Vampire Cloak", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", ring2="Merman's Ring",
	back="Lamia Mantle +1", waist="Resolute Belt", legs="Blood Cuisses", feet="Askar Gambieras" }	

	-- Idle sets
	sets.idle = {
	ammo="Bibiki Seashell", head="", neck="Parade Gorget", lear="Merman's Earring", rear="Merman's Earring",
	body="Vampire Cloak", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", ring2="Merman's Ring",
	back="Lamia Mantle +1", waist="Resolute Belt", legs="Blood Cuisses", feet="Askar Gambieras" }

	sets.idle.Town = {
	ammo="Bibiki Seashell", head="", neck="Parade Gorget", lear="Merman's Earring", rear="Merman's Earring",
	body="Vampire Cloak", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", ring2="Merman's Ring",
	back="Lamia Mantle +1", waist="Resolute Belt", legs="Blood Cuisses", feet="Askar Gambieras" }
	
	sets.idle.Weak = {
	ammo="Bibiki Seashell", head="", neck="Parade Gorget", lear="Merman's Earring", rear="Merman's Earring",
	body="Vampire Cloak", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", ring2="Merman's Ring",
	back="Lamia Mantle +1", waist="Resolute Belt", legs="Blood Cuisses", feet="Askar Gambieras" }
	
	-- Defense sets
	sets.defense.PDT = {
	ammo="Bibiki Seashell", head="Darksteel Cap +1", neck="Orochi Nodowa +1", body="Dst. Harness +1",
	hands="Dst. Mittens +1", ring1="Jelly Ring", legs="Dst. Subligar +1", feet="Askar Gambieras" }

	sets.defense.MDT = {
	head="Coral Visor +1", neck="Jeweled Collar +1", lear="Merman's Earring", rear="Merman's Earring",
	body="Cor. Scale Mail +1", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", ring2="Merman's Ring",  
	back="Lamia Mantle +1", waist="Resolute Belt",legs="Abs. Flanchard +1", feet="Askar Gambieras" }

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
	ammo="Fire Bomblet", head="Walahra Turban", neck="Ancient Torque", lear="Assault Earring", rear="Brutal Earring",
	body="Armada Hauberk", hands="Homam Manopolas", ring1="Blitz ring", ring2="Rajas Ring" 
	back="Cerb. Mantle +1",waist="Velocious Belt", legs="Aurum Cuisses", feet="Dusk Ledelsens +1" }
		
	sets.engaged.Scythe = {
	ammo="Fire Bomblet", head="Walahra Turban", neck="Ancient Torque", lear="Assault Earring", rear="Brutal Earring",
	body="Armada Hauberk", hands="Homam Manopolas", ring1="Blitz Ring", ring2="Rajas ring"
	 back="Cerb. Mantle +1", waist="Velocious Belt",legs="Aurum Cuisses", feet="Dusk Ledelsens +1" }

	sets.engaged.GS = {
	ammo="Fire Bomblet", head="Walahra Turban", neck="Ancient Torque", lear="Assault Earring", rear="Brutal Earring",
	body="Armada Hauberk", hands="Dusk Gloves +1", ring1="Blitz ring", ring2="Rajas ring"
	 back="Cerb. Mantle +1", waist="Velocious Belt",legs="Aurum Cuisses", feet="Dusk Ledelsens +1" }

	sets.engaged.DualWield = {
	ammo="Fire Bomblet", head="Walahra Turban", neck="Ancient Torque", lear="Suppanomimi", rear="Brutal Earring",
	body="Armada Hauberk", hands="Homam Manopolas", ring1="Toreador's ring", ring2="Rajas ring"
	back="Cuchulain's Mantle", waist="Velocious Belt", legs="Aurum Cuisses", feet="Dusk Ledelsens +1" }

	--------------------------------------
	-- Custom buff sets
	--------------------------------------

	sets.precast.JA['Last Resort'] = { }
	
	sets.precast.JA['Soul Eater'] = { head="Chaos Burgeonet" }
	
	sets.precast.JA['Weapon Bash'] = { }
	
	
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------