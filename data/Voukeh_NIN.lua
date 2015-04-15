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
    state.Buff.Migawari = buffactive.migawari or false
    state.Buff.Doom = buffactive.doom or false
    state.Buff.Yonin = buffactive.Yonin or false
    state.Buff.Innin = buffactive.Innin or false
    state.Buff.Futae = buffactive.Futae or false

    determine_haste_group()
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'Evasion', 'DPS')
    state.WeaponskillMode:options('Normal', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.PhysicalDefenseMode:options('PDT', 'Evasion')

    gear.MovementFeet = { name="Dst. Leggings +1" }
    gear.DayFeet = "Dst. Leggings +1"
    gear.NightFeet = "Ninja Kyahan"
    
    gear.HasteHands = { name="Dusk Gloves +1" }
    gear.DayHands = "Dusk Gloves +1"
    gear.NightHands = "Kog. Tekko +1"
    
    gear.WeaponskillFeet = { name="Enkidu's Leggings" }
    gear.DayFeetWS = "Enkidu's Leggings"
    gear.NightFeetWS = "Kog. Kyahan +1"
    
    gear.WeaponskillHands = { name="Enkidu's Mittens" }
    gear.DayHandsWS = "Enkidu's Mittens"
    gear.NightHandsWS = "Kog. Tekko +1"
    
    -- Additional local binds
    send_command('bind ^` input /ja "Yonin" <me>')
    send_command('bind !` input /ja "Innin" <me>')
    
    select_movement_feet()
    select_haste_hands()
    select_weaponskill_feet()
    select_weaponskill_hands()
    windower.register_event('time change', time_change)
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {head="Genbu's Kabuto", waist="Warwolf Belt", ammo="Bibiki Seashell" }
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Set for acc on steps, since Yonin drops acc a fair bit
    sets.precast.Step = {
    neck="Ancient Torque", body="Antares Harness", waist="Cuchulain's Belt", legs="Byakko's Haidate",
    back="Cuchulain's Mantle", lring="Toreador's Ring", rring="Rajas Ring" }
    
    sets.precast.JA['Provoke'] = {
    head="Arh. Jinpachi +1", neck="Harmonia's Torque", left_ear="Hades Earring +1", right_ear="Hades Earring +1",
    body="Yasha Samue +1", hands="Yasha Tekko +1", left_ring="Mermaid Ring",
    back="Cerb. Mantle +1", waist="Warwolf Belt", legs="Yasha Hakama +1", feet="Ysh. Sune-Ate +1" }

    sets.precast.Flourish1 = sets.precast.JA['Provoke']
    
    -- Fast cast sets for spells
    
    sets.precast.FC = { lear="Loquacious Earring" }

    -- Snapshot for ranged
    sets.precast.RA = {}
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = { --  Ninja Tekko +1  
    ammo="Fire Bomblet", head="Shr.Znr.Kabuto +1", neck=gear.ElementalGorget, body="Haubergeon +1", lear="Pixie Earring",
    rear="Brutal Earring", hands=gear.WeaponskillHands, back="Cerb. Mantle +1", lring="Adroit Ring +1", rring="Rajas Ring",
    waist="Cuchulain's Belt", legs="Byakko's Haidate", feet=gear.WeaponskillFeet }
    
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {
    back="Cuchulain's Mantle", waist="Cuchulain's Belt", lring="Toreador's Ring" } )

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Blade: Jin'] = set_combine( sets.precast.WS, {
    lring="Triumph Ring +1", feet="Denali Gamashes" } )
    
    sets.precast.WS['Blade: Metsu'] = set_combine( sets.precast.WS, {
    head="Voyager Sallet", hands="Enkidu's Mittens", back="Cuchulain's Mantle" } )


    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
    head="Walahra Turban", neck="Tiercel Necklace", lear="Loquacious Earring", body="Yasha Samue +1",
    hands=gear.HasteHands, waist="Velocious Belt", legs="Byakko's Haidate", feet="Dusk Ledelsens +1" }
        
    sets.midcast.Utsusemi = sets.midcast.FastRecast
    
    sets.midcast.ElementalNinjutsu = set_combine( sets.midcast.FastRecast, {
    head="Ninja Hatsuburi", neck="Ninjutsu Torque", lear="Ninjutsu Earring", rear="Moldavite Earring",
    waist="Koga Sarashi", feet="Kog. Kyahan +1" } )

    sets.midcast.ElementalNinjutsu.Resistant = set_combine( sets.midcast.ElementalNinjutsu, { } )

    sets.midcast.NinjutsuDebuff = set_combine ( sets.midcast.FastRecast, {
    head="Ninja Hatsuburi", neck="Ninjutsu Torque", rear="Ninjutsu Earring",
    waist="Koga Sarashi", feet="Kog. Kyahan +1" } )

    sets.midcast.NinjutsuBuff = {}

    sets.midcast.RA = { hands="Ninja Tekko +1" }
    --------------------------------------
    -- Idle/resting/defense/etc. sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {
    ammo="Bibiki Seashell", head="Arh. Jinpachi +1", neck="Orochi Nodowa +1", lear="Merman's Earring",rear="Merman's Earring",
    body="War Shinobi Gi +1", hands="Denali Wristbands", lring="Merman's Ring", rring="Merman's Ring",
    back="Lamia Mantle +1", waist="Resolute Belt", legs="Dst. Subligar +1", feet=gear.MovementFeet }
    
    -- Idle sets
    sets.idle = {
    ammo="Bibiki Seashell", head="Arh. Jinpachi +1", neck="Orochi Nodowa +1", lear="Merman's Earring",rear="Merman's Earring",
    body="War Shinobi Gi +1", hands="Denali Wristbands", lring="Merman's Ring", rring="Merman's Ring",
    back="Lamia Mantle +1", waist="Resolute Belt", legs="Dst. Subligar +1", feet=gear.MovementFeet }

    sets.idle.Town = {
    ammo="Bibiki Seashell", head="Arh. Jinpachi +1", neck="Orochi Nodowa +1", lear="Merman's Earring",rear="Merman's Earring",
    body="Kingdom Aketon", hands="Denali Wristbands", lring="Merman's Ring", rring="Merman's Ring",
    back="Lamia Mantle +1", waist="Resolute Belt", legs="Dst. Subligar +1", feet=gear.MovementFeet }
        
    sets.idle.Weak = {
    ammo="Bibiki Seashell", head="Arh. Jinpachi +1", neck="Orochi Nodowa +1", lear="Merman's Earring",rear="Merman's Earring",
    body="War Shinobi Gi +1", hands="Denali Wristbands", lring="Merman's Ring", rring="Merman's Ring",
    back="Lamia Mantle +1", waist="Resolute Belt", legs="Dst. Subligar +1", feet=gear.MovementFeet }
    
    -- Defense sets
    sets.defense.Evasion = {}

    sets.defense.PDT  = { 
    ammo="Bibiki Seashell", head="Arh. Jinpachi +1", neck="Evasion Torque", lear="Triton Earring", rear="Triton Earring",
    body="Arhat's Gi +1", hands="Denali Wristbands", lring="Jelly Ring",
    back="Corse Cape", waist="Scouter's Rope", legs="Dst. Subligar +1", feet="Dst. Leggings +1", }

    sets.defense.MDT = {
    neck="Jeweled Collar +1", lear="Merman's Earring", rear="Merman's Earring", hands="Denali Wristbands", 
    lring="Merman's Ring", rring="Merman's Ring", back="Lamia Mantle +1", waist="Resolute Belt" }


    sets.Kiting = { feet=gear.MovementFeet }


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    --------------------------------------
    ---- Normal melee group
    --------------------------------------
    sets.engaged = {
    ammo="White Tathlum", head="Walahra Turban", neck="Tiercel Necklace", body="Ninja Chainmail", lear="Suppanomimi",
    rear="Brutal Earring", hands=gear.HasteHands, lring="Toreador's Ring", rring="Rajas Ring", back="Cerb. Mantle +1",
    waist="Velocious Belt", legs="Byakko's Haidate", feet="Dusk Ledelsens +1" }
    
    sets.engaged.Acc = {
    ammo="Fire Bomblet", head="Walahra Turban", neck="Ancient Torque", body="Ninja Chainmail", lear="Suppanomimi",
    rear="Brutal Earring", hands=gear.HasteHands, lring="Toreador's Ring", rring="Rajas Ring", back="Cuchulain's Mantle",
    waist="Velocious Belt", legs="Byakko's Haidate", feet="Dusk Ledelsens +1" }
    
    sets.engaged.Evasion = {
    ammo="White Tathlum", head="Empress Hairpin", neck="Evasion Torque", body="Antares Harness", lear="Triton Earring",
    rear="Triton Earring", hands="Rasetsu Tekko +1", lring="Toreador's Ring", rring="Rajas Ring", back="Corse Cape",
    waist="Koga Sarashi", legs="Kog. Hakama +1", feet="Dance Shoes +1" }
    
    sets.engaged.Acc.Evasion = {
    ammo="Fire Bomblet", head="Walahra Turban", neck="Ancient Torque", body="Antares Harness", lear="Triton Earring",
    rear="Triton Earring", hands=gear.HasteHands, lring="Toreador's Ring", rring="Rajas Ring", back="Cuchulain's Mantle",
    waist="Koga Sarashi", legs="Kog. Hakama +1", feet="Dance Shoes +1" }
    
    sets.engaged.DPS = {
    ammo="White Tathlum", head="Walahra Turban", neck="Tiercel Necklace", body="Haubergeon +1", lear="Suppanomimi",
    rear="Brutal Earring", hands=gear.HasteHands, lring="Toreador's Ring", rring="Rajas Ring", back="Cerb. Mantle +1",
    waist="Velocious Belt", legs="Byakko's Haidate", feet="Dusk Ledelsens +1" }
    
    sets.engaged.Acc.DPS = {
    ammo="Fire Bomblet", head="Walahra Turban", neck="Ancient Torque", body="Haubergeon +1", lear="Suppanomimi",
    rear="Brutal Earring", hands=gear.HasteHands, lring="Toreador's Ring", rring="Rajas Ring", back="Cuchulain's Mantle",
    waist="Velocious Belt", legs="Byakko's Haidate", feet="Dusk Ledelsens +1" }

    
    --------------------------------------
    -- Custom melee group: High Haste (~20% DW)
    --------------------------------------
    
    sets.engaged.HighHaste = {
    ammo="White Tathlum", head="Walahra Turban", neck="Tiercel Necklace", body="Ninja Chainmail", lear="Suppanomimi",
    rear="Brutal Earring", hands=gear.HasteHands, lring="Toreador's Ring", rring="Rajas Ring", back="Cerb. Mantle +1",
    waist="Velocious Belt", legs="Byakko's Haidate", feet="Dusk Ledelsens +1" }

    sets.engaged.Acc.HighHaste = {
    ammo="Fire Bomblet", head="Walahra Turban", neck="Ancient Torque", body="Ninja Chainmail", lear="Suppanomimi",
    rear="Brutal Earring", hands=gear.HasteHands, lring="Toreador's Ring", rring="Rajas Ring", back="Cuchulain's Mantle",
    waist="Velocious Belt", legs="Byakko's Haidate", feet="Dusk Ledelsens +1" }
    
    sets.engaged.Evasion.HighHaste = {
    ammo="White Tathlum", head="Empress Hairpin", neck="Evasion Torque", body="Antares Harness", lear="Triton Earring",
    rear="Triton Earring", hands="Rasetsu Tekko +1", lring="Toreador's Ring", rring="Rajas Ring", back="Corse Cape",
    waist="Koga Sarashi", legs="Kog. Hakama +1", feet="Dance Shoes +1" }
    
    sets.engaged.Acc.Evasion.HighHaste = {
    ammo="Fire Bomblet", head="Walahra Turban", neck="Ancient Torque", body="Antares Harness", lear="Triton Earring",
    rear="Triton Earring", hands=gear.HasteHands, lring="Toreador's Ring", rring="Rajas Ring", back="Cuchulain's Mantle",
    waist="Koga Sarashi", legs="Kog. Hakama +1", feet="Dance Shoes +1" }
    
    sets.engaged.DPS.HighHaste = {
    ammo="White Tathlum", head="Walahra Turban", neck="Ancient Torque", body="Ninja Chainmail", lear="Triton Earring",
    rear="Triton Earring", hands=gear.HasteHands, lring="Toreador's Ring", rring="Rajas Ring", back="Cerb. Mantle +1",
    waist="Velocious Belt", legs="Byakko's Haidate", feet="Dusk Ledelsens +1" }
    
    sets.engaged.Acc.DPS.HighHaste = {
    ammo="Fire Bomblet", head="Walahra Turban", neck="Ancient Torque", body="Antares Harness", lear="Suppanomimi",
    rear="Brutal Earring", hands=gear.HasteHands, lring="Toreador's Ring", rring="Rajas Ring", back="Cuchulain's Mantle",
    waist="Velocious Belt", legs="Byakko's Haidate", feet="Dusk Ledelsens +1" }

    --------------------------------------
    ---- Custom melee group: Max Haste (0% DW)
    --------------------------------------
    sets.engaged.MaxHaste = {
    ammo="White Tathlum", head="Walahra Turban", neck="Tiercel Necklace", body="Haubergeon +1", lear="Brutal Earring",
    rear="Brutal Earring", hands=gear.HasteHands, lring="Toreador's Ring", rring="Rajas Ring", back="Cerb. Mantle +1",
    waist="Velocious Belt", legs="Byakko's Haidate", feet="Dusk Ledelsens +1" }

    sets.engaged.Acc.MaxHaste = {
    ammo="Fire Bomblet", head="Walahra Turban", neck="Ancient Torque", body="Haubergeon +1", lear="Suppanomimi",
    rear="Brutal Earring", hands=gear.HasteHands, lring="Toreador's Ring", rring="Rajas Ring", back="Cuchulain's Mantle",
    waist="Velocious Belt", legs="Byakko's Haidate", feet="Dusk Ledelsens +1" }

    sets.engaged.Evasion.MaxHaste = {
    ammo="White Tathlum", head="Empress Hairpin", neck="Evasion Torque", body="Antares Harness", lear="Triton Earring",
    rear="Triton Earring", hands="Rasetsu Tekko +1", lring="Toreador's Ring", rring="Rajas Ring", back="Corse Cape",
    waist="Koga Sarashi", legs="Kog. Hakama +1", feet="Dance Shoes +1" }

    sets.engaged.Acc.Evasion.MaxHaste = {
    ammo="Fire Bomblet", head="Empress Hairpin", neck="Ancient Torque", body="Antares Harness", lear="Triton Earring",
    rear="Triton Earring", hands="Rasetsu Tekko +1", lring="Toreador's Ring", rring="Rajas Ring", back="Corse Cape",
    waist="Koga Sarashi", legs="Kog. Hakama +1", feet="Dance Shoes +1" }

    sets.engaged.DPS.MaxHaste = {
    ammo="White Tathlum", head="Walahra Turban", neck="Ancient Torque", body="Haubergeon +1", lear="Triton Earring",
    rear="Triton Earring", hands=gear.HasteHands, lring="Toreador's Ring", rring="Rajas Ring", back="Cerb. Mantle +1",
    waist="Velocious Belt", legs="Byakko's Haidate", feet="Dusk Ledelsens +1" }
    
    sets.engaged.Acc.DPS.MaxHaste = {
    ammo="Fire Bomblet", head="Walahra Turban", neck="Tiercel Necklace", body="Ninja Chainmail", lear="Suppanomimi",
    rear="Brutal Earring", hands=gear.HasteHands, lring="Toreador's Ring", rring="Rajas Ring", back="Cerb. Mantle +1",
    waist="Velocious Belt", legs="Byakko's Haidate", feet="Dusk Ledelsens +1" }
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the general midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if state.Buff.Doom then
        equip(sets.buff.Doom)
    end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted and spell.english == "Migawari: Ichi" then
        state.Buff.Migawari = true
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    -- If we gain or lose any haste buffs, adjust which gear set we target.
    if S{'haste','march','embrava','haste samba'}:contains(buff:lower()) then
        determine_haste_group()
        handle_equipping_gear(player.status)
    elseif state.Buff[buff] ~= nil then
        handle_equipping_gear(player.status)
    end
end

function job_status_change(new_status, old_status)
    if new_status == 'Idle' then
        select_movement_feet()
    end
    if new_status == 'Engaged' then        
        select_haste_hands()
        select_weaponskill_feet()
        determine_haste_group()
        select_weaponskill_hands()
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Get custom spell maps
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == "Ninjutsu" then
        if not default_spell_map then
            if spell.target.type == 'SELF' then
                return 'NinjutsuBuff'
            else
                return 'NinjutsuDebuff'
            end
        end
    end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if state.Buff.Migawari then
        idleSet = set_combine(idleSet, sets.buff.Migawari)
    end
    if state.Buff.Doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
    end
    return idleSet
end


-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if state.Buff.Migawari then
        meleeSet = set_combine(meleeSet, sets.buff.Migawari)
    end
    if state.Buff.Doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
    end
    return meleeSet
end

-- Called by the default 'update' self-command.
function job_update(cmdParams, eventArgs)
    select_movement_feet()
    select_haste_hands()
    select_weaponskill_feet()
    determine_haste_group()
    select_weaponskill_hands()
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function determine_haste_group()
    -- We have three groups of DW in gear: Hachiya body/legs, Iga head + Patentia Sash, and DW earrings
    
    -- Standard gear set reaches near capped delay with just Haste (77%-78%, depending on HQs)

    -- For high haste, we want to be able to drop one of the 10% groups.
    -- Basic gear hits capped delay (roughly) with:
    -- 1 March + Haste
    -- 2 March
    -- Haste + Haste Samba
    -- 1 March + Haste Samba
    -- Embrava
    
    -- High haste buffs:
    -- 2x Marches + Haste Samba == 19% DW in gear
    -- 1x March + Haste + Haste Samba == 22% DW in gear
    -- Embrava + Haste or 1x March == 7% DW in gear
    
    -- For max haste (capped magic haste + 25% gear haste), we can drop all DW gear.
    -- Max haste buffs:
    -- Embrava + Haste+March or 2x March
    -- 2x Marches + Haste
    
    -- So we want four tiers:
    -- Normal DW
    -- 20% DW -- High Haste
    -- 7% DW (earrings) - Embrava Haste (specialized situation with embrava and haste, but no marches)
    -- 0 DW - Max Haste
    
    classes.CustomMeleeGroups:clear()
    
    if buffactive.embrava and (buffactive.march == 2 or (buffactive.march and buffactive.haste)) then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive.march == 2 and buffactive.haste then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive.embrava and (buffactive.haste or buffactive.march) then
        classes.CustomMeleeGroups:append('EmbravaHaste')
    elseif buffactive.march == 1 and buffactive.haste and buffactive['haste samba'] then
        classes.CustomMeleeGroups:append('HighHaste')
    elseif buffactive.march == 2 then
        classes.CustomMeleeGroups:append('HighHaste')
    end
end

function select_movement_feet()
    -- world.time is given in minutes into each day
    -- 7:00 AM would be 420 minutes
    -- 17:00 PM would be 1020 minutes
    if world.time >= (17*60) or world.time < (7*60) then
        gear.MovementFeet.name = gear.NightFeet
    else
        gear.MovementFeet.name = gear.DayFeet
    end
end

function select_haste_hands()
    if world.time >= (17*60) or world.time < (7*60) then
        gear.HasteHands.name = gear.NightHands
    else
        gear.HasteHands.name = gear.DayHands
    end
end


function select_weaponskill_feet()
    if world.time >= (17*60) or world.time < (7*60) then
        gear.WeaponskillFeet.name = gear.NightFeetWS
    else
        gear.WeaponskillFeet.name = gear.DayFeetWS
    end
end


function select_weaponskill_hands()
    if world.time >= (17*60) or world.time < (7*60) then
        gear.WeaponskillHands.name = gear.NightHandsWS
    else
        gear.WeaponskillHands.name = gear.DayHandsWS
    end
end