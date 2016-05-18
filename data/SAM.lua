-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

	-- Load and initialize the include file.
	include('Mote-Include.lua')
	include('organizer-lib')
end

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	state.OffenseMode:options('GK', 'PLM')
	state.RangedMode:options('Normal')
	state.HybridMode:options('Normal')
	state.WeaponskillMode:options('Normal')
	state.CastingMode:options('Normal')
	state.IdleMode:options('Normal')
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

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

end



function init_gear_sets()	
	--------------------------------------
	-- Precast sets
	--------------------------------------
	
	-- Sets to apply to arbitrary JAs
	sets.precast.JA['Meditate'] = {
		head="Myochin Kabuto", hands="Saotome Kote"}
	
	
	-- Sets to apply to any actions of spell.type
	sets.precast.Waltz = {
		ammo="Bibiki Seashell", head="Genbu's Kabuto", waist="Warwolf Belt" }
		
	-- Sets for specific actions within spell.type
	sets.precast.Waltz['Healing Waltz'] = { }

    -- Sets for fast cast gear for spells
	sets.precast.FC = { rear="Loquacious Earring" }
	
    sets.precast.JA['Provoke'] = {
	    head="Arh. Jinpachi +1", neck="Harmonia's Torque", left_ear="Hades Earring +1", right_ear="Hades Earring +1",
	    body="Yasha Samue +1", hands="Yasha Tekko +1", left_ring="Mermaid Ring",
	    back="Cerb. Mantle +1", waist="Warwolf Belt", legs="Yasha Hakama +1", feet="Ysh. Sune-Ate +1" }

    -- Fast cast gear for specific spells or spell maps

	-- Weaponskill sets
--	sets.precast.WS = { 
--	head="Shr.Znr.Kabuto +1", neck=gear.ElementalGorget, lear="Tmph. Earring +1", rear="Brutal Earring",
--	body="Haubergeon +1", hands="Alkyoneus's Brc.", ring1="Triumph Ring +1", waist="Warwolf Belt",
--	back="Cerb. Mantle +1", legs="Shura Haidate +1", feet="Rutter Sabatons" } 

	sets.precast.WS = { -- pre 75
		head="Shr.Znr.Kabuto +1", neck=gear.ElementalGorget, lear="Tmph. Earring +1", rear="Merman's Earring",
		body="Haubergeon +1", hands="Alkyoneus's Brc.", ring1="Triumph Ring +1", ring2="Rajas Ring",
		waist="Warwolf Belt", back="Amemet Mantle +1", legs="Shura Haidate +1", feet="Rutter Sabatons" } 
	
	sets.precast.WS['Penta Thrust'] = set_combine( sets.precast.WS, {
		hands="Ochiudo's Kote" } )

	-- Specific weaponskill sets.

	
	--------------------------------------
	-- Midcast sets
	--------------------------------------

    -- Generic spell recast set
	sets.midcast.FastRecast = {
		Head="Walahra Turban", hands=gear.HasteHands, waist="Velocious Belt", legs="Byakko's Haidate", feet=gear.HasteFeet }
		
	-- Specific spells

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------
	
	-- Resting sets
	sets.resting = {
		ammo="Bibiki Seashell", head="Arh. Jinpachi +1", neck="Orochi Nodowa +1",  lear="Merman's Earring", rear="Merman's Earring", 
		body="Arhat's Gi +1", hands="Dst. Mittens +1", ring1="Merman's Ring", ring2="Merman's Ring",
		back="Lamia Mantle +1", waist="Resolute Belt", legs="Coral Cuisses +1", feet="Coral Greaves +1" }
	

	-- Idle sets
	sets.idle = {
		ammo="Bibiki Seashell", head="Arh. Jinpachi +1", neck="Orochi Nodowa +1",  lear="Merman's Earring", rear="Merman's Earring", 
		body="Arhat's Gi +1", hands="Dst. Mittens +1", ring1="Merman's Ring", ring2="Merman's Ring",
		back="Lamia Mantle +1", waist="Resolute Belt", legs="Coral Cuisses +1", feet="Coral Greaves +1" }

	sets.idle.Town = {
		ammo="Bibiki Seashell", head="Arh. Jinpachi +1", neck="Orochi Nodowa +1",  lear="Merman's Earring", rear="Merman's Earring", 
		body="Arhat's Gi +1", hands="Dst. Mittens +1", ring1="Merman's Ring", ring2="Merman's Ring",
		back="Lamia Mantle +1", waist="Resolute Belt", legs="Coral Cuisses +1", feet="Coral Greaves +1" }
	
	sets.idle.Weak = {
		ammo="Bibiki Seashell", head="Arh. Jinpachi +1", neck="Orochi Nodowa +1",  lear="Merman's Earring", rear="Merman's Earring", 
		body="Arhat's Gi +1", hands="Dst. Mittens +1", ring1="Merman's Ring", ring2="Merman's Ring",
		back="Lamia Mantle +1", waist="Resolute Belt", legs="Coral Cuisses +1", feet="Coral Greaves +1" }
	
	-- Defense sets
	sets.defense.PDT = {
		ammo="Bibiki Seashell", head="Arh. Jinpachi +1", neck="Evasion Torque", body="Arhat's Gi +1",
		back="Boxer's Mantle", hands="Dst. Mittens +1", ring1="Jelly Ring", legs="Dst. Subligar +1", feet="Askar Gambieras" }

	sets.defense.MDT = {
		head="Coral Visor +1", neck="Jeweled Collar +1", body="Cor. Scale Mail +1", hands="Coral Fng. Gnt. +1",
		ring1="Merman's Ring", ring2="Merman's Ring", waist="Resolute Belt", lear="Merman's Earring", waist="Resolute Belt",
		rear="Merman's Earring", back="Lamia Mantle +1", legs="Coral Cuisses +1", feet="Askar Gambieras" }

    -- Gear to wear for kiting
	sets.Kiting = {}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	sets.engaged = {
		ammo="Black Tathlum", Head="Walahra Turban", Neck="Accient Torque", lear="Merman's Earring", rear="Brutal Earring",
		body="Haubergeon +1", hands=gear.HasteHands, ring1="Toreador's Ring", ring2="Rajas Ring",
		back="Cerb. Mantle +1", waist="Velocious Belt", legs="Byakko's Haidate", feet=gear.HasteFeet }

--	sets.engaged.GK = {
--	ammo="Black Tathlum", Head="Walahra Turban", Neck="Acient Torque", lear="Merman's Earring", rear="Brutal Earring",
--	body="Haubergeon +1", hands=gear.HasteHands, ring1="Toreador's Ring", ring2="Rajas Ring",
--	back="Cerb. Mantle +1", waist="Velocious Belt", legs="Byakko's Haidate", feet=gear.HasteFeet }

	sets.engaged.GK = { -- till 75 gears
		ammo="Tiphia Sting", sub="Pole Grip", Head="Zeal Cap +1", Neck="Peacock Amulet", lear="Merman's Earring", rear="Merman's Earring",
		body="Haubergeon +1", hands=gear.HasteHands, ring1="Toreador's Ring", ring2="Rajas Ring",
		back="Amemet Mantle +1", waist="Velocious Belt", legs="Shm. Haidate", feet=gear.HasteFeet }

--	sets.engaged.PLM = {
	--	ammo="Black Tathlum", Head="Walahra Turban", Neck="Acient Torque", lear="Merman's Earring", rear="Brutal Earring",
	--	body="Haubergeon +1", hands=gear.HasteHands, ring1="Toreador's Ring", ring2="Rajas Ring",
	--	back="Cerb. Mantle +1", waist="Velocious Belt", legs="Byakko's Haidate", feet=gear.HasteFeet }

	sets.engaged.PLM = { -- till 75 gears
		ammo="Tiphia Sting", Head="Zeal Cap +1", Neck="Peacock Amulet", lear="Merman's Earring", rear="Merman's Earring",
		body="Haubergeon +1", hands=gear.HasteHands, ring1="Toreador's Ring", ring2="Rajas Ring",
		back="Amemet Mantle +1", waist="Velocious Belt", legs="Shm. Haidate", feet=gear.HasteFeet }


	--------------------------------------
	-- Custom buff sets
	--------------------------------------
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
