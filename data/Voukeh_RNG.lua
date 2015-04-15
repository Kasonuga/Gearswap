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
	state.OffenseMode:options('Normal')
	state.RangedMode:options('Normal', 'Acc')
	state.HybridMode:options('Normal')
	state.WeaponskillMode:options('Normal', 'Acc')
	state.CastingMode:options('Normal')
	state.IdleMode:options('Normal')
	state.RestingMode:options('Normal')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')

end


-- Called when this job file is unloaded (eg: job change)
function user_unload()

end

function init_gear_sets()	
	--------------------------------------
	-- Precast sets
	--------------------------------------
	
	-- Sets to apply to arbitrary JAs
	
	-- Sets to apply to any actions of spell.type
	sets.precast.Waltz = {}
		
	-- Sets for specific actions within spell.type
	sets.precast.Waltz['Healing Waltz'] = {}

    -- Sets for fast cast gear for spells
	sets.precast.FC = {rear="Loquacious Earring"}

    -- Fast cast gear for specific spells or spell maps
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, { } )

	-- Weaponskill sets
	sets.precast.WS = {}

	-- Specific weaponskill sets.

	
	--------------------------------------
	-- Midcast sets
	--------------------------------------

    -- Generic spell recast set
	sets.midcast.FastRecast = {}
		
	-- Specific spells
	sets.midcast.Utsusemi = {}



    -- Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
    head="", neck="Qiqirn Collar", lear="Pennon Earring +1", rear="Vision Earring",
    body="", hands="Blood Fng. Gnt.", ring1="Behemoth Ring +1", ring2="Behemoth Ring +1",
    back="Amemet Mantle +1", waist="", legs="Dusk Trousers +1", feet="War Boots +1" }

    sets.midcast.RA.Acc = {ammo=gear.RAbullet,
    head="", neck="Qiqirn Collar", lear="Pennon Earring +1", rear="Vision Earring",
    body="", hands="Blood Fng. Gnt.", ring1="Behemoth Ring +1", ring2="Behemoth Ring +1",
    back="Amemet Mantle +1", waist="", legs="Dusk Trousers +1", feet="War Boots +1" }

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------
	
	-- Resting sets
	sets.resting = {}
	

	-- Idle sets
	sets.idle = {
	head="Blood Mask", neck="Orochi Nodowa +1", lear="Merman's Earring", rear="Merman's Earring",
	body="Kyudogi", hands="Denali Wristbands", lring="Merman's Ring", rring="Merman's Ring",
	back="Lamia Mantle +1", waist="Resolute Belt", legs="Blood Cuisses", feet="Strider Boots" }

	sets.idle.Town = {
	head="Blood Mask", neck="Orochi Nodowa +1", lear="Merman's Earring", rear="Merman's Earring",
	body="Kyudogi", hands="Denali Wristbands", lring="Merman's Ring", rring="Merman's Ring",
	back="Lamia Mantle +1", waist="Resolute Belt", legs="Blood Cuisses", feet="Strider Boots" }
	
	sets.idle.Weak = {
	head="Blood Mask", neck="Orochi Nodowa +1", lear="Merman's Earring", rear="Merman's Earring",
	body="Kyudogi", hands="Denali Wristbands", lring="Merman's Ring", rring="Merman's Ring",
	back="Lamia Mantle +1", waist="Resolute Belt", legs="Blood Cuisses", feet="Strider Boots" }
	
	-- Defense sets
	sets.defense.PDT = { hands="Denali Wristbands" }

	sets.defense.MDT = {}

    -- Gear to wear for kiting
	sets.Kiting = {
	legs="Blood Cuisses", feet="Strider Boots" }

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	sets.engaged = {ammo=gear.RAbullet,
    head="Walahra Turban", neck="Peacock Amulet", lear="Suppanomimi", rear="Brutal Earring",
    body="Antares Harness", hands="Dusk Gloves +1", ring1="Toreador's Ring", ring2="Rajas Ring",
    back="Cerb. Mantle +1", waist="Velocious Belt", legs="Byakko's Haidate", feet="Dusk Ledelsens +1"}

	sets.engaged.Acc = {ammo=gear.RAbullet,
    head="Walahra Turban", neck="Peacock Amulet", lear="Suppanomimi", rear="Brutal Earring",
    body="Antares Harness", hands="Dusk Gloves +1", ring1="Toreador's Ring", ring2="Rajas Ring",
    back="Cerb. Mantle +1", waist="Velocious Belt", legs="Byakko's Haidate", feet="Dusk Ledelsens +1"}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------


end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
