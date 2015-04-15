-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
    Custom commands:

    gs c cycle treasuremode (set on ctrl-= by default): Cycles through the available treasure hunter modes.
    
    Treasure hunter modes:
        None - Will never equip TH gear
        Tag - Will equip TH gear sufficient for initial contact with a mob (either melee, ranged hit, or Aeolian Edge AOE)
        SATA - Will equip TH gear sufficient for initial contact with a mob, and when using SATA
        Fulltime - Will keep TH gear equipped fulltime

--]]

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Sneak Attack'] = buffactive['sneak attack'] or false
    state.Buff['Trick Attack'] = buffactive['trick attack'] or false
    state.Buff['Feint'] = buffactive['feint'] or false
    
    include('Mote-TreasureHunter')

    -- For th_action_check():
    -- JA IDs for actions that always have TH: Provoke, Animated Flourish
    info.default_ja_ids = S{35, 204}
    -- Unblinkable JA IDs for actions that always have TH: Quick/Box/Stutter Step, Desperate/Violent Flourish
    info.default_u_ja_ids = S{201, 202, 203, 205, 207}
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
    state.IdleMode:options('Normal')
    state.RestingMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT')
    state.MagicalDefenseMode:options('MDT')


    send_command('bind ^` input /ja "Sneak Attack" <me>')
    send_command('bind !` input /ja "Trick Attack" <me>')
    send_command('bind ^= gs c cycle treasuremode')
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !-')
end

-- Define sets and vars used by this job file.
function init_gear_sets()   
    --------------------------------------
    -- Precast sets
    --------------------------------------
    
    -- Sets to apply to arbitrary JAs
    sets.TreasureHunter = { hands="Asn. Armlets +1" }
    
    -- Sets to apply to any actions of spell.type
    sets.precast.Waltz = {}
        
    -- Sets for specific actions within spell.type
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Actions we want to use to tag TH.
    sets.precast.Step = sets.TreasureHunter
    sets.precast.Flourish1 = sets.TreasureHunter
    sets.precast.JA.Provoke = sets.TreasureHunter

    -- Sets for fast cast gear for spells
    sets.precast.FC = { lear="Loquacious Earring" }

    -- Fast cast gear for specific spells or spell maps
    sets.precast.FC.Utsusemi = sets.precast.FC

    -- Weaponskill sets
    sets.precast.WS = {
    head="Hecatomb Cap +1", neck=gear.ElementalGorget, lear="Pixie Earring", rear="Adroit Earring +1",
    body="Dragon Harness +1", hands="Hct. Mittens +1", ring1="Adroit Ring +1", ring2="Rajas Ring",
    back="Cerb. Mantle +1", waist="Cuchulain's Belt", legs="Hct. Subligar +1", feet="Hct. Leggings +1" }

    sets.precast.WS.SA = {
    head="Hecatomb Cap +1", neck=gear.ElementalGorget, lear="Pixie Earring", rear="Adroit Earring +1",
    body="Dragon Harness +1", hands="Hct. Mittens +1", ring1="Adroit Ring +1", ring2="Rajas Ring",
    back="Cerb. Mantle +1", waist="Cuchulain's Belt", legs="Hct. Subligar +1", feet="Hct. Leggings +1" }

    sets.precast.WS.TA = {
    head="Hecatomb Cap +1", neck=gear.ElementalGorget, lear="Pixie Earring", rear="Adroit Earring +1",
    body="Dragon Harness +1", hands="Hct. Mittens +1", ring1="Adroit Ring +1", ring2="Rajas Ring",
    back="Cerb. Mantle +1", waist="Cuchulain's Belt", legs="Hct. Subligar +1", feet="Hct. Leggings +1" }

    sets.precast.WS.SATA = {
    head="Hecatomb Cap +1", neck=gear.ElementalGorget, lear="Pixie Earring", rear="Adroit Earring +1",
    body="Dragon Harness +1", hands="Hct. Mittens +1", ring1="Adroit Ring +1", ring2="Rajas Ring",
    back="Cerb. Mantle +1", waist="Cuchulain's Belt", legs="Hct. Subligar +1", feet="Hct. Leggings +1" }
    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    -- Generic spell recast set
    sets.midcast.FastRecast = {
    head="Walahra Turban", neck="Tiercel Necklace", body="Rapparee Harness", lear="Loquacious Earring",
    hands="Dusk Gloves +1", waist="Velocious Belt", legs="Bravo's Subligar", feet="Homam Gambieras" }
        
    -- Specific spells
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets
    sets.idle = {
    head="Hecatomb Cap +1", neck="Orochi Nodowa +1", lear="Merman's Earring", rear="Merman's Earring", hands="Denali Wristbands",
    body="Homam Corazza", ring1="Merman's Ring", ring2="Merman's Ring", back="Lamia Mantle +1", waist="Resolute Belt", feet="Strider Boots" }

    sets.idle.Town = {
    head="Hecatomb Cap +1", neck="Orochi Nodowa +1", lear="Merman's Earring", rear="Merman's Earring", hands="Asn. Armlets +1",
    body="Homam Corazza", ring1="Merman's Ring", ring2="Merman's Ring", back="Lamia Mantle +1", waist="Resolute Belt", feet="Strider Boots" }
    
    sets.idle.Weak = {
    head="Hecatomb Cap +1", neck="Orochi Nodowa +1", lear="Merman's Earring", rear="Merman's Earring", hands="Denali Wristbands",
    body="Homam Corazza", ring1="Merman's Ring", ring2="Merman's Ring", back="Lamia Mantle +1", waist="Resolute Belt", feet="Strider Boots" }
    
    -- Defense sets
    sets.defense.PDT  = { 
    neck="Orochi Nodowa +1", hands="Denali Wristbands", waist="Scouter's Rope", legs="Dst. Subligar +1", neck="Evasion Torque",
    feet="Dst. Leggings +1", ring1="Jelly Ring", back="Corse Cape", lear="Triton Earring", rear="Triton Earring" }

    sets.defense.MDT = {
    lear="Merman's Earring", neck="Jeweled Collar +1", rear="Merman's Earring", ring1="Merman's Ring",
    ring2="Merman's Ring", waist="Resolute Belt", back="Lamia Mantle +1" }


    -- Gear to wear for kiting
    sets.Kiting = { feet="Strider Boots" }

    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
    head="Walahra Turban", neck="Tiercel Necklace", body="Rapparee Harness", lear="Suppanomimi", rear="Brutal Earring",
    hands="Dusk Gloves +1", ring1="Toreador's Ring", ring2="Rajas Ring", back="Cuchulain's Mantle",
    waist="Velocious Belt", legs="Bravo's Subligar", feet="Homam Gambieras" }

    sets.engaged.Acc = {
    head="Walahra Turban", neck="Ancient Torque", body="Rapparee Harness", lear="Suppanomimi", rear="Brutal Earring",
    hands="Homam Corazza", hands="Homam Manopolas", ring1="Toreador's Ring", ring2="Rajas Ring", back="Cuchulain's Mantle",
    waist="Velocious Belt", legs="Bravo's Subligar", feet="Homam Gambieras" }
    
    sets.engaged.Evasion = {
    head="Empress Hairpin", neck="Evasion Torque", lear="Triton Earring", rear="Triton Earring",
    body="Antares Harness", hands="Denali Wristbands", ring1="Toreador's Ring", ring2="Rajas Ring",
    back="Corse Cape", waist="Scouter's Rope", legs="Bravo's Subligar", feet="Dance Shoes +1" }
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the general precast() is done.
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.english == 'Aeolian Edge' and state.TreasureMode.value ~= 'None' then
        equip(sets.TreasureHunter)
    elseif spell.english=='Sneak Attack' or spell.english=='Trick Attack' or spell.type == 'WeaponSkill' then
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
    end
end

-- Run after the general midcast() set is constructed.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if state.TreasureMode.value ~= 'None' and spell.action_type == 'Ranged Attack' then
        equip(sets.TreasureHunter)
    end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    -- Weaponskills wipe SATA/Feint.  Turn those state vars off before default gearing is attempted.
    if spell.type == 'WeaponSkill' and not spell.interrupted then
        state.Buff['Sneak Attack'] = false
        state.Buff['Trick Attack'] = false
        state.Buff['Feint'] = false
    end
end

-- Called after the default aftercast handling is complete.
function job_post_aftercast(spell, action, spellMap, eventArgs)
    -- If Feint is active, put that gear set on on top of regular gear.
    -- This includes overlaying SATA gear.
    check_buff('Feint', eventArgs)
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function get_custom_wsmode(spell, spellMap, defaut_wsmode)
    local wsmode

    if state.Buff['Sneak Attack'] then
        wsmode = 'SA'
    end
    if state.Buff['Trick Attack'] then
        wsmode = (wsmode or '') .. 'TA'
    end

    return wsmode
end


-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)
    -- Check that ranged slot is locked, if necessary
    check_range_lock()

    -- Check for SATA when equipping gear.  If either is active, equip
    -- that gear specifically, and block equipping default gear.
    check_buff('Sneak Attack', eventArgs)
    check_buff('Trick Attack', eventArgs)
end


function customize_idle_set(idleSet)
    if player.hpp < 80 then
        idleSet = set_combine(idleSet, sets.ExtraRegen)
    end

    return idleSet
end


function customize_melee_set(meleeSet)
    if state.TreasureMode.value == 'Fulltime' then
        meleeSet = set_combine(meleeSet, sets.TreasureHunter)
    end

    return meleeSet
end


-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    th_update(cmdParams, eventArgs)
end

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    local msg = 'Melee'
    
    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end
    
    msg = msg .. ': '
    
    msg = msg .. state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        msg = msg .. '/' .. state.HybridMode.value
    end
    msg = msg .. ', WS: ' .. state.WeaponskillMode.value
    
    if state.DefenseMode.value ~= 'None' then
        msg = msg .. ', ' .. 'Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
    end
    
    if state.Kiting.value == true then
        msg = msg .. ', Kiting'
    end

    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ', Target PC: '..state.PCTargetMode.value
    end

    if state.SelectNPCTargets.value == true then
        msg = msg .. ', Target NPCs'
    end
    
    msg = msg .. ', TH: ' .. state.TreasureMode.value

    add_to_chat(122, msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- State buff checks that will equip buff gear and mark the event as handled.
function check_buff(buff_name, eventArgs)
    if state.Buff[buff_name] then
        equip(sets.buff[buff_name] or {})
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
        eventArgs.handled = true
    end
end


-- Check for various actions that we've specified in user code as being used with TH gear.
-- This will only ever be called if TreasureMode is not 'None'.
-- Category and Param are as specified in the action event packet.
function th_action_check(category, param)
    if category == 2 or -- any ranged attack
        --category == 4 or -- any magic action
        (category == 3 and param == 30) or -- Aeolian Edge
        (category == 6 and info.default_ja_ids:contains(param)) or -- Provoke, Animated Flourish
        (category == 14 and info.default_u_ja_ids:contains(param)) -- Quick/Box/Stutter Step, Desperate/Violent Flourish
        then return true
    end
end


-- Function to lock the ranged slot if we have a ranged weapon equipped.
function check_range_lock()
    if player.equipment.range ~= 'empty' then
        disable('range', 'ammo')
    else
        enable('range', 'ammo')
    end
end


