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
	state.HybridMode:options('Normal', 'Evasion', 'HF')
	state.WeaponskillMode:options('Normal')
	state.CastingMode:options('Normal')
	state.IdleMode:options('Normal', 'PDT', 'MDT')
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
	sets.precast.FC = { rear="Loquacious Earring" }

    -- Fast cast gear for specific spells or spell maps
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, { } )

	-- Weaponskill sets
	sets.precast.WS = {
	head="Shr.Znr.Kabuto +1", neck=gear.ElementalGorget, lear="Merman's Earring", rear="Tmph. Earring +1",
	body="Shura Togi +1", hands="Ochiudo's Kote", lring="Toreador's Ring", rring="Rajas Ring",
	back="Cerb. Mantle +1", waist="Potent Belt", legs="Shura Haidate +1", feet="Denali Gamashes" }

	-- Specific weaponskill sets.

	sets.organizer = {
	lear="Beetle Earring +1", rear="Beetle Earring +1", waist="Brown Belt", waist="Purple Belt", back="Nomad's mantle +1"}

	
	--------------------------------------
	-- Midcast sets
	--------------------------------------

    -- Generic spell recast set
	sets.midcast.FastRecast = { rear="Loquacious Earring" }
		
	-- Specific spells
	sets.midcast.Utsusemi = {}

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------
	
	-- Resting sets
	sets.resting = {
    ammo="Bibiki Seashell", head="Arh. Jinpachi +1", neck="Orochi Nodowa +1", lear="Merman's Earring", rear="Merman's Earring",
    body="Arhat's Gi +1", hands="Denali Wristbands", ring1="Merman's Ring", ring2="Merman's Ring",
    back="Lamia Mantle +1", waist="Resolute Belt", legs="Dst. Subligar +1", feet="Herald's Gaiters" }
	

	-- Idle sets
	sets.idle = {
    ammo="Bibiki Seashell", head="Arh. Jinpachi +1", neck="Orochi Nodowa +1", lear="Merman's Earring", rear="Merman's Earring",
    body="Arhat's Gi +1", hands="Denali Wristbands", ring1="Merman's Ring", ring2="Merman's Ring",
    back="Lamia Mantle +1", waist="Resolute Belt", legs="Dst. Subligar +1", feet="Herald's Gaiters" }

	sets.idle.Town = {
    ammo="Bibiki Seashell", head="Arh. Jinpachi +1", neck="Orochi Nodowa +1", lear="Merman's Earring", rear="Merman's Earring",
    body="Arhat's Gi +1", hands="Denali Wristbands", ring1="Merman's Ring", ring2="Merman's Ring",
    back="Lamia Mantle +1", waist="Resolute Belt", legs="Dst. Subligar +1", feet="Herald's Gaiters" }
	
	sets.idle.Weak = {
    ammo="Bibiki Seashell", head="Arh. Jinpachi +1", neck="Orochi Nodowa +1", lear="Merman's Earring", rear="Merman's Earring",
    body="Arhat's Gi +1", hands="Denali Wristbands", ring1="Merman's Ring", ring2="Merman's Ring",
    back="Lamia Mantle +1", waist="Resolute Belt", legs="Dst. Subligar +1", feet="Herald's Gaiters" }
	
	-- Defense sets

    sets.defense.PDT  = { 
    ammo="Bibiki Seashell", head="Arh. Jinpachi +1", neck="Evasion Torque", lear="Triton Earring", rear="Triton Earring",
    body="Arhat's Gi +1", hands="Denali Wristbands", ring1="Jelly Ring",
    back="Boxer's Mantle", waist="Scouter's Rope", legs="Dst. Subligar +1", feet="Dst. Leggings +1", }

    sets.defense.MDT = {
    neck="Jeweled Collar +1", lear="Merman's Earring", rear="Merman's Earring", hands="Denali Wristbands",
    ring1="Merman's Ring", ring2="Merman's Ring", back="Lamia Mantle +1", waist="Resolute Belt" }

    -- Gear to wear for kiting
	sets.Kiting = { feet="Herald's Gaiters" }

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
	sets.engaged = {
	head="Walahra Turban", neck="Ancient Torque", lear="Merman's Earring", rear="Brutal Earring",
	body="Shura Togi +1", hands="Ochiudo's Kote", lring="Courage Ring +1", rring="Rajas Ring",
	back="Cerb. Mantle +1", waist="Black Belt", legs="Byakko's Haidate", feet="Fuma Sune-Ate", }
	sets.engaged.Acc = {}
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
