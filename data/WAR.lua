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
  state.OffenseMode:options('GA', 'DualWield', 'Normal')
  state.RangedMode:options('Normal')
  state.HybridMode:options('Normal', 'Acc')
  state.WeaponskillMode:options('Normal')
  state.CastingMode:options('Normal')
  state.IdleMode:options('Normal', 'PDT', 'MDT')
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

function init_gear_sets()
  
  --------------------------------------
  -- Precast sets
  --------------------------------------


  sets.enmity = {
  head="Hydra Salade", neck="Harmonia's Torque", lear="Hades Earring +1", rear="Hades Earring +1",
  body="Hydra Haubert", hands="Hydra Moufles", lring="Mermaid's Ring", rring="Hercules' Ring",
  back="Cerb. Mantle +1", waist="Warwolf Belt", legs="Hydra Brayettes", feet="Hydra Sollerets" }

  -- Sets to apply to arbitrary JAs
  sets.precast.JA['Provoke']  = sets.enmity

  sets.precast.JA['Warcry']  = sets.enmity
  
  -- Sets to apply to any actions of spell.type
  sets.precast.Waltz = {
  ammo="Bibiki Seashell", head="Kaiser Schaller", body="Kaiser Cuirass", hands="Kaiser Handschuhs",
  waist="Warwolf Belt", feet="Kaiser Schuhs" }
    
  -- Sets for specific actions within spell.type
  sets.precast.Waltz['Healing Waltz'] = {}

    -- Sets for fast cast gear for spells
  sets.precast.FC = { rear="Loquacious Earring" }

    -- Fast cast gear for specific spells or spell maps

  -- Weaponskill sets
  sets.precast.WS = {
  ammo="Fire Bomblet", head="Hecatomb Cap +1", neck=gear.ElementalGorget, lear="Tmph. Earring +1", rear="Brutal Earring",
  body="Armada Hauberk", hands="Hct. Mittens +1", ring1="Triumph Ring +1", ring2="Rajas Ring",
  back="Cerb. Mantle +1", waist="Warrior's Stone", legs="War. Cuisses +1", feet="Hct. Leggings +1" }

  -- Specific weaponskill sets.
  sets.precast.WS['Raging Rush'] = set_combine( sets.precast.Crit_WS, { neck="Ancient Torque", body="Zahak's Mail" } )

  sets.precast.WS['Metatron Torment'] = set_combine( sets.precast.WS, { neck="Flame Gorget", hands="Alkyoneus's Brc." } )

  sets.precast.WS['Steel Cyclone'] = set_combine( sets.precast.WS, { hands="War. Mufflers +1" } )

  
  --------------------------------------
  -- Midcast sets
  --------------------------------------

  -- Generic spell recast set
  sets.midcast.FastRecast = {
  head="Walahra Turban", rear="Loquacious Earring", hands="Dusk Gloves +1", waist="Velocious Belt",
  legs="Byakko's Haidate", feet="Dusk Ledelsens +1", ring1="Blitz ring" }
    
  -- Specific spells

  
  --------------------------------------
  -- Idle/resting/defense/etc sets
  --------------------------------------
  
  -- Resting sets
  sets.resting = {
  ammo="Bibiki Seashell", head="Coral Visor +1", neck="Orochi Nodowa +1", lear="Merman's Earring",
  body="Conte Corazza", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", rear="Merman's Earring",
  waist="Resolute Belt", ring2="Merman's Ring", back="Lamia Mantle +1", legs="Coral Cuisses +1",
  feet="Hermes' Sandals +1" }
  

  -- Idle sets
  sets.idle = {
  ammo="Bibiki Seashell", head="Coral Visor +1", neck="Orochi Nodowa +1", lear="Merman's Earring",
  body="Conte Corazza", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", rear="Merman's Earring",
  waist="Resolute Belt", ring2="Merman's Ring", back="Lamia Mantle +1", legs="Coral Cuisses +1",
  feet="Hermes' Sandals +1" }

  sets.idle.Town = {
  ammo="Bibiki Seashell", head="Coral Visor +1", neck="Orochi Nodowa +1", lear="Merman's Earring",
  body="Conte Corazza", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", rear="Merman's Earring",
  waist="Resolute Belt", ring2="Merman's Ring", back="Lamia Mantle +1", legs="Coral Cuisses +1",
  feet="Hermes' Sandals +1" }
  
  sets.idle.Weak = {
  ammo="Bibiki Seashell", head="Coral Visor +1", neck="Orochi Nodowa +1", lear="Merman's Earring",
  body="Conte Corazza", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", rear="Merman's Earring",
  waist="Resolute Belt", ring2="Merman's Ring", back="Lamia Mantle +1", legs="Coral Cuisses +1",
  feet="Hermes' Sandals +1" }
  
  -- Defense sets
  sets.defense.PDT = {
  ammo="Bibiki Seashell", head="Darksteel Cap +1", neck="Orochi Nodowa +1", body="Dst. Harness +1",
  hands="Dst. Mittens +1", ring1="Jelly Ring", legs="Dst. Subligar +1", feet="Askar Gambieras" }

  sets.defense.MDT = {
  head="Coral Visor +1", neck="Jeweled Collar +1", body="Cor. Scale Mail +1", hands="Coral Fng. Gnt. +1",
  ring1="Merman's Ring", ring2="Merman's Ring", waist="Resolute Belt", lear="Merman's Earring",
  back="Lamia Mantle +1", waist="Resolute Belt", rear="Merman's Earring", legs="Coral Cuisses +1",
  feet="Askar Gambieras" }

    -- Gear to wear for kiting
  sets.Kiting = { feet="Hermes' Sandals +1" }

  --------------------------------------
  -- Engaged sets
  --------------------------------------

  -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
  -- sets if more refined versions aren't defined.
  -- If you create a set with both offense and defense modes, the offense mode should be first.
  -- EG: sets.engaged.Dagger.Accuracy.Evasion
  
  -- Normal melee group
  sets.engaged = {
  ammo="Fire Bomblet", head="Walahra Turban", neck="Ancient Torque", body="Armada Hauberk",
  hands="Dusk Gloves +1", waist="Velocious Belt", back="Cerb. Mantle +1",  legs="Byakko's Haidate",
  feet="Dusk Ledelsens +1", lear="Assault Earring", rear="Brutal Earring", ring1="Blitz ring", ring2="Rajas Ring" }

  sets.engaged.GA = {
  ammo="White Tathlum", head="Walahra Turban", neck="Ancient Torque", body="Aurum Cuirass",
  hands="Dusk Gloves +1", waist="Velocious Belt", back="Cerb. Mantle +1",  legs="Byakko's Haidate",
  feet="Dusk Ledelsens +1", lear="Assault Earring", rear="Brutal Earring", ring1="Blitz ring", ring2="Rajas Ring" }

  sets.engaged.DualWield = {
  ammo="Fire Bomblet", head="Walahra Turban", neck="Ancient Torque", body="Armada Hauberk",
  hands="Dusk Gloves +1", waist="Velocious Belt", back="Cerb. Mantle +1", rear="Brutal Earring",
  legs="Byakko's Haidate", feet="Dusk Ledelsens +1", lear="Suppanomimi", ring1="Blitz ring", ring2="Rajas Ring" }


  sets.engaged.Acc = {
  ammo="Fire Bomblet", head="Walahra Turban", neck="Ancient Torque", body="Armada Hauberk", hands="Dusk Gloves +1",
  waist="Velocious Belt", back="Cuchulain's Mantle",  legs="Byakko's Haidate", feet="Dusk Ledelsens +1",
  lear="Assault Earring", rear="Brutal Earring", ring1="Toreador's ring", ring2="Rajas Ring" }

  sets.engaged.GA.Acc = {
  ammo="Fire Bomblet", head="Walahra Turban", neck="Ancient Torque", body="Aurum Cuirass", hands="Dusk Gloves +1",
  waist="Velocious Belt", back="Cuchulain's Mantle",  legs="Byakko's Haidate", feet="Dusk Ledelsens +1",
  lear="Assault Earring", rear="Brutal Earring", ring1="Toreador's ring", ring2="Rajas Ring" }

  sets.engaged.DualWield.Acc = {
  ammo="Fire Bomblet", head="Walahra Turban", neck="Ancient Torque", body="Armada Hauberk", hands="Dusk Gloves +1",
  waist="Velocious Belt", back="Cuchulain's Mantle", rear="Brutal Earring", legs="Byakko's Haidate",
  feet="Dusk Ledelsens +1", lear="Suppanomimi", ring1="Toreador's ring", ring2="Rajas Ring" }

  --------------------------------------
  -- Custom buff sets
  --------------------------------------

end