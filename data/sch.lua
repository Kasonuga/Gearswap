-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
        Custom commands:
        Shorthand versions for each strategem type that uses the version appropriate for
        the current Arts.
                                        Light Arts              Dark Arts
        gs c scholar light              Light Arts/Addendum
        gs c scholar dark                                       Dark Arts/Addendum
        gs c scholar cost               Penury                  Parsimony
        gs c scholar speed              Celerity                Alacrity
        gs c scholar aoe                Accession               Manifestation
        gs c scholar power              Rapture                 Ebullience
        gs c scholar duration           Perpetuance
        gs c scholar accuracy           Altruism                Focalization
        gs c scholar enmity             Tranquility             Equanimity
        gs c scholar skillchain                                 Immanence
        gs c scholar addendum           Addendum: White         Addendum: Black
--]]



-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
	include('organizer-lib')
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    info.addendumNukes = S{"Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV"}

    state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
    update_active_strategems()
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')


    info.low_nukes = S{"Stone", "Water", "Aero", "Fire", "Blizzard", "Thunder"}
    info.mid_nukes = S{"Stone II", "Water II", "Aero II", "Fire II", "Blizzard II", "Thunder II",
                       "Stone III", "Water III", "Aero III", "Fire III", "Blizzard III", "Thunder III",
                       "Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",}
    info.high_nukes = S{"Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V"}
end

function user_unload()
    send_command('unbind ^`')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = { }


    -- Fast cast sets for spells

    sets.precast.FC = {
    main="Chatoyant Staff", sub="Vivid Strap +1", body="Goliard Saio",
    feet="Scholar's Loafers", lear="Loquac. Earring", back="Warlock's Mantle", head="Walahra Turban"}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, { })

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {})


    -- Midcast Sets

    sets.midcast.FastRecast = {
    body="Goliard Saio", lear="Loquac. Earring",
    waist="Headlong Belt", head="Walahra Turban"}

    sets.midcast.Cure = {
    main="Chatoyant Staff", ammo="White Tathlum",
	head="Goliard Chapeau", neck="Fylgja Torque +1", ear1="Celestial Earring", ear2="Celestial Earring",
	body="Goliard Saio", hands="Scholar's Bracers", ring1="Celestial Ring", ring2="Celestial Ring",
	back="Mahatma Cape", waist="Pythia Sash +1", legs="Mahatma Slops", feet="Argute Loafers"}

    sets.midcast.CureWithLightWeather = {
    main="Chatoyant Staff", ammo="White Tathlum",
	head="Goliard Chapeau", neck="Fylgja Torque +1", ear1="Celestial Earring", ear2="Celestial Earring",
	body="Goliard Saio", hands="Scholar's Bracers", ring1="Celestial Ring", ring2="Celestial Ring",
	back="Mahatma Cape", waist="Pythia Sash +1", legs="Mahatma Slops", feet="Argute Loafers"}

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Regen = {
    head="Walahra Turban", body="Goliard Saio", feet="Argute Loafers"}

    sets.midcast.Cursna = {}

    sets.midcast['Enhancing Magic'] = {
    head="Walahra Turban", body="Argute Gown",
    ear1="Augment. Earring", legs="Scholar's Pants", neck="Enhancing Torque"}

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
    main="Chatoyant Staff", neck="Enhancing Torque",
    hands="Dvt. Mitts +1", ring1="Celestial Ring", body="Goliard Saio", ring2="Celestial Ring", back="Prism Cape",
    waist="Penitent's Rope", legs="Mahatma Slops", feet="Scholar's Loafers", head="Walahra Turban"})

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {
    neck="Enhancing Torque",
    hands="Dvt. Mitts +1", ring1="Celestial Ring", ring2="Celestial Ring", back="Prism Cape",  head="Walahra Turban",
    waist="Pythia Sash +1", legs="Mahatma Slops", feet="Scholar's Loafers"})



    -- Custom spell classes
    sets.midcast.MndEnfeebles = {
    main="Chatoyant Staff", ammo="White Tathlum",
	head=naked, neck="Enfeebling Torque", ear1="Incubus Earring +1", ear2="Incubus Earring +1",
	body="Ixion Cloak", hands="Argute Bracers", ring1="Celestial Ring", ring2="Celestial Ring",
	back="Hecate's Cape", waist="Pythia Sash +1", legs="Scholar's Pants", feet="Avocat Pigaches"}

    sets.midcast.IntEnfeebles = {
    main="Chatoyant Staff", sub="Vivid Strap +1", ammo="Phantom Tathlum",
	head="Elite Beret +1", neck="Enfeebling Torque", ear1="Incubus Earring +1", ear2="Incubus Earring +1",
	body="Scholar's Gown", hands="Argute Bracers", ring1="Omn. Ring +1", ring2="Omn. Ring +1",
	back="Hecate's Cape", waist="Penitent's Rope", legs="Mahatma Slops", feet="Avocat Pigaches"}

    sets.midcast.ElementalEnfeeble = sets.midcast.IntEnfeebles

    sets.midcast['Dark Magic'] = {main="Chatoyant Staff", sub="Vivid Strap +1", ammo="Phantom Tathlum",
	head="Scholar's M.board", neck="Dark Torque", ear1="Incubus Earring +1", ear2="Incubus Earring +1",
	body="Scholar's Gown", hands="Argute Bracers", ring1="Omn. Ring +1", ring2="Omn. Ring +1",
	back="Hecate's Cape", waist="Penitent's Rope", legs="Mahatma Slops", feet="River Gaiters"}

    sets.midcast.Drain = {main="Chatoyant Staff", sub="Vivid Strap +1", ammo="Phantom Tathlum",
	head="Scholar's M.board", neck="Dark Torque", ear1="Incubus Earring +1", ear2="Incubus Earring +1",
	body="Scholar's Gown", hands="Argute Bracers", ring1="Omn. Ring +1", ring2="Omn. Ring +1",
	back="Hecate's Cape", waist="Penitent's Rope", legs="Mahatma Slops", feet="River Gaiters"}

    sets.midcast.Aspir = sets.midcast.Drain



    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {
    main="Chatoyant Staff", sub="Vivid Strap +1", ammo="Phantom Tathlum",
	head="Scholar's M.board", neck="Lmg. Medallion +1", ear1="Crapaud Earring", ear2="Moldavite Earring",
	body="Mahatma Hpl.", hands="Argute Bracers", ring1="Omn. Ring +1", ring2="Omn. Ring +1",
	back="Hecate's Cape", waist="Penitent's Rope", legs="Mahatma Slops", feet="River Gaiters"}

    sets.midcast['Elemental Magic'].Resistant = {
    main="Chatoyant Staff", sub="Vivid Strap +1", ammo="Phantom Tathlum",
	head="Argute M.board", neck="Lmg. Medallion +1", ear1="Elemental Earring", ear2="Moldavite Earring",
	body="Scholar's Gown", hands="Argute Bracers", ring1="Omn. Ring +1", ring2="Omn. Ring +1",
	back="Hecate's Cape", waist="Penitent's Rope", legs="Mahatma Slops", feet="River Gaiters"}

    -- Custom refinements for certain nuke tiers
    sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {
    main="Chatoyant Staff", sub="Vivid Strap +1", ammo="Phantom Tathlum", head="Scholar's M.board", neck="Lmg. Medallion +1",
    ear1="Crapaud Earring", ear2="Moldavite Earring", body="Mahatma Hpl.", hands="Argute Bracers", ring1="Omn. Ring +1",
    ring2="Omn. Ring +1", back="Hecate's Cape", waist="Penitent's Rope", legs="Mahatma Slops", feet="River Gaiters"})

    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {
    main="Chatoyant Staff", sub="Vivid Strap +1", ammo="Phantom Tathlum",
	head="Argute M.board", neck="Lmg. Medallion +1", ear1="Elemental Earring", ear2="Moldavite Earring",
	body="Scholar's gown", hands="Argute Bracers", ring1="Omn. Ring +1", ring2="Omn. Ring +1",
	back="Hecate's Cape", waist="Penitent's Rope", legs="Mahatma Slops", feet="River Gaiters"})
		
    sets.midcast['Elemental Magic'].Helix = {
    main="Chatoyant Staff", sub="Vivid Strap +1", ammo="Phantom Tathlum",
	head="Scholar's M.board", neck="Lmg. Medallion +1", ear1="Phtm. Earring +1", ear2="Phtm. Earring +1",
	body="Mahatma Hpl.", hands="Argute Bracers", ring1="Omn. Ring +1", ring2="Omn. Ring +1",
	back="Prism Cape", waist="Penitent's Rope", legs="Mahatma Slops", feet="River Gaiters"}
       
        sets.Obi = {}
       
        sets.Obi.Fire = {}--waist='Karin Obi'}
       
        sets.Obi.Earth = {}--waist='Dorin Obi'}
       
        sets.Obi.Water = {}--waist='Suirin Obi'}
       
        sets.Obi.Wind = {}--waist='Furin Obi'}
       
        sets.Obi.Ice = {waist='Hyorin Obi'}
       
        sets.Obi.Lightning = { }
       
        sets.Obi.Light = { }
       
        sets.Obi.Dark = { }
       
        sets.Staves = {}
       
        sets.Staves.Ice = {main="Aquilo's Staff"}    		
		
		
	
    -- Sets to return to when not performing an action.

    -- Resting sets
    sets.resting = {
    main="Imperial Wand", sub="Flat Shield", ammo="White Tathlum",
	head="Goliard Chapeau", neck="Beak Necklace +1", ear1="Antivenom Earring", ear2="Rapture Earring",
	body="Mahatma Hpl.", hands="Hydra Gloves", ring1="Celestial Ring", ring2="Celestial Ring",
	back="Invigorating Cape", waist="Qiqirn Sash +1", legs="Baron's Slops", feet="Avocat Pigaches"}


    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle.Town = {
    main="Terra's Staff", sub="Vivid Strap +1", ammo="White Tathlum",
	head=naked, neck="Orochi Nodowa +1", ear1="Merman's Earring", ear2="Merman's Earring",
	body="Ixion Cloak", hands="Merman's Bangles", ring1="Merman's Ring", ring2="Merman's Ring",
	back="Umbra Cape", waist="Resolute Belt", legs="Argute Pants", feet="Herald's Gaiters"}

    sets.idle.Field = {
    main="Terra's Staff", sub="Vivid Strap +1", ammo="White Tathlum",
	head=naked, neck="Orochi Nodowa +1", ear1="Merman's Earring", ear2="Merman's Earring",
	body="Ixion Cloak", hands="Merman's Bangles", ring1="Merman's Ring", ring2="Merman's Ring",
	back="Umbra Cape", waist="Resolute Belt", legs="Argute Pants", feet="Herald's Gaiters"}

    sets.idle.Field.PDT = {
    main="Terra's Staff", sub="Vivid Strap +1", ammo="White Tathlum",
	head=naked, neck="Orochi Nodowa +1", ear1="Merman's Earring", ear2="Merman's Earring",
	body="Ixion Cloak", hands="Merman's Bangles", ring1="Merman's Ring", ring2="Merman's Ring",
	back="Umbra Cape", waist="Resolute Belt", legs="Argute Pants", feet="Herald's Gaiters"}

    sets.idle.Field.Stun = {
    main="Terra's Staff", sub="Vivid Strap +1", ammo="White Tathlum",
	head=naked, neck="Orochi Nodowa +1", ear1="Merman's Earring", ear2="Merman's Earring",
	body="Ixion Cloak", hands="Merman's Bangles", ring1="Merman's Ring", ring2="Merman's Ring",
	back="Umbra Cape", waist="Resolute Belt", legs="Argute Pants", feet="Herald's Gaiters"}

    sets.idle.Weak = {
    main="Terra's Staff", sub="Vivid Strap +1", ammo="White Tathlum",
	head=naked, neck="Orochi Nodowa +1", ear1="Merman's Earring", ear2="Merman's Earring",
	body="Ixion Cloak", hands="Merman's Bangles", ring1="Merman's Ring", ring2="Merman's Ring",
	back="Umbra Cape", waist="Resolute Belt", legs="Argute Pants", feet="Herald's Gaiters"}

    -- Defense sets

    sets.defense.PDT = {
    main="Terra's Staff", sub="Vivid Strap +1", ammo="White Tathlum",
	head=naked, neck="Orochi Nodowa +1", ear1="Merman's Earring", ear2="Merman's Earring",
	body="Ixion Cloak", hands="Merman's Bangles", ring1="Jelly Ring", ring2="Merman's Ring",
	back="Umbra Cape", waist="Resolute Belt", legs="Mahatma Slops", feet="Herald's Gaiters"}

    sets.defense.MDT = {
    main="Terra's Staff", sub="Vivid Strap +1", ammo="White Tathlum",
	head="Goliard Chapeau", neck="Orochi Nodowa +1", ear1="Merman's Earring", ear2="Merman's Earring",
	body="Argute Gown +1", hands="Merman's Bangles", ring1="Merman's Ring", ring2="Merman's Ring",
	back="Hexerei Cape", waist="Resolute Belt", legs="Mahatma Slops", feet="Herald's Gaiters"}

    sets.Kiting = {
    feet="Herald's Gaiters"}


    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
	head="Walahra Turban", neck="Ancient Torque", ear2="Brutal Earring",
	ear1="Merman's Earring", body="Goliard Saio", ring2="Rajas Ring", ring1="Toreador's Ring",
	back="Umbra Cape",	waist="Headlong Belt", legs="Scholar's Pants"}




    sets.buff.FullSublimation = {
    head="Scholar's M.board", body="Argute Gown", neck="Orochi Nodowa +1", hands="Feronia's Bangles"}

    sets.buff.PDTSublimation = {
    head="Scholar's M.board", body="Argute Gown", neck="Orochi Nodowa +1", hands="Feronia's Bangles"}

    --sets.buff['Sandstorm'] = {feet="Desert Boots"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the general midcast() is done.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
        apply_grimoire_bonuses(spell, action, spellMap, eventArgs)
    end
end


-- Run after the general midcast() is done.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
        apply_grimoire_bonuses(spell, action, spellMap, eventArgs)
    end
 
        --Driller, 2015: equip obis for casts that match weather/day.
        if (spell.element == world.weather_element or spell.element==world.day_element) and ((spell.skill == 'Elemental Magic') or (spell.skill == 'Dark Magic') or (spell.skill == 'Healing Magic'))  then
                        equip(sets.Obi[spell.element])
							send_command('input /echo ITS OBI TIME!')
        end
        if spell.element=="Ice" then
                        equip(sets.Staves[spell.element])
                        --send_command('input /echo Equipping Aquilo Staff')
        end
       
end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if buff == "Sublimation: Activated" then
        handle_equipping_gear(player.status)
    end
end

-- Handle notifications of general user state change.


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if default_spell_map == 'Cure' or default_spell_map == 'Curaga' then
            if world.weather_element == 'Light' then
                return 'CureWithLightWeather'
            end
        elseif spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        elseif spell.skill == 'Elemental Magic' then
            if info.low_nukes:contains(spell.english) then
                return 'LowTierNuke'
            elseif info.mid_nukes:contains(spell.english) then
                return 'MidTierNuke'
            elseif info.high_nukes:contains(spell.english) then
                return 'HighTierNuke'
            end
        end
    end
end

function customize_idle_set(idleSet)
    if state.Buff['Sublimation: Activated'] then
        if state.IdleMode.value == 'Normal' then
            idleSet = set_combine(idleSet, sets.buff.FullSublimation)
        elseif state.IdleMode.value == 'PDT' then
            idleSet = set_combine(idleSet, sets.buff.PDTSublimation)
        end
    end

    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end

    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    if cmdParams[1] == 'user' and not (buffactive['light arts']      or buffactive['dark arts'] or
                       buffactive['addendum: white'] or buffactive['addendum: black']) then
        if state.IdleMode.value == 'Stun' then
            send_command('@input /ja "Dark Arts" <me>')
        else
            send_command('@input /ja "Light Arts" <me>')
        end
    end

    update_active_strategems()
    update_sublimation()
end

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for direct player commands.
function job_self_command(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'scholar' then
        handle_strategems(cmdParams)
        eventArgs.handled = true
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Reset the state vars tracking strategems.
function update_active_strategems()
    state.Buff['Ebullience'] = buffactive['Ebullience'] or false
    state.Buff['Rapture'] = buffactive['Rapture'] or false
    state.Buff['Perpetuance'] = buffactive['Perpetuance'] or false
    state.Buff['Immanence'] = buffactive['Immanence'] or false
    state.Buff['Penury'] = buffactive['Penury'] or false
    state.Buff['Parsimony'] = buffactive['Parsimony'] or false
    state.Buff['Celerity'] = buffactive['Celerity'] or false
    state.Buff['Alacrity'] = buffactive['Alacrity'] or false

    state.Buff['Klimaform'] = buffactive['Klimaform'] or false
end

function update_sublimation()
    state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
end

-- Equip sets appropriate to the active buffs, relative to the spell being cast.
function apply_grimoire_bonuses(spell, action, spellMap)
    if state.Buff.Perpetuance and spell.type =='WhiteMagic' and spell.skill == 'Enhancing Magic' then
        equip(sets.buff['Perpetuance'])
    end
    if state.Buff.Rapture and (spellMap == 'Cure' or spellMap == 'Curaga') then
        equip(sets.buff['Rapture'])
    end
    if spell.skill == 'Elemental Magic' and spellMap ~= 'ElementalEnfeeble' then
        if state.Buff.Ebullience and spell.english ~= 'Impact' then
            equip(sets.buff['Ebullience'])
        end
        if state.Buff.Immanence then
            equip(sets.buff['Immanence'])
        end
        if state.Buff.Klimaform and spell.element == world.weather_element then
            equip(sets.buff['Klimaform'])
        end
    end

    if state.Buff.Penury then equip(sets.buff['Penury']) end
    if state.Buff.Parsimony then equip(sets.buff['Parsimony']) end
    if state.Buff.Celerity then equip(sets.buff['Celerity']) end
    if state.Buff.Alacrity then equip(sets.buff['Alacrity']) end
end


-- General handling of strategems in an Arts-agnostic way.
-- Format: gs c scholar <strategem>
function handle_strategems(cmdParams)
    -- cmdParams[1] == 'scholar'
    -- cmdParams[2] == strategem to use

    if not cmdParams[2] then
        add_to_chat(123,'Error: No strategem command given.')
        return
    end
    local strategem = cmdParams[2]:lower()

    if strategem == 'light' then
        if buffactive['light arts'] then
            send_command('input /ja "Addendum: White" <me>')
        elseif buffactive['addendum: white'] then
            add_to_chat(122,'Error: Addendum: White is already active.')
        else
            send_command('input /ja "Light Arts" <me>')
        end
    elseif strategem == 'dark' then
        if buffactive['dark arts'] then
            send_command('input /ja "Addendum: Black" <me>')
        elseif buffactive['addendum: black'] then
            add_to_chat(122,'Error: Addendum: Black is already active.')
        else
            send_command('input /ja "Dark Arts" <me>')
        end
    elseif buffactive['light arts'] or buffactive['addendum: white'] then
        if strategem == 'cost' then
            send_command('input /ja Penury <me>')
        elseif strategem == 'speed' then
            send_command('input /ja Celerity <me>')
        elseif strategem == 'aoe' then
            send_command('input /ja Accession <me>')
        elseif strategem == 'power' then
            send_command('input /ja Rapture <me>')
        elseif strategem == 'duration' then
            send_command('input /ja Perpetuance <me>')
        elseif strategem == 'accuracy' then
            send_command('input /ja Altruism <me>')
        elseif strategem == 'enmity' then
            send_command('input /ja Tranquility <me>')
        elseif strategem == 'skillchain' then
            add_to_chat(122,'Error: Light Arts does not have a skillchain strategem.')
        elseif strategem == 'addendum' then
            send_command('input /ja "Addendum: White" <me>')
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    elseif buffactive['dark arts']  or buffactive['addendum: black'] then
        if strategem == 'cost' then
            send_command('input /ja Parsimony <me>')
        elseif strategem == 'speed' then
            send_command('input /ja Alacrity <me>')
        elseif strategem == 'aoe' then
            send_command('input /ja Manifestation <me>')
        elseif strategem == 'power' then
            send_command('input /ja Ebullience <me>')
        elseif strategem == 'duration' then
            add_to_chat(122,'Error: Dark Arts does not have a duration strategem.')
        elseif strategem == 'accuracy' then
            send_command('input /ja Focalization <me>')
        elseif strategem == 'enmity' then
            send_command('input /ja Equanimity <me>')
        elseif strategem == 'skillchain' then
            send_command('input /ja Immanence <me>')
        elseif strategem == 'addendum' then
            send_command('input /ja "Addendum: Black" <me>')
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    else
        add_to_chat(123,'No arts has been activated yet.')
    end
end


-- Gets the current number of available strategems based on the recast remaining
-- and the level of the sch.
function get_current_strategem_count()
    -- returns recast in seconds.
    local allRecasts = windower.ffxi.get_ability_recasts()
    local stratsRecast = allRecasts[231]

    local maxStrategems = (player.main_job_level + 10) / 20

    local fullRechargeTime = 4*60

    local currentCharges = math.floor(maxStrategems - maxStrategems * stratsRecast / fullRechargeTime)

    return currentCharges
end