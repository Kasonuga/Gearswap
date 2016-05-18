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
    state.Buff['Aftermath'] = buffactive['Aftermath: Lv.1'] or
    buffactive['Aftermath: Lv.2'] or
    buffactive['Aftermath: Lv.3']
    or false

end


-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
  	state.OffenseMode:options('Normal', 'GS', 'DualWield')
	state.RangedMode:options('Normal')
	state.HybridMode:options('Normal', 'Acc')
	state.WeaponskillMode:options('Normal')
	state.CastingMode:options('Normal')
	state.IdleMode:options('Normal', 'PDT', 'MDT')
	state.RestingMode:options('Normal')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
     
			
	adjust_engaged_sets()


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
	
	-- Sets to apply to arbitrary JAs
	-- Sets to apply to any actions of spell.type
	sets.precast.Waltz = {
		ammo="Bibiki Seashell", waist="Warwolf Belt" }
		
	-- Sets for specific actions within spell.type
	sets.precast.Waltz['Healing Waltz'] = {}

    -- Sets for fast cast gear for spells
	sets.precast.FC = {
		rear="Loquacious Earring", legs="Homam Cosciales" }

    -- Fast cast gear for specific spells or spell maps

	-- Weaponskill sets
	sets.precast.WS = {
		ammo="Fire Bomblet", head="Hecatomb Cap +1", neck=gear.ElementalGorget, lear="Tmph. Earring +1", rear="Brutal Earring",
		body="Armada Hauberk", hands="Hct. Mittens +1", ring1="Triumph Ring +1", ring2="Rajas Ring",
		back="Cerb. Mantle +1", waist="Warwolf Belt", legs="Onyx Cuisses", feet="Hct. Leggings +1" }

	-- Specific weaponskill sets.
	sets.precast.WS['Guillotine'] = set_combine(sets.precast.WS, {
		back="Abyss Cape", waist="Cuchulain's Belt" } )


	sets.precast.WS['Catastrophe'] = set_combine(sets.precast.WS, {
		hands="Alkyoneus's Brc." } )

	
	--------------------------------------
	-- Midcast sets
	--------------------------------------

    -- Generic spell recast set
	sets.midcast.FastRecast = {
		head="Walahra Turban", rear="Loquacious Earring", hands=gear.HasteHands, waist="Velocious Belt",
		legs="Homam Cosciales", feet="Homam Gambieras"}
		
	-- Specific spells
	sets.midcast.Utsusemi = { }

	
	--sets.midcast.Stoneskin = { body="Blood Scale Mail" }
	
	sets.midcast['Dark Magic'] = set_combine( sets.engaged, {
		head="Chaos Burgeonet",neck="Dark Torque", lear="Dark Earring", rear="Incubus Earring +1",
		body="Dmn. Harness +1", hands="Blood Fng. Gnt.", back="Abyss Cape", legs="Abs. Flanchard +1" } )

	sets.midcast['Drain'] = set_combine( sets.midcast['Dark Magic'], {
		body="Corselet +1" } )

	sets.midcast['Drain II'] = sets.midcast['Drain']

	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------
	
	-- Resting sets
	sets.resting = {
		ammo="Bibiki Seashell", head="Blood Mask", neck="Parade Gorget", lear="Merman's Earring", rear="Merman's Earring",
		body="Plastron +1", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", ring2="Merman's Ring",
		back="Lamia Mantle +1", waist="Resolute Belt", legs="Blood Cuisses", feet="Askar Gambieras" }	

	-- Idle sets
	sets.idle = {
		ammo="Bibiki Seashell", head="Blood Mask", neck="Parade Gorget", lear="Merman's Earring", rear="Merman's Earring",
		body="Plastron +1", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", ring2="Merman's Ring",
		back="Lamia Mantle +1", waist="Resolute Belt", legs="Blood Cuisses", feet="Askar Gambieras" }

	sets.idle.Town = {
		ammo="Bibiki Seashell", head="Blood Mask", neck="Parade Gorget", lear="Merman's Earring", rear="Merman's Earring",
		body="Plastron +1", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", ring2="Merman's Ring",
		back="Lamia Mantle +1", waist="Resolute Belt", legs="Blood Cuisses", feet="Askar Gambieras" }
	
	sets.idle.Weak = {
		ammo="Bibiki Seashell", head="Blood Mask", neck="Parade Gorget", lear="Merman's Earring", rear="Merman's Earring",
		body="Plastron +1", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", ring2="Merman's Ring",
		back="Lamia Mantle +1", waist="Resolute Belt", legs="Blood Cuisses", feet="Askar Gambieras" }
	
	-- Defense sets
	sets.defense.PDT = {
		ammo="Bibiki Seashell", head="Darksteel Cap +1", neck="Orochi Nodowa +1", body="Dst. Harness +1",
		back="Boxer's Mantle", hands="Dst. Mittens +1", ring1="Jelly Ring", legs="Dst. Subligar +1", feet="Askar Gambieras" }

	sets.defense.MDT = {
		head="Coral Visor +1", neck="Jeweled Collar +1", lear="Merman's Earring", rear="Merman's Earring",
		body="Cor. Scale Mail +1", hands="Coral Fng. Gnt. +1", ring1="Merman's Ring", ring2="Merman's Ring",  
		back="Lamia Mantle +1", waist="Resolute Belt",legs="Abs. Flanchard +1", feet="Askar Gambieras" }

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
		ammo="Fire Bomblet",
		head="Walahra Turban", neck="Ancient Torque", lear="Assault Earring", rear="Brutal Earring",
		body="Armada Hauberk", hands=gear.HasteHands, ring1="Blitz ring", ring2="Rajas Ring",
		back="Cerb. Mantle +1",waist="Velocious Belt", legs="Homam Cosciales", feet="Homam Gambieras" }

	sets.engaged.AM = {
	    ammo="Fire Bomblet",
	    head="Ace's Helm", neck="Ancient Torque", ear2="Brutal Earring", ear1="Assault Earring",
	    body="Armada Hauberk", hands="Homam Manopolas", ring1="Toreador's Ring", ring2="Rajas Ring",
	    back="Cerb. Mantle +1", waist="Velocious Belt", legs="Onyx Cuisses", feet="Aurum Sabatons" }
		
	sets.engaged.Scythe = {
		ammo="Fire Bomblet",
		head="Walahra Turban", neck="Ancient Torque", lear="Assault Earring", rear="Brutal Earring",
		body="Armada Hauberk", hands=gear.HasteHands, ring1="Blitz Ring", ring2="Rajas ring",
		back="Cerb. Mantle +1", waist="Velocious Belt",legs="Homam Cosciales", feet="Homam Gambieras" }
		
	sets.engaged.Scythe.AM = {
	    ammo="Fire Bomblet",
	    head="Ace's Helm", neck="Ancient Torque", ear2="Brutal Earring", ear1="Assault Earring",
	    body="Armada Hauberk", hands="Homam Manopolas", ring1="Toreador's Ring", ring2="Rajas Ring",
	    back="Cerb. Mantle +1", waist="Velocious Belt", legs="Onyx Cuisses", feet="Aurum Sabatons" }

	sets.engaged.GS = {
		ammo="Fire Bomblet",
		head="Walahra Turban", neck="Ancient Torque", lear="Assault Earring", rear="Brutal Earring",
		body="Armada Hauberk", hands=gear.HasteHands, ring1="Blitz ring", ring2="Rajas ring",
		back="Cerb. Mantle +1", waist="Velocious Belt",legs="Homam Cosciales", feet="Homam Gambieras" }

	sets.engaged.DualWield = {
		ammo="Fire Bomblet",
		head="Walahra Turban", neck="Ancient Torque", lear="Suppanomimi", rear="Brutal Earring",
		body="Armada Hauberk", hands="Homam Manopolas", ring1="Toreador's ring", ring2="Rajas ring",
		back="Cuchulain's Mantle", waist="Velocious Belt", legs="Homam Cosciales", feet="Homam Gambieras" }

	--------------------------------------
	-- Custom buff sets
	--------------------------------------

	sets.precast.JA['Last Resort'] = { }
	
	sets.precast.JA['Soul Eater'] = { head="Chaos Burgeonet" }
	
	sets.precast.JA['Weapon Bash'] = { }
	
end
     
    -------------------------------------------------------------------------------------------------------------------
    -- Job-specific hooks that are called to process player actions at specific points in time.
    -------------------------------------------------------------------------------------------------------------------
     
  
    -- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
    -- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
    function job_precast(spell, action, spellMap, eventArgs)
            if spell.action_type == 'Magic' then
            equip(sets.precast.FC)
            end
    end
     
 
     
     
    -- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
    function job_midcast(spell, action, spellMap, eventArgs)
            if spell.action_type == 'Magic' then
                equip(sets.midcast.FastRecast)
            end
    end
     
    -- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
  --  function job_aftercast(spell, action, spellMap, eventArgs)
  --      if not spell.interrupted then
  --              if state.Buff[spell.english] ~= nil then
  --                      state.Buff[spell.english] = true
  --              end
  --       end
  --  end
     
    -------------------------------------------------------------------------------------------------------------------
    -- Customization hooks for idle and melee sets, after they've been automatically constructed.
    -------------------------------------------------------------------------------------------------------------------
    -- Modify the default idle set after it was constructed.
    function customize_idle_set(idleSet)
            return idleSet
    end
     
    -- Modify the default melee set after it was constructed.
    function customize_melee_set(meleeSet)
            return meleeSet
    end
     
    -------------------------------------------------------------------------------------------------------------------
    -- General hooks for other events.
    -------------------------------------------------------------------------------------------------------------------
     
    -- Called when the player's status changes.
    function job_status_change(newStatus, oldStatus, eventArgs)
     
    end
     
    -- Called when a player gains or loses a buff.
    -- buff == buff gained or lost
    -- gain == true if the buff was gained, false if it was lost.
    function job_buff_change(buff, gain)
            if buff:startswith('Aftermath') then
                state.Buff.Aftermath = gain
                adjust_melee_groups()
                handle_equipping_gear(player.status)
        end
    end
     
    -------------------------------------------------------------------------------------------------------------------
    -- User code that supplements self-commands.
    -------------------------------------------------------------------------------------------------------------------
     
    -- Called by the 'update' self-command, for common needs.
    -- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
	adjust_engaged_sets()
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function adjust_engaged_sets()
	adjust_melee_groups()
end

function adjust_melee_groups()         
	classes.CustomMeleeGroups:clear()
        if state.Buff.Aftermath then
                classes.CustomMeleeGroups:append('AM')
        end
end