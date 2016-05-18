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
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

    brd_daggers = S{'Izhiikoh', 'Vanir Knife', 'Atoyac', 'Aphotic Kukri', 'Sabebus'}
  --  pick_tp_weapon()
    
    -- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'
    -- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 2
    
    -- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(false, 'Use Custom Timers')
    
    -- Additional local binds
    send_command('bind ^` input /ja "Pianissimo <me>')
    send_command('bind !` input //gs equip sets.HPFUCK')


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
    
    -- Sets to apply to arbitrary JAs

    -- Sets to apply to any actions of spell.type
    sets.precast.Waltz = {}
        
    -- Sets for specific actions within spell.type
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Sets for fast cast gear for spells
    sets.precast.FC = { rear="Loquacious Earring",body="Sheikh Manteel", hands="Dusk Gloves +1", legs="Byakko's Haidate", feet="Dusk Ledelsens +1" }

    sets.precast.FC.BardSong = { sub="Vivid Strap +1", head="Walahra Turban", lear="Wind Earring", 
    body="Sheikh Manteel", hands="Sheikh Gages", rear="Loquacious Earring", ring1="Merman's Ring", legs="Byakko's Haidate",
    ring2="Minstrel's Ring", feet="Dusk Ledelsens +1" }

    -- Fast cast gear for specific spells or spell maps
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, { } )

    sets.midcast.Ballad = { ranged="Angel Lyre", head="Walahra Turban", body="Sheikh Manteel", hands="Dusk Gloves +1",
    waist="Sonic Belt +1", feet="Dusk Ledelsens +1", legs="Byakko's Haidate" }

    sets.midcast.Lullaby = {
    main="Chatoyant Staff", sub="Light Grip", ranged="Mary's Horn", neck="Piper's Torque", lear="Wind Earring" }

    sets.midcast.Madrigal = {
    main="Chanter's Staff", ranged="Traversiere +2", neck="Piper's Torque", lear="Wind Earring", ring1="Nereid Ring",
    legs="Choral Cannions" }

    sets.midcast.March = {
    main="Chanter's Staff", head="Bard's Roundlet", ranged="Iron Ram Horn", neck="Piper's Torque", body="Minstrel's Coat",
    lear="Wind Earring", ring1="Nereid Ring", legs="Choral Cannions" }

    sets.midcast.Minuet = {
    main="Chanter's Staff", ranged="Cornette +2", neck="Piper's Torque", lear="Wind Earring", ring1="Nereid Ring",
    legs="Choral Cannions" }

    sets.midcast.Mambo = {
    ranged="Hellish Bugle" }

    sets.midcast.Minne = { }

    sets.midcast.Paeon = {
    main="Chanter's Staff", ranged="Ebony Harp +2", neck="String Torque", lear="String Earring" }

    sets.midcast.Carol = {
    main="Chanter's Staff", ranged="Crumhorn +2", neck="Piper's Torque", lear="Wind Earring", ring1="Nereid Ring",
    legs="Choral Cannions" }

    sets.midcast.Requiem = {
    main="Chatoyant Staff", sub="Light Grip", ranged="Requiem Flute", neck="Piper's Torque", lear="Wind Earring" }

    sets.midcast.Elegy = {
    main="Chatoyant Staff", sub="Earth Grip", ranged="Horn +1", neck="Piper's Torque", lear="Wind Earring" }

    sets.midcast["Sentinel's Scherzo"] = {}

    sets.midcast['Magic Finale'] = {
    main="Chatoyant Staff", sub="Light Grip", ranged="Military Harp", neck="String Torque", lear="String Earring" }

    sets.midcast['Raptor Mazurka'] = {
    ranged="Harlequin's Horn" }


    -- Weaponskill sets
    sets.precast.WS = {
    head="Walkure Mask",
    body="Bard's Jstcorps",
    hands="Hct. Mittens +1",
    legs="Byakko's Haidate",
    feet="Hct. Leggings +1",
    neck="Ancient Torque",
    waist="Cuchulain's Belt",
    left_ear="Merman's Earring",
    right_ear="Merman's Earring",
    left_ring="Triumph Ring +1",
    right_ring="Triumph Ring +1",
    back="Cuchulain's Mantle",
}
    
    -- Specific weaponskill sets.

    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    -- Generic spell recast set
    sets.midcast.FastRecast = { ranged="Angel Lyre", head="Walahra Turban", body="Sheikh Manteel", hands="Dusk Gloves +1",
    waist="Sonic Belt +1", feet="Dusk Ledelsens +1", legs="Byakko's Haidate" }
        
    -- Specific spells
    sets.midcast.Utsusemi = {}

    -- For song buffs (duration and AF3 set bonus)
    sets.midcast.SongEffect = {
    head="Bard's Roundlet", rear="Singing Earring", body="Minstrel's Coat", waist="Sonic Belt +1",
    hands="Choral Cuffs", back="Umbra Cape" }

    -- For song defbuffs (duration primary, accuracy secondary)
    sets.midcast.SongDebuff = {
    head="Bard's Roundlet", lear="Incubus Earring +1", rear="Incubus Earring +1",
    body="Mahatma Hpl.", hands="Choral Cuffs", lring="Heaven's Ring +1", rring="Heaven's Ring +1",
    back="Birdman Cape", waist="Gleeman's Belt", legs="Sheikh Seraweels", feet="Sheikh Crackows" }

    -- For song defbuffs (accuracy primary, duration secondary)
    sets.midcast.ResistantSongDebuff = {
    lear="Incubus Earring +1", rear="Incubus Earring +1", body="Ixion Cloak", hands="Sheikh Gages",
    back="Birdman Cape", waist="Gleeman's Belt", legs="Sheikh Seraweels", feet="Sheikh Crackows" }

    -- Song-specific recast reduction
    sets.midcast.SongRecast = {
    head="Walahra Turban", rear="Loquacious Earring", body="Sheikh Manteel", hands="Sheikh Gages", waist="Sonic Belt +1",
    legs="Byakko's Haidate", feet="Dusk Ledelsens +1" }


    -- Other general spells and classes.
    sets.midcast.Cure = {
    main="Chatoyant Staff", ear1="Roundel Earring" }
        
    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Stoneskin = {
    main="Chatoyant Staff", sub="Light Grip", range="Iron Ram Horn", head="Zenith Crown +1", body="Mahatma Hpl.", hands="Dvt. Mitts +1",
    legs="Mahatma Slops", feet="Suzaku's Sune-ate", neck="Promise Badge", waist="Pythia Sash +1", left_ear="Celestial Earring", right_ear="Celestial Earring",
    left_ring="Celestial Ring", right_ring="Celestial Ring", back="Ixion Cape"  }
        
    sets.midcast.Cursna = { }

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {
    main="Chatoyant Staff", head="Mirror Tiara", neck="Beak Necklace +1", lear="Rapture Earring", rear="Antivenom Earring",
    body="Mahatma Hpl.", hands="", ring1="Celestial Ring", ring2="Celestial Ring", back="Invigorating Cape",
    waist="Qiqirn Sash +1", legs="Baron's Slops", feet="Arborist Nails" }
    
    
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = { ammo="Hedgehog Bomb",
    main=gear.Staff.PDT, neck="Orochi Nodowa +1", lear="Merman's Earring", rear="Merman's Earring",
    body="Ixion Cloak", hands="Dst. Mittens +1", ring1="Merman's Ring", ring2="Merman's Ring",
    back="Umbra Cape", waist="Resolute Belt", legs="Dst. Subligar +1", feet="Dst. Leggings +1" }

    sets.idle.PDT = { ammo="Hedgehog Bomb",
    main=gear.Staff.PDT, neck="Orochi Nodowa +1",lear="Merman's Earring", rear="Merman's Earring",
    body="Ixion Cloak", hands="Dst. Mittens +1", ring1="Merman's Ring", ring2="Merman's Ring",
    back="Umbra Cape", waist="Resolute Belt", legs="Dst. Subligar +1", feet="Dst. Leggings +1"}

    sets.idle.Town = { ammo="Hedgehog Bomb",
    main=gear.Staff.PDT, neck="Orochi Nodowa +1",lear="Merman's Earring", rear="Merman's Earring",
    body="Ixion Cloak", hands="Dst. Mittens +1", ring1="Merman's Ring", ring2="Merman's Ring",
    back="Umbra Cape", waist="Resolute Belt", legs="Dst. Subligar +1", feet="Dst. Leggings +1" }
    
    sets.idle.Weak = { ammo="Hedgehog Bomb",
    main=gear.Staff.PDT, neck="Orochi Nodowa +1",lear="Merman's Earring", rear="Merman's Earring",
    body="Ixion Cloak", hands="Dst. Mittens +1", ring1="Merman's Ring", ring2="Merman's Ring",
    back="Umbra Cape", waist="Resolute Belt", legs="Dst. Subligar +1", feet="Dst. Leggings +1" }
    
    
    -- Defense sets

    sets.defense.PDT = {
    main=gear.Staff.PDT, head="Darksteel Cap +1", neck="Orochi Nodowa +1",lear="Merman's Earring", rear="Merman's Earring",
    body=" Dst. Harness +1", hands="Dst. Mittens +1", ring1="Jelly Ring", ring2="Merman's Ring",
    back="Umbra Cape", waist="Resolute Belt", legs="Dst. Subligar +1", feet="Dst. Leggings +1" }

    sets.defense.MDT = {
    main=gear.Staff.PDT, neck="Orochi Nodowa +1",lear="Merman's Earring", rear="Merman's Earring",
    body="Avalon Breastplate", hands="Merman's Bangles", ring1="Merman's Ring", ring2="Merman's Ring",
    back="Resentment Cape", waist="Resolute Belt", legs="", feet="" }

    sets.Kiting = { }
    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
    head="Walahra Turban", neck="Ancient Torque", lear="Merman's Earring", rear="Merman's Earring",
    body="Sheikh Manteel", hands="Dusk Gloves +1", ring1="Toreador's Ring", ring2="Toreador's Ring",
    back="Cuchulain's Mantle", waist="Sonic Belt +1", legs="Byakko's Haidate", feet="Dusk Ledelsens +1" }

    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    -- Force Yellow HP
    sets.HPFUCK = {
    sub="Earth Grip", head="Zenith Crown +1", body="Flora Cotehardie", hands="Mahatma Cuffs", legs="Zenith Slacks +1",
    feet="Zenith Pumps +1", neck="Beak Necklace +1", waist="Penitent's Rope", lear="Astral Earring", rear="Merman's Earring",
    lring="Ether Ring", rring="Serket Ring", back="Ixion Cape" }


end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
update_combat_form()
end