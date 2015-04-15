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
    sets.precast.FC = { lear="Loquacious Earring" }
        
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
    gear.default.weaponskill_neck = "Ancient Torque"
    gear.default.weaponskill_waist = "Cuchulain's Belt"

    sets.precast.WS = {
    head="Voyager Sallet", neck=gear.ElementalGorget, lear="Suppanomimi", rear="Brutal Earring", ring1="Toreador's Ring",
    body="Assault Jerkin", waist=gear.default.weaponskill_waist, ring2="Rajas Ring" }
    
    sets.precast.WS['Savage Blade'] = set_combine( sets.precast.WS, { } )
	
    sets.precast.WS['Vorpal Blade'] = set_combine( sets.precast.Crit_WS, { neck="Soil Gorget" }  )
    

    -- Midcast Sets
    
    sets.midcast.FastRecast = {
    main="Capricorn Staff", sub="Vivid Strap +1", head="Warlock's Chapeau", body="Goliard Saio",
    hands="Dusk Gloves +1", lear="Loquacious Earring", feet="Dusk Ledelsens +1", waist="Sonic Belt +1", rear="Loquacious Earring" }
    
    -- Cure sets
    gear.default.obi_waist = "Pythia Sash +1"
    gear.default.obi_back = "White Cape +1"

    sets.midcast.Cure = {
    main="Chatoyant Staff", ammo="White Tathlum", neck="Fylgja Torque +1", lear="Roundel Earring", rear="Celestial Earring",
    head="Goliard Chapeau", body="Goliard Saio", hands="Devotee's Mitts +1", ring1="Celestial Ring", ring2="Celestial Ring",
    back=gear.default.obi_back, waist=gear.ElementalObi, legs=" ", feet=" " }

    sets.midcast.Curaga = {
    main="Chatoyant Staff" , ammo="White Tathlum", neck="Fylgja Torque +1", lear="Roundel Earring", rear="Celestial Earring",
    head="Goliard Chapeau", body="Goliard Saio", hands="Devotee's Mitts +1", ring1="Celestial Ring", ring2="Celestial Ring",
    back=gear.default.obi_back, waist=gear.ElementalObi, legs=" ", feet=" " }

    sets.midcast.CureMelee = {
    ammo="White Tathlum", neck="Fylgja Torque +1", lear="Roundel Earring", rear="Celestial Earring",
    head="Goliard Chapeau",  body="Goliard Saio", hands="Devotee's Mitts +1", ring1="Celestial Ring", ring2="Celestial Ring",
    back=gear.default.obi_back, waist=gear.ElementalObi, legs=" ", feet=" " }

    sets.midcast.Cursna = {}

    sets.midcast.StatusRemoval = {}

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
    sets.midcast['Enhancing Magic'] = {
    neck="Enhancing Torque", lear="Augmenting Earring", body="Glamour Jupon", hands="Duelist's Gloves", legs="Warlock's Tights" }

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
    main="Chatoyant Staff", body="Mahatma Hpl.",  legs="Mahatma Slops", feet="River Gaiters", neck="Promise Badge",
    lear="Celestial Earring", rear="Celestial Earring", lring="Celestial Ring", rring="Celestial Ring"  } )

    sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], { } )

    sets.midcast['Divine Magic'] = {
    neck="Divine Torque", lear="Divine Earring" }

    sets.midcast['Dark Magic'] = {
    neck="Dark Torque", lear="Dark Earring", body="Glamour Jupon", hands="Blood Fng. Gnt.", back="Hecate's Cape", waist="Witch Sash" }

    sets.midcast['Elemental Magic'] = {
    main="Chatoyant Staff", head="Warlock's Chapeau", neck="Elemental Torque", lear="Moldavite Earring", rear="Crapaud Earring",
    body="Mahatma Hpl.", hands="Zenith Mitts +1", lring="Omn. Ring +1", rring="Omn. Ring +1",
    back="Hecate's Cape", waist="Witch Sash", legs="Duelist's Tights", feet="Duelist's Boots" }

    -- Custom spell classes
    sets.midcast.MndEnfeebles = {
    main="Mistilteinn", sub="Nms. Shield +1", head="Dls. Chapeau +1", neck="Justice Badge", 
    lear="Celestial Earring", rear="Celestial Earring", body="Mahatma Hpl.", hands="Devotee's Mitts +1",
    lring="Celestial Ring", rring="Celestial Ring", back="Hecate's Cape", waist="Witch Sash",
    legs="Mahatma Slops", feet="River Gaiters" }

    sets.midcast.MndEnfeebles.Accuracy = {
    main="Chatoyant Staff", head="Dls. Chapeau +1", neck="Enfeebling Torque", lear="Incubus Earring +1", rear="Incubus Earring +1",
    body="Warlock's Tabard", hands="Devotee's Mitts +1", lring="Celestial Ring", rring="Celestial Ring",
    back="Hecate's Cape", waist="Witch Sash", legs="Mahatma Slops", feet="Avocat Pigaches"  }

    sets.midcast.IntEnfeebles = {
    main="Chatoyant Staff", head="Dls. Chapeau +1", neck="Enfeebling Torque", lear="Incubus Earring +1", rear="Incubus Earring +1",
    body="Warlock's Tabard", hands="Mahatma Cuffs", lring="Omn. Ring +1", rring="Omn. Ring +1",
    back="Hecate's Cape", waist="Witch Sash", legs="Mahatma Slops", feet="Avocat Pigaches"  }

    sets.midcast.IntEnfeebles.Accuracy = {
    main="Chatoyant Staff", head="Dls. Chapeau +1", neck="Enfeebling Torque", lear="Incubus Earring +1", rear="Incubus Earring +1",
    body="Warlock's Tabard", hands="Mahatma Cuffs", lring="Omn. Ring +1", rring="Omn. Ring +1",
    back="Hecate's Cape", waist="Witch Sash", legs="Mahatma Slops", feet="Avocat Pigaches"  }

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {
    main=gear.Staff.HMP, sub="Flat Shield", head="Goliard Chapeau", neck="Beak Necklace +1", lear="Rapture Earring", rear="Antivenom Earring",
    body="Mahatma Hpl.", hands="Hydra Gloves", ring1="Celestial Ring", ring2="Celestial Ring", back="Invigorating Cape",
    waist="Qiqirn Sash +1", legs="Oracle's Braconi", feet="Avocat's Pigaches" }
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {
    main=gear.Staff.PDT, ammo="Hedgehog Bomb", head="Dls. Chapeau +1", neck="Orochi Nodowa +1",
    lear="Merman's Earring", rear="Merman's Earring", body="Dalmatica +1", hands="Coral Fng. Gnt. +1",
    lring="Merman's Ring", rring="Merman's Ring", back="Umbra Cape", waist="Resolute Belt", 
    legs="Blood Cuisses", feet="Coral Greaves +1" }

    sets.idle.PDT = {
    main=gear.Staff.PDT, ammo="Hedgehog Bomb", head="Dls. Chapeau +1", neck="Orochi Nodowa +1",
    lear="Merman's Earring", rear="Merman's Earring", body="Dalmatica +1", hands="Dst. Mittens +1",
    lring="Jelly Ring", rring="Merman's Ring", back="Umbra Cape", waist="Resolute Belt", 
    legs="Blood Cuisses", feet="Dst. Leggings +1" }

    sets.idle.MDT = {
    main=gear.Staff.MDT, ammo="Hedgehog Bomb", head="Dls. Chapeau +1", neck="Orochi Nodowa +1",
    lear="Merman's Earring", rear="Merman's Earring", body="Dalmatica +1", hands="Coral Fng. Gnt. +1",
    lring="Merman's Ring", rring="Merman's Ring", back="Umbra Cape", waist="Resolute Belt", 
    legs="Blood Cuisses", feet="Coral Greaves +1" }

    sets.idle.Town = {
    main=gear.Staff.PDT, ammo="Hedgehog Bomb", head="Dls. Chapeau +1", neck="Orochi Nodowa +1", 
    lear="Merman's Earring", rear="Merman's Earring", body="Dalmatica +1", hands="Coral Fng. Gnt. +1",
    lring="Merman's Ring", rring="Merman's Ring", back="Umbra Cape", waist="Resolute Belt",
    legs="Blood Cuisses", feet="Coral Greaves +1" }
    
    sets.idle.Weak = {
    main=gear.Staff.PDT, ammo="Hedgehog Bomb", head="Dls. Chapeau +1", neck="Orochi Nodowa +1",
    lear="Merman's Earring", rear="Merman's Earring", body="Dalmatica +1", hands="Coral Fng. Gnt. +1",
    lring="Merman's Ring", rring="Merman's Ring", back="Umbra Cape", waist="Resolute Belt", 
    legs="Blood Cuisses", feet="Coral Greaves +1" }
    
    -- Defense sets

    sets.defense.PDT = {
    main=gear.Staff.PDT, neck="Orochi Nodowa +1", body="Dst. Harness +1", hands="Dst. Mittens +1",
    ring1="Jelly Ring", back="Umbra Cape", legs="Dst. Subligar +1", feet="Dst. Leggings +1" }

    sets.defense.MDT = {
    head="Louhi's Mask",neck="Jeweled Collar +1", body="Dalmatica +1", hands="Coral Fng. Gnt. +1",
    ring1="Merman's Ring", ring2="Merman's Ring", waist="Resolute Belt", lear="Merman's Earring",
    waist="Resolute Belt", rear="Merman's Earring", back="Resentment Cape", legs="Coral Cuisses +1", feet="Coral Greaves +1" }

    sets.Kiting = { legs="Blood Cuisses" }

    sets.latent_refresh = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
    head="Walahra Turban", neck="Ancient Torque", body="Hydra Doublet", hands="Dusk Gloves +1",
    lear="Suppanomimi", rear="Brutal Earring", back="Cerb. Mantle +1",
    ring1="Toreador's Ring", ring2="Rajas Ring", waist="Sonic Belt +1", legs="Dusk Trousers +1", feet="Dusk Ledelsens +1" }

    sets.engaged.Acc = {
    head="Walahra Turban", neck="Ancient Torque", body="Hydra Doublet", hands="Dusk Gloves +1",
    lear="Suppanomimi", rear="Brutal Earring", back="Cerb. Mantle +1",
    ring1="Toreador's Ring", ring2="Rajas Ring", waist="Sonic Belt +1", legs="Dusk Trousers +1", feet="Dusk Ledelsens +1" }


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
