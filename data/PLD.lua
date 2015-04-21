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
    state.HybridMode:options('Normal', 'Dragon', 'Refresh', 'GS')
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
 
    sets.precast.JA = {
    head="Hydra Salade", neck="Harmonia's Torque", lear="Hades Earring +1", rear="Hades Earring +1",
    body="Hydra Haubert", hands="Hydra Moufles", lring="Mermaid's Ring", rring="Hercules' Ring",
    back="Cerb. Mantle +1", waist="Warwolf Belt", legs="Hydra Brayettes", feet="Hydra Sollerets" }

    -- Sets to apply to arbitrary JAs
    sets.precast.JA['Rampart'] = set_combine(sets.precast.JA, {
    head="Vlr. Coronet +1" })

    sets.precast.JA['Sentinel'] = set_combine(sets.precast.JA, {
    feet="Vlr. Leggings +1" })

    sets.precast.JA['Cover'] = set_combine(sets.precast.JA, { -- cover doesn't work; GG
    body="Valor Surcoat" })

    sets.precast.JA['Shield Bash'] = set_combine(sets.precast.JA, {
    hands="Vlr. Gauntlets +1", lear="Knightly Earring" })

   -- sets.precast.JA['Provoke']  = sets.enmity

   -- sets.precast.JA['Warcry']  = sets.enmity
      
    -- Sets to apply to any actions of spell.type
    sets.precast.Waltz = {
    ammo="Bibiki Seashell", head="Kaiser Schaller", body="Kaiser Cuirass",
    hands="Kaiser Handschuhs", waist="Warwolf Belt", feet="Kaiser Schuhs" }

    -- Sets for specific actions within spell.type
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Sets for fast cast gear for spells
    sets.precast.FC = {
    rear="Loquacious Earring", lear="Knightly Earring", legs="Homam Cosciales" }

    -- Fast cast gear for specific spells or spell maps
    

    -- Weaponskill sets
    sets.precast.WS = {
    head="Hecatomb Cap +1", neck=gear.ElementalGorget, lear="Suppanomimi", rear="Brutal Earring",
    body="Haubergeon +1", hands="Hct. Mittens +1", ring1="Triumph Ring +1", ring2="Rajas Ring",
    back="Cerb. Mantle +1", waist="Cuchulain's Belt", legs="Hct. Subligar +1", feet="Hct. Leggings +1" }

    -- Specific weaponskill sets.
    sets.precast.WS['Vorpal Blade'] = set_combine(sets.precast.WS, { body="Zahak's Mail" } )
      
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    -- Generic spell recast set
    sets.midcast.FastRecast = {
    head="Walahra Turban", body="Hydra Haubert", hands="Dusk Gloves +1",
    ring1="Blitz Ring", waist="Velocious Belt", legs="Homam Cosciales", feet="Homam Gambieras" }

    -- Specific spells
    sets.midcast.Stoneskin = { body="Blood Scale Mail" }

    sets.midcast.Cure = { rear="Hospitaler Earring" }
    
    sets.midcast['Flash'] = {
    head="Walahra Turban",  body="Hydra Haubert", hands="Homam Manopolas", lring="Blitz Ring", rring="Hercules' Ring",
    back="Cerb. Mantle +1", waist="Velocious Belt", legs="Homam Cosciales", feet="Homam Gambieras" }

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
      
    -- Resting sets
    sets.resting = {
    head="", neck="Parade Gorget", lear="Merman's Earring", rear="Merman's Earring",
    body="Royal Cloak", hands="Dst. Mittens +1", ring1="Merman's Ring", ring2="Merman's Ring",
    back="Lamia Mantle +1",waist="Resolute Belt", legs="Blood Cuisses", feet="Askar Gambieras" }
      

    -- Idle sets
    sets.idle = {
    head="", neck="Parade Gorget", lear="Merman's Earring", rear="Merman's Earring",
    body="Royal Cloak", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", ring2="Merman's Ring",
    back="Lamia Mantle +1", waist="Resolute Belt", legs="Blood Cuisses", feet="Askar Gambieras" }

    sets.idle.Town = {
    head="", neck="Parade Gorget", lear="Merman's Earring", rear="Merman's Earring",
    body="Royal Cloak", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", ring2="Merman's Ring",
    back="Lamia Mantle +1", waist="Resolute Belt", legs="Blood Cuisses", feet="Askar Gambieras" }
      
    sets.idle.Weak = {
    head="", neck="Parade Gorget", lear="Merman's Earring", rear="Merman's Earring",
    body="Royal Cloak", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", ring2="Merman's Ring",
    back="Lamia Mantle +1", waist="Resolute Belt", legs="Blood Cuisses", feet="Askar Gambieras" }
      
    -- Defense sets
    sets.defense.PDT = {
    head="Kaiser Schaller", neck="Orochi Nodowa +1", body="Dst. Harness +1",
    hands="Dst. Mittens +1", ring1="Jelly Ring", legs="Dst. Subligar +1", feet="Askar Gambieras" }

    sets.defense.MDT = {
    head="Coral Visor +1",neck="Jeweled Collar +1", lear="Merman's Earring", rear="Merman's Earring",
    body="Cor. Scale Mail +1", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", ring2="Merman's Ring",
    back="Lamia Mantle +1", waist="Resolute Belt", legs="Coral Cuisses +1", feet="Askar Gambieras" }

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
    head="Walahra Turban", neck="Ancient Torque", lear="Suppanomimi", rear="Brutal Earring",
    body="Hydra Haubert", hands="Dusk Gloves +1", ring1="Toreador's Ring", ring2="Rajas Ring",
    back="Cuchulain's Mantle", waist="Velocious Belt", legs="Homam Cosciales", feet="Homam Gambieras" }

    sets.engaged.Acc = {
    head="Walahra Turban", neck="Ancient Torque", lear="Suppanomimi", rear="Brutal Earring",
    body="Hydra Haubert", hands="Homam Manopolas", ring1="Toreador's Ring", ring2="Rajas Ring",
    back="Cuchulain's Mantle", waist="Velocious Belt", legs="Homam Cosciales", feet="Homam Gambieras" }

      
    -- Breath- melee group
    sets.engaged.Dragon = {
    head="Walahra Turban", neck="Ancient Torque", lear="Suppanomimi", rear="Brutal Earring",
    body="Blood Scale Mail", hands="Dusk Gloves +1", ring1="Blitz Ring", ring2="Rajas Ring",
    back="Cuchulain's Mantle", waist="Velocious Belt", legs="Homam Cosciales", feet="Homam Gambieras" }

    sets.engaged.Acc.Dragon = {
    head="Walahra Turban", neck="Ancient Torque", lear="Suppanomimi", rear="Brutal Earring",
    body="Blood Scale Mail", hands="Homam Manopolas", ring1="Toreador's Ring", ring2="Rajas Ring",
    back="Cuchulain's Mantle", waist="Velocious Belt", legs="Homam Cosciales", feet="Homam Gambieras" }
      
    -- Refresh melee group
    sets.engaged.Refresh = {
    head="", neck="Parade Gorget", lear="Suppanomimi", rear="Brutal Earring",
    body="Royal Cloak", hands="Dusk Gloves +1", ring1="Toreador's Ring", ring2="Rajas Ring",
    back="Cuchulain's Mantle", waist="Velocious Belt", legs="Homam Cosciales", feet="Homam Gambieras" }

    sets.engaged.Acc.Refresh = {
    head="", neck="Parade Gorget", lear="Suppanomimi", rear="Brutal Earring",
    body="Royal Cloak", hands="Homam Manopolas", ring1="Toreador's Ring", ring2="Rajas Ring",
    back="Cuchulain's Mantle", waist="Velocious Belt", legs="Homam Cosciales", feet="Homam Gambieras" }
      
    -- GA melee group
    sets.engaged.GS = {
    head="Walahra Turban", neck="Ancient Torque", lear="Assault Earring", rear="Brutal Earring",
    body="Homam Corazza", hands="Dusk Gloves +1", ring1="Toreador's Ring", ring2="Rajas Ring",
    back="Cerb. Mantle +1", waist="Velocious Belt", legs="Homam Cosciales", feet="Homam Gambieras" }

    sets.engaged.Acc.GS = {
    head="Walahra Turban", neck="Ancient Torque", lear="Assault Earring", rear="Brutal Earring",
    body="Homam Corazza", hands="Homam Manopolas", ring1="Toreador's Ring", ring2="Rajas Ring",
    back="Cuchulain's Mantle", waist="Velocious Belt", legs="Homam Cosciales", feet="Homam Gambieras" }
end
