-- name: [CS] Rowdy the Riverhawk
-- description: Rowdy has pecked his way into SM64!\n\n Made by: A_Bunny\n\n Special thanks to:\n Squishy6094: Character Select mod\n srGSR: Custom Move Set mod \n MiniSkippy: Textures, Emotional Support, and Friend :>\n\n\\#ff7777\\This Pack requires Character Select\nto use as a Library!

--[[
    API Documentation for Character Select can be found below:
    https://github.com/Squishy6094/character-select-coop/blob/main/API-doc.md

    Use this if you're curious on how anything here works >v<
]]

local E_MODEL_CUSTOM_MODEL = smlua_model_util_get_id("rowdy_geo")

local TEX_CUSTOM_ICON = get_texture_info("Northeastern_State_wordmark")

local TEXT_MOD_NAME = "Rowdy the Riverhawk"

local VOICETABLE_CHAR = {
    [CHAR_SOUND_OKEY_DOKEY] =        'joeStartGameAlright.ogg', -- Starting game
    [CHAR_SOUND_LETS_A_GO] =         'joeStartLevel.ogg', -- Starting level
    [CHAR_SOUND_PUNCH_YAH] =         'joePunch1.ogg', -- Punch 1
    [CHAR_SOUND_PUNCH_WAH] =         'joePunch2.ogg', -- Punch 2
    [CHAR_SOUND_PUNCH_HOO] =         'joePunch3.ogg', -- Punch 3
    [CHAR_SOUND_YAH_WAH_HOO] =       {'joeJump1.ogg', 'joeJump2.ogg', 'joeJump3.ogg'}, -- First Jump Sounds
    [CHAR_SOUND_HOOHOO] =            'hawk_screech.ogg', -- Second jump sound
    [CHAR_SOUND_YAHOO_WAHA_YIPPEE] = {'joeTripleJump1.ogg', 'joeTripleJump2.ogg'}, -- Triple jump sounds
    [CHAR_SOUND_UH] =                'TF2_Pan_Thwak.ogg', -- Wall bonk
    [CHAR_SOUND_UH2] =               'joeLongJumpLand.ogg', -- Landing after long jump
    [CHAR_SOUND_UH2_2] =             'joeLongJumpLand.ogg',
    [CHAR_SOUND_HAHA] =              'win31Tada.ogg', -- Landing triple jump
    [CHAR_SOUND_YAHOO] =             'joeLongJump.ogg', -- Long jump
    [CHAR_SOUND_DOH] =               'joeBonk.ogg', -- Long jump wall bonk
    [CHAR_SOUND_WHOA] =              'joeGrabLedge.ogg', -- Grabbing ledge
    [CHAR_SOUND_EEUH] =              'joeClimbLedge.ogg', -- Climbing over ledge
    [CHAR_SOUND_WAAAOOOW] =          'joeFalling.ogg', -- Falling a long distance
    [CHAR_SOUND_TWIRL_BOUNCE] =      'FlowerBounce.ogg', -- Bouncing off of a flower spring
    [CHAR_SOUND_GROUND_POUND_WAH] =  'joeGroundPound.ogg', 
    [CHAR_SOUND_HRMM] =              'joeLift.ogg', -- Lifting something
    [CHAR_SOUND_HERE_WE_GO] =        'getStarGreatJob.ogg', -- Star get
    [CHAR_SOUND_SO_LONGA_BOWSER] =   'ThrowBowser.ogg', -- Throwing Bowser

    --Damage Sounds
    [CHAR_SOUND_ATTACKED] = 'joeBonk.ogg', -- Damaged
    [CHAR_SOUND_PANTING] = 'loop[shield_depleted].ogg', -- Low health
    [CHAR_SOUND_ON_FIRE] = 'jerry_on_fire.ogg', -- Burned

    --Sleep Sounds
    [CHAR_SOUND_IMA_TIRED] = 'Tired.ogg', -- Mario feeling tired
    [CHAR_SOUND_YAWNING] = 'Yawn.ogg', -- Mario yawning before he sits down to sleep
    [CHAR_SOUND_SNORING1] = 'Snore.ogg', -- Snore Inhale
    [CHAR_SOUND_SNORING2] = 'Exhale.ogg', -- Exhale
    [CHAR_SOUND_SNORING3] = 'SleepTalk.ogg', -- Sleep talking / mumbling

    --Coughing Sounds
    [CHAR_SOUND_COUGHING1] = 'Cough1.ogg', -- Cough take 1
    [CHAR_SOUND_COUGHING2] = 'Cough2.ogg', -- Cough take 2
    [CHAR_SOUND_COUGHING3] = 'Cough3.ogg', -- Cough take 3

    --Death Sounds
    [CHAR_SOUND_DYING] = 'vo_tom_death.ogg', -- Dying from damage
    [CHAR_SOUND_DROWNING] = 'Drowning.ogg', -- Running out of air underwater
    [CHAR_SOUND_MAMA_MIA] = 'loop[shield_charge].ogg' -- Booted out of level
}


local CAPTABLE_CHAR = {
    normal = smlua_model_util_get_id("rowdy_cap_normal_geo"),
    wing = smlua_model_util_get_id("rowdy_cap_wing_geo"),
    metal = smlua_model_util_get_id("rowdy_cap_metal_geo"),
    metalWing = smlua_model_util_get_id("rowdy_cap_wing_geo"),
}

if _G.charSelectExists then
    CT_CHAR = _G.charSelect.character_add("Rowdy the Riverhawk", {"The NSU Mascot is here to stay!",}, "A_Bunny", {r = 0, g = 200, b = 0}, E_MODEL_CUSTOM_MODEL, CT_MARIO, TEX_CUSTOM_ICON)
    _G.charSelect.character_add_caps(E_MODEL_CUSTOM_MODEL, CAPTABLE_CHAR)

    -- Modify character stats if customMoves exists
if _G.customMovesExists then
    _G.customMoves.character_add({
    name = 'Rowdy',
    ground_pound_antecipation_speed_up = 'medium',
    ground_pound_jump_on = true,
    ground_pound_jump_forward_vel = 20,
    ground_pound_dive_on = true,
    glide_dive_on = true,
    ground_pound_jump_dive_on = true
    })
end
-- the following must be hooked for each character added
    _G.charSelect.character_add_voice(E_MODEL_CUSTOM_MODEL, VOICETABLE_CHAR)
    hook_event(HOOK_CHARACTER_SOUND, function (m, sound)
        if _G.charSelect.character_get_voice(m) == VOICETABLE_CHAR then return _G.charSelect.voice.sound(m, sound) end
    end)
    hook_event(HOOK_MARIO_UPDATE, function (m)
        if _G.charSelect.character_get_voice(m) == VOICETABLE_CHAR then return _G.charSelect.voice.snore(m) end
    end)
else
    djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nRequires the Character Select Mod\nto use as a Library!\n\nPlease turn on the Character Select Mod\nand Restart the Room!", 6)
end