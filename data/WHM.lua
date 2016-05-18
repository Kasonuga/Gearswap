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
    state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
    state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'DualWield')
    state.RangedMode:options('Normal')
    state.HybridMode:options('Normal')
    state.WeaponskillMode:options('Normal')
    state.CastingMode:options('Normal', 'Resistent')
    state.IdleMode:options('Normal', 'PDT', 'MDT')
    state.RestingMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT')
    state.MagicalDefenseMode:options('MDT')

    -- Additional local binds
    send_command('bind ^` input /ja "Light Arts" <me>')
    send_command('bind !` input /ja "Dark Arts" <me>')

    gear.default.obi_waist = "Pythia Sash +1"
    gear.default.obi_back = "Mahatma Cape"

end

-- Called when this job file is unloaded (eg: job change)
function user_unload()

    send_command('unbind ^`')
    send_command('unbind !`')

end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = { lear="Loquacious Earring" }
        
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, { })

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
    feet="Cure Clogs" })
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.CureSolace = sets.precast.FC.Cure
    -- CureMelee spell map should default back to Healing Magic.
    
    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
    
    
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = { }
    

    -- Midcast Sets
    
    sets.midcast.FastRecast = {
    head="Walahra Turban", body="Goliard Saio", hands="Blessed Mitts +1",
    legs="Blessed Trousers +1", feet="Blessed Pumps +1", waist="Headlong Belt" }
    
    -- Cure sets

    sets.midcast.CureSolace = {
    main="Chatoyant Staff" , ammo="White Tathlum",
    head="Goliard Chapeau", neck="Fylgja Torque +1", lear="Roundel Earring", rear="Celestial Earring",
    body="Aristocrat's Coat", hands="Blessed Mitts +1", ring1="Celestial Ring", ring2="Celestial Ring",
    back=gear.default.obi_back, waist=gear.ElementalObi, legs="Blessed Trousers +1", feet="Clr. Duckbills +1" }

    sets.midcast.Cure = {
    main="Chatoyant Staff" , ammo="White Tathlum",
    head="Goliard Chapeau", neck="Fylgja Torque +1", lear="Roundel Earring", rear="Celestial Earring",
    body="Aristocrat's Coat", hands="Blessed Mitts +1", ring1="Celestial Ring", ring2="Celestial Ring",
    back=gear.default.obi_back, waist=gear.ElementalObi, legs="Blessed Trousers +1", feet="Clr. Duckbills +1" }

    sets.midcast['Cure V']= {
    main="Chatoyant Staff" , ammo="Bibiki Seashell",
    head="Goliard Chapeau", neck="Fylgja Torque +1", lear="Roundel Earring", rear="Celestial Earring",
    body="Aristocrat's Coat", hands="Blessed Mitts +1", ring1="Celestial Ring", ring2="Celestial Ring",
    back="Ixion Cape", waist=gear.ElementalObi, legs="Blessed Trousers +1", feet="Clr. Duckbills +1" }

    sets.midcast.Curaga = {
    main="Chatoyant Staff" , ammo="White Tathlum",
    head="Goliard Chapeau", neck="Fylgja Torque +1", lear="Roundel Earring", rear="Celestial Earring",
    body="Aristocrat's Coat", hands="Blessed Mitts +1", ring1="Celestial Ring", ring2="Celestial Ring",
    back=gear.default.obi_back, waist=gear.ElementalObi, legs="Blessed Trousers +1", feet="Clr. Duckbills +1" }

    sets.midcast.CureMelee = {
    head="Goliard Chapeau", neck="Fylgja Torque +1", lear="Roundel Earring", rear="Celestial Earring",
    body="Aristocrat's Coat", hands="Blessed Mitts +1", ring1="Celestial Ring", ring2="Celestial Ring",
    back=gear.default.obi_back, waist=gear.ElementalObi, legs="Blessed Trousers +1", feet="Clr. Duckbills +1" }

    sets.midcast.Cursna = {}

    sets.midcast.StatusRemoval = {}

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {
    neck="Enhancing Torque", lear="Augmenting Earring", feet="Clr. Duckbills +1" } )

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], { 
    neck="Promise Badge", ring1="Celestial Ring", ring2="Celestial Ring", hands="Blessed Mitts +1",
    legs="Blessed Trousers +1" } )

    sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {
    body="Blessed Briault +1", legs="Clr. Pantaln. +1" } )

    sets.midcast.Regen = set_combine(sets.midcast.FastRecast,  {
    body="Cleric's Briault" } )

    sets.midcast['Divine Magic'] = set_combine(sets.midcast.MndEnfeebles, {
    neck="Divine Torque", lear="Divine Earring" } )

    sets.midcast['Dark Magic'] = set_combine(sets.midcast.IntEnfeebles, {
    neck="Dark Torque", lear="Dark Earring" } )

    -- Custom spell classes
    sets.midcast.MndEnfeebles = {
    head="Elite Beret +1", neck="Enfeebling Torque", ear1="Enfeebling Earring", ear2="Incubus Earring +1",
    body="Healer's Briault", hands="Clr. Mitts +1", ring1="Celestial Ring", ring2="Celestial Ring",
    back="Hecate's Cape", waist="Witch Sash", legs="Bls. Trousers +1", feet="Avocat Pigaches" }

    sets.midcast.IntEnfeebles = {
    head="Elite Beret +1", neck="Enfeebling Torque", ear1="Enfeebling Earring", ear2="Incubus Earring +1",
    body="Healer's Briault", hands="Clr. Mitts +1", ring1="Omn. Ring +1", ring2="Omn. Ring +1",
    back="Hecate's Cape", waist="Witch Sash", legs="Mahatma Slops", feet="Avocat Pigaches" }

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {
    main=gear.Staff.HMP, sub="Flat Shield",
    head="Goliard Chapeau", neck="Beak Necklace +1", lear="Rapture Earring", rear="Antivenom Earring",
    body="Mahatma Hpl.", hands="Hydra Gloves", ring1="Celestial Ring", ring2="Celestial Ring", back="Invigorating Cape",
    waist="Qiqirn Sash +1", legs="Oracle's Braconi", feet="Avocat Pigaches" }
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {
    main=gear.Staff.PDT, body="Ixion Cloak", feet="Herald's Gaiters", back="Umbra Cape", waist="Resolute Belt",
    neck="Orochi Nodowa +1", lear="Merman's Earring", ring1="Merman's Ring", rear="Merman's Earring", ring2="Merman's Ring" }

    sets.idle.PDT = {
    main=gear.Staff.PDT, body="Ixion Cloak", feet="Herald's Gaiters", back="Umbra Cape", waist="Resolute Belt",
    neck="Orochi Nodowa +1", lear="Merman's Earring", ring1="Merman's Ring", rear="Merman's Earring", ring2="Merman's Ring" }

    sets.idle.Town = {
    main=gear.Staff.PDT, body="Ixion Cloak", feet="Herald's Gaiters", back="Umbra Cape", waist="Resolute Belt",
    neck="Orochi Nodowa +1", lear="Merman's Earring", ring1="Merman's Ring", rear="Merman's Earring", ring2="Merman's Ring" }
    
    sets.idle.Weak = {
    main=gear.Staff.PDT, body="Ixion Cloak", feet="Herald's Gaiters", back="Umbra Cape", waist="Resolute Belt",
    neck="Orochi Nodowa +1", lear="Merman's Earring", ring1="Merman's Ring", rear="Merman's Earring", ring2="Merman's Ring" }
    
    -- Defense sets

    sets.defense.PDT = {
    main="Terra's Staff", sub="Vivid Strap +1", ammo="White Tathlum",
    head=naked, neck="Orochi Nodowa +1", ear1="Merman's Earring", ear2="Merman's Earring",
    body="Ixion Cloak", hands="Merman's Bangles", ring1="Jelly Ring", ring2="Merman's Ring",
    back="Umbra Cape", waist="Resolute Belt", legs="Mahatma Slops", feet="Herald's Gaiters" }

    sets.defense.MDT = {
    main="Terra's Staff", sub="Vivid Strap +1", ammo="White Tathlum",
    neck="Orochi Nodowa +1", ear1="Merman's Earring", ear2="Merman's Earring",
    hands="Merman's Bangles", ring1="Jelly Ring", ring2="Merman's Ring",
    back="Hexerei Cape", waist="Resolute Belt", legs="Mahatma Slops", feet="Herald's Gaiters" }

    sets.Kiting = { feet="Herald's Gaiters" }

    sets.latent_refresh = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
    head="Walahra Turban", body="Hydra Doublet", hands="Blessed Mitts +1", lear="Merman's Earring", rear="Brutal Earring",
    back="Umbra Cape", ring1="Toreador's Ring", ring2="Rajas Ring", waist="Headlong Belt", legs="Blessed Trousers +1", feet="Blessed Pumps +1" }

    sets.engaged.DualWield = {
    head="Walahra Turban", body="Hydra Doublet", hands="Blessed Mitts +1", lear="Suppanomimi", rear="Brutal Earring",
    back="Umbra Cape", ring1="Toreador's Ring", ring2="Rajas Ring", waist="Headlong Belt", legs="Blessed Trousers +1", feet="Blessed Pumps +1" }


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spell.english == "Paralyna" and buffactive.Paralyzed then
        -- no gear swaps if we're paralyzed, to avoid blinking while trying to remove it.
        eventArgs.handled = true
    end
    
    if spell.skill == 'Healing Magic' then
        gear.default.obi_back = "Mending Cape"
    else
        gear.default.obi_back = "Toro Cape"
    end
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
        equip(sets.buff['Divine Caress'])
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if (default_spell_map == 'Cure' or default_spell_map == 'Curaga') and player.status == 'Engaged' then
            return "CureMelee"
        elseif default_spell_map == 'Cure' and state.Buff['Afflatus Solace'] then
            return "CureSolace"
        elseif spell.skill == "Enfeebling Magic" then
            if spell.type == "WhiteMagic" then
                return "MndEnfeebles"
            else
                return "IntEnfeebles"
            end
        end
    end
end


function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    if cmdParams[1] == 'user' and not areas.Cities:contains(world.area) then
        local needsArts = 
            player.sub_job:lower() == 'sch' and
            not buffactive['Light Arts'] and
            not buffactive['Addendum: White'] and
            not buffactive['Dark Arts'] and
            not buffactive['Addendum: Black']
            
        if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
            if needsArts then
                send_command('@input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')
            else
                send_command('@input /ja "Afflatus Solace" <me>')
            end
        end
    end
end


-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(4, 14)
end

