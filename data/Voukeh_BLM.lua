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
    state.RangedMode:options('Normal')
    state.HybridMode:options('Normal')
    state.WeaponskillMode:options('Normal')
    state.CastingMode:options('Normal', 'Accuracy')
    state.IdleMode:options('Normal', 'PDT', 'MDT')
    state.RestingMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT')
    state.MagicalDefenseMode:options('MDT')

    -- Additional local binds
    send_command('bind ^` input /ja "Light Arts" <me>')
    send_command('bind !` input /ja "Dark Arts" <me>')

end


-- Called when this job file is unloaded (eg: job change)
function user_unload()

    send_command('unbind ^`')
    send_command('unbind !`')

end

function init_gear_sets()	
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
    sub="Vivid Strap +1", lear="Loquacious Earring" }
        
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {} )

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {} )

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, { } )

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], { } )
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.CureSolace = sets.precast.FC.Cure
    -- CureMelee spell map should default back to Healing Magic.
    
    -- Precast sets to enhance JAs

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
    
    
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = { }


    -- Midcast Sets
    
    sets.midcast.FastRecast = {
    sub="Vivid Strap +1", head="Walahra Turban", body="Goliard Saio", rear="Loquacious Earring"}
    
    -- Cure sets

    sets.midcast.Cure = {
    main="Chatoyant Staff" , ammo="White Tathlum", neck="Fylgja Torque +1", lear="Roundel Earring", rear="Celestial Earring",
    head="Goliard Chapeau", body="Goliard Saio", hands="Devotee's Mitts +1", ring1="Celestial Ring", ring2="Celestial Ring",
    back=gear.default.obi_back, waist="Pythia Sash +1", legs=" ", feet="Avocat Pigaches" }

    sets.midcast.Curaga = {
    main="Chatoyant Staff" , ammo="White Tathlum", neck="Fylgja Torque +1", lear="Roundel Earring", rear="Celestial Earring",
    head="Goliard Chapeau", body="Goliard Saio", hands="Devotee's Mitts +1", ring1="Celestial Ring", ring2="Celestial Ring",
    back=gear.default.obi_back, waist="Pythia Sash +1", legs=" ", feet="Avocat Pigaches" }

    sets.midcast.CureMelee = {
    ammo="White Tathlum", neck="Fylgja Torque +1", lear="Roundel Earring", rear="Celestial Earring",
    head="Goliard Chapeau", body="Goliard Saio", hands="Devotee's Mitts +1", ring1="Celestial Ring", ring2="Celestial Ring",
    back=gear.default.obi_back, waist="Pythia Sash +1", legs=" ", feet="Avocat Pigaches" }

    sets.midcast.Cursna = {}

    sets.midcast.StatusRemoval = {}

    sets.midcast['Enhancing Magic'] = {
    neck="Enhancing Torque", rear="Augmenting Earring" }

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
    main="Chatoyant Staff", back="Prism Cape", lring="Celestial Ring", rring="Celestial Ring" } )

    sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], { } )


    sets.midcast['Dark Magic'] = {
    neck="Dark Torque", lear="Dark Earring", rear="Incubus Earring +1", body="", hands="Sorcerer's Gloves",
    back="Hecate's Cape", waist="Witch Sash", legs="Wizard's Tonban", feet="Genie Huaraches" }

    sets.midcast['Elemental Magic'] = {
    main="Chatoyant Staff", head="Src. Petasos +1", neck="Lmg. Medallion +1", lear="Moldavite Earring", rear="Elemental Earring",
    body="Genie Weskit", hands="Zenith Mitts +1", lring="Omn. Ring +1", rring="Omn. Ring +1",
    back="Hecate's Cape", waist=gear.ElementalObi, legs="Mahatma Slops", feet="River Gaiters" }

    -- Blizzard specific staff
    sets.midcast.blizzard = set_combine(sets.midcast['Elemental Magic'], {
    main="Aquilo's Staff" } )

    -- Custom spell classes
    sets.midcast.MndEnfeebles = {   
    main="Mistilteinn", sub="Nms. Shield +1", head="Dls. Chapeau +1", neck="Justice Badge", 
    lear="Celestial Earring", rear="Celestial Earring", body="Mahatma Hpl.", hands="Devotee's Mitts +1",
    lring="Celestial Ring", rring="Celestial Ring", back="Prism Cape", waist="Witch Sash",
    legs="Genie Lappas", feet="Duelist's Boots" }

    sets.midcast.MndEnfeebles.Accuracy = {
    main="Chatoyant Staff", head="Genie Tiara", neck="Enfeebling Torque", lear="Incubus Earring +1", rear="Incubus Earring +1",
    body="Wizard's Coat", hands="Devotee's Mitts +1", lring="Celestial Ring", rring="Celestial Ring",
    back="Hecate's Cape", waist="Witch Sash", legs="Genie Lappas", feet="Avocat Pigaches" }

    -- Sets for mnd enfeebles with no potency
    sets.midcast.dia = sets.midcast.MndEnfeebles.Accuracy
    sets.midcast['Silence'] = sets.midcast.MndEnfeebles.Accuracy

    sets.midcast.IntEnfeebles = {
    main="Chatoyant Staff", head="Genie Tiara", neck="Enfeebling Torque", lear="Incubus Earring +1", rear="Incubus Earring +1",
    body="Wizard's Coat", hands="Mahatma Cuffs", lring="Omn. Ring +1", rring="Omn. Ring +1",
    back="Hecate's Cape", waist="Witch Sash", legs="Genie Lappas", feet="Avocat Pigaches" }

    sets.midcast.IntEnfeebles.Accuracy = {
    main="Chatoyant Staff", head="Genie Tiara", neck="Enfeebling Torque", lear="Incubus Earring +1", rear="Incubus Earring +1",
    body="Wizard's Coat", hands="Mahatma Cuffs", lring="Omn. Ring +1", rring="Omn. Ring +1",
    back="Hecate's Cape", waist="Witch Sash", legs="Genie Lappas", feet="Avocat Pigaches" }

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {
    main=gear.Staff.HMP, sub="Flat Shield", head="Goliard Chapeau", neck="Beak Necklace +1",
    lear="Rapture Earring", rear="Antivenom Earring", body="Mahatma Hpl.", hands="Hydra Gloves",
    ring1="Celestial Ring", ring2="Celestial Ring", back="Invigorating Cape",
    waist="Qiqirn Sash +1", legs="Oracle's Bracconi", feet="Avocat Pigaches" }
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {
    main=gear.Staff.PDT, ammo="Hedgehog Bomb", head="Dls. Chapeau +1", neck="Orochi Nodowa +1",
    lear="Merman's Earring", rear="Merman's Earring", body="Dalmatica +1", hands=" ",
    lring="Merman's Ring", rring="Merman's Ring", back="Umbra Cape", waist="Resolute Belt", 
    legs=" ", feet="Herald's Gaiters" }

    sets.idle.PDT = {
    main=gear.Staff.PDT, ammo="Hedgehog Bomb", head="Dls. Chapeau +1", neck="Orochi Nodowa +1",
    lear="Merman's Earring", rear="Merman's Earring", body="Dalmatica +1", hands=" ",
    lring="Jelly Ring", rring="Merman's Ring", back="Umbra Cape", waist="Resolute Belt", 
    legs=" ", feet="Herald's Gaiters" }

    sets.idle.MDT = {
    main=gear.Staff.MDT, ammo="Hedgehog Bomb", head="Dls. Chapeau +1", neck="Orochi Nodowa +1",
    lear="Merman's Earring", rear="Merman's Earring", body="Dalmatica +1", hands=" ",
    lring="Merman's Ring", rring="Merman's Ring", back="Hexerei Cape", waist="Resolute Belt", 
    legs=" ", feet="Herald's Gaiters" }

    sets.idle.Town = {
    main=gear.Staff.PDT, ammo="Hedgehog Bomb", head="Dls. Chapeau +1", neck="Orochi Nodowa +1", 
    lear="Merman's Earring", rear="Merman's Earring", body="Dalmatica +1", hands=" ",
    lring="Merman's Ring", rring="Merman's Ring", back="Umbra Cape", waist="Resolute Belt",
    legs=" ", feet="Herald's Gaiters" }
    
    sets.idle.Weak = {
    main=gear.Staff.PDT, ammo="Hedgehog Bomb", head="Dls. Chapeau +1", neck="Orochi Nodowa +1",
    lear="Merman's Earring", rear="Merman's Earring", body="Dalmatica +1", hands=" ",
    lring="Merman's Ring", rring="Merman's Ring", back="Umbra Cape", waist="Resolute Belt", 
    legs=" ", feet="Herald's Gaiters" }
    
    -- Defense sets

    sets.defense.PDT = {
    main=gear.Staff.PDT, neck="Orochi Nodowa +1", ring1="Jelly Ring", back="Umbra Cape"}

    sets.defense.MDT = {
    head=" ",neck="Jeweled Collar +1", body="Dalmatica +1", hands=" ",
    ring1="Merman's Ring", ring2="Merman's Ring", waist="Resolute Belt", lear="Merman's Earring",
    waist="Resolute Belt", rear="Merman's Earring", back="Resentment Cape", legs=" ",
    feet=" " }

    sets.Kiting = { feet="Herald's Gaiters" }

    sets.latent_refresh = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = { }

    sets.engaged.Acc = { }


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------



-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'None' then
            enable('main','sub','range')
        else
            disable('main','sub','range')
        end
    end
end
