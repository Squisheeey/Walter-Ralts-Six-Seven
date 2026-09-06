local function NBTTarget()
      if player:getTargetedEntity() and player:getTargetedEntity():getNbt() then
            logTable(player:getTargetedEntity():getNbt())
            log((player:getTargetedEntity()))
      end
end

local function NBTTargetabilities()
      if player:getTargetedEntity():isPlayer() and player:getTargetedEntity():getNbt() then
            logTable(player:getTargetedEntity():getNbt().abilities)
      else
            printJson('{"text":"You arent looking at a player","bold":true,"color":"dark_red"}')
      end
end

function pings.setmessage(try)
      a = try
end

SCAN_msg = " "
local scanning_no = 0
function events.mouse_press(button, state, modifiers)
      if button == 1 and state == 1 then
            something = math.random(1, 7)
            pings.setmessage(something)
      end
end

function events.tick()
      local nameText = models.Walterv5.scan:newText("dynamic_text")
      local pokedex = player:getActiveItem().id:find('pokedex') ~= nil
      if pokedex then
            scanning_no = scanning_no + 1
            nameText:setText("msg")
                    :setPos(0, 0, 0)
                    :setScale(0.35)
                    :setAlignment("CENTER")
                    :setWidth(150)
                    :setLight(15,15)
      else
            scanning_no = 0
            scanned = false
      end
      if player:getVehicle() == nil and player:getTargetedEntity() then
            if player:getTargetedEntity():isPlayer() then
                  host:setActionbar("Looks like " .. player:getTargetedEntity():getName() .. "! Scan them for more info!")
                  if scanning_no >= 50 then
                        if scanning_no == 50 then
                              harping = true
                        end
                        scanned = true
                        local look = player:getTargetedEntity():getName()
                        if look == "Metiia" then
                              --if a == 1 then
                                    SCAN_msg = "Why so smol? Very smol."
                              --end
                        elseif look == "ApianCat" then
                              --if a == 1 then
                                    SCAN_msg = "A Charmander that Charmanders. What more could anyone want, really?"
                              --end
                        --AKG
                        elseif look == "TsumugiMaruo" then
                              --if a == 1 then
                                    SCAN_msg = "H o r s e ."
                              --end
                        --AKG
                        elseif look == "UwUnusually" then
                              if a == 1 then
                                    SCAN_msg = "Riolu of the AKG. ...is that shiny? Heck if I know."
                              elseif a == 2 then
                                    SCAN_msg = "This is the most dog Riolu I know. Though, I don't know many Riolu."
                              else
                                    SCAN_msg = "Probably one of the less violent goobs in the AKG."
                              end
                        elseif look == "Wildknight224" then
                              if a <= 4 then
                                    SCAN_msg = "Croconaw of the AKG, seems to be a muncher."
                              else
                                    SCAN_msg = "Caves are what I think of when I see this one."
                              end
                        elseif look == "Dynilkyr" then
                              if a <= 3 then
                                    SCAN_msg = "Ghostly Gengar jester. Clearly knows what they're doing. Mhm mhm."
                              elseif a < 6 then
                                    SCAN_msg = "One of the only goobs that I know with a mega form. ...someone should change that..."
                              else
                                    SCAN_msg = "Where does this Gengar hide that huge ball? Hat? Shoes?"
                              end
                        --AKG
                        elseif look == "Suave_516" then
                              if a <= 3 then
                                    SCAN_msg = "This is the guildleader for the AKG. I'm only a little jealous of how active it is."
                              elseif a <= 5 then
                                    SCAN_msg = "Unfortunate that this guy can't stop all the fighting in his guild. It's painful to visit sometimes..."
                              else
                                    SCAN_msg = "I'mma firin' my arm cannon!!"
                              end
                        elseif look == "MillsV2" then
                              if a <= 3 then
                                    SCAN_msg = "Not to be confused with Jo, the other Shaymin."
                              elseif a <= 5 then
                                    SCAN_msg = "Sending my gratitude to the Shaymin."
                              else
                                    SCAN_msg = "GRATITUDE! ...goobitude! Goob tube."
                              end
                        elseif look == "JungleManDarn" then
                              if a == 1 then
                                    SCAN_msg = "Run a hotel, no pay no pay. Get on it, freeloaders."
                              elseif a <= 3 then
                                    SCAN_msg = "Ghostly host of the hotel most."
                              elseif a <= 5 then
                                    SCAN_msg = "<vine boom sfx>"
                              elseif a == 6 then
                                    SCAN_msg = "...probably a homosexual."
                              else
                                    SCAN_msg = "No longer celebrate his sad days."
                              end
                        elseif look == "DirectingBard58" then
                              if a <= 3 then
                                    SCAN_msg = "Kinda wanna call 'em Crim's not-cousin just to see how they'd react."
                              else
                                    SCAN_msg = "Another Armarouge of the AKG, probably the one who murdered the least."
                              end
                        elseif look == "LumpyThe" then
                              if a == 1 then
                                    SCAN_msg = "A Misdreavus for the AKG. Floaty one."
                              elseif a == 2 then
                                    SCAN_msg = "I've heard rumors that this one can't faint, impressive!"
                              elseif a == 3 then
                                    SCAN_msg = "Mallet scary. Hurts like nature."
                              else
                                    SCAN_msg = "Ghosty ghost that kills things in the front yard."
                              end
                        elseif look == "ItzNayte" then
                              if a == 1 then
                                    SCAN_msg = "The mysterious wings, and the storyless power that let them fly."
                              elseif a == 2 then
                                    SCAN_msg = "Swordwielder af."
                              else
                                    SCAN_msg = "A Lilligant from the AKG. Gracefully strong."
                              end
                        elseif look == "Edael_Arts" then
                              if a == 1 then
                                    SCAN_msg = "D u c k ."
                              elseif a == 2 then
                                    SCAN_msg = "Wind and Waves? Hm, sounds familiar... hmmmm..."
                              else
                                    SCAN_msg = "Is this gonna be a stream plug?! ARE YOU STREAMING?!"
                              end
                        elseif look == "HarryMiles7533" then
                              if a == 1 then
                                    SCAN_msg = "Grookey of the AKG... probably?"
                              else
                                    SCAN_msg = "A very fitting name, I think..."
                              end
                        elseif look == "Koi_Dragon_" then
                              if a == 1 then
                                    SCAN_msg = "Dragapult of the AKG. A builder. Talented."
                              elseif a == 2 then
                                    SCAN_msg = "A team member. Builds stuff. Very important."
                              elseif a == 3 then
                                    SCAN_msg = "<insert dragon noises here>"
                              elseif a == 4 then
                                    SCAN_msg = "Wanting to join the scan squad? Are you ready to scan?!"
                              elseif a == 5 then
                                    SCAN_msg = "Do NOT disturb the dragon as they are building!"
                              elseif a == 6 then
                                    SCAN_msg = "Flies constantly. Runs into walls."
                              else
                                    SCAN_msg = "Do the Dreepy come up with the plans? ...nah, no way."
                              end
                        elseif look == "parav" then
                              if a <= 3 then
                                    SCAN_msg = "Why did this mon bring a whole jukebox???"
                              elseif a <= 5 then
                                    SCAN_msg = "Parav, play me Despacito."
                              else
                                    SCAN_msg = "Galvantula of the AKG... no wait, she's just here for the food. Hmm."
                              end
                        elseif look == "GuzmaSpades" then
                              if a == 1 then
                                    SCAN_msg = "BIYARP, BIYARP, BIYARP!"
                              elseif a == 2 then
                                    SCAN_msg = "...hm, am I suddenly determined? Nah..."
                              else
                                    SCAN_msg = "Old."
                              end
                        elseif look == "SirRichardZ" then
                              if a < 3 then
                                    SCAN_msg = "Boopable!"
                              elseif a <= 5 then
                                    SCAN_msg = "Huggable and friend-shaped!"
                              else
                                    SCAN_msg = "Big... uh... hm, yeah, I don't have much on this goob."
                              end
                        elseif look == "DanielM291" then
                              if a < 3 then
                                    SCAN_msg = "The winner of the Guild Games. Impressed."
                              else
                                    SCAN_msg = "Another fire slash soul sword user."
                              end
                        --IMGNStation
                        elseif look == "CelesteMystic" then
                              if a == 1 then
                                    SCAN_msg = "YEAAAAAAH GUILDMASTER!!!"
                              elseif a == 2 then
                                    SCAN_msg = "It's inspiring seeing Guildmaster come back unscathed from a big trip."
                              elseif a == 3 then
                                    SCAN_msg = "Whatever corrupted the Guildmaster must've gotten to her eyes, too. Could swear she's blind sometimes..."
                              end
                        elseif look == "Tobindeboi" then
                              if a == 1 then
                                    SCAN_msg = "This guy. I like this guy"
                              elseif a == 2 then
                                    SCAN_msg = "He likes to speak, interesting as he is."
                              elseif a == 3 then
                                    SCAN_msg = "Fellow guild member, good to have around."
                              end
                        elseif look == "DittoKid132b" then
                              if a == 1 then
                                    SCAN_msg = "Never see this Ditto often, but it's nice seein' him."
                              elseif a == 2 then
                                    SCAN_msg = "A guild member is accepted, no matter what form."
                              else
                                    SCAN_msg = "...lucky thing can turn into whatever he wants. I wanna do that..."
                              end
                        --Oh boy.
                        elseif look == "kane5566" then
                              if a == 1 then
                                    SCAN_msg = "A Jolteon from one of the largest guilds ever."
                              elseif a == 2 then
                                    SCAN_msg = "Hard to keep up, easy to catch up."
                              else
                                    SCAN_msg = "This one might have a case of the zoomies..."
                              end
                        elseif look == "Iciest_Ice" then
                              if a == 1 then
                                    SCAN_msg = "A team member! Very important!"
                              elseif a == 2 then
                                    SCAN_msg = "...hm. ...it's gotten a little cold..."
                              elseif a == 3 then
                                    SCAN_msg = "I think they're in one of the biggest guilds out there. Lucky guild."
                              else
                                    SCAN_msg = "R e f r i d g e r a t i o n !"
                              end
                        elseif look == "Granbull" then
                              if a == 1 then
                                    SCAN_msg = "A fellow supporter! Very good at chewing, I'd say."
                              elseif a == 2 then
                                    SCAN_msg = "This guy is someone I should go to for Figura issues. ...or, I would, if mine weren't such a mess, ha."
                              else
                                    SCAN_msg = "One of the server people who's been here longer than me."
                              end
                        --Other
                        elseif look == "JoSchmo_" then
                              if a == 1 then
                                    SCAN_msg = "Sending my gratitude to the Shaymin of all time."
                              elseif a == 2 then
                                    SCAN_msg = "Loud. Can't throw trident. Still cool."
                              elseif a == 3 then
                                    SCAN_msg = ":aga:"
                              else
                                    SCAN_msg = "GRATITUDE!"
                              end
                        elseif look == "masterchefbaker" then
                              if a < 3 then
                                    SCAN_msg = "It's THE Groyvle, yeah?"
                              elseif a < 5 then
                                    SCAN_msg = "Has killed and then unkilled. Go visit the AKG."
                              else
                                    SCAN_msg = "Has good ideas."
                              end
                        elseif look == "Sevenior" then
                              if a < 3 then
                                    SCAN_msg = "Calling this one Souvenir because screw that username."
                              elseif a < 5 then
                                    SCAN_msg = "Grass monkey, usually. Probably forgot the name of it lol."
                              else
                                    SCAN_msg = "Has a bnuuy girlfriend, met in... I'm not writing that."
                              end
                        elseif look == "GlitzyBunny" then
                              if a < 3 then
                                    SCAN_msg = "The glamour-and-glitz bunny that works as a receptionist for the 7-Souls Hotel."
                              elseif a < 5 then
                                    SCAN_msg = "Needs to go to bed, probably."
                              else
                                    SCAN_msg = "Has a monkeh girlfriend, met in... I'm not writing that."
                              end
                        elseif look == "SkyStormDragon" then
                              if a < 3 then
                                    SCAN_msg = "...the Rayquaza is homo. Truly there is progression among the legends"
                              elseif a < 5 then
                                    SCAN_msg = "I will be filling the mailbox."
                              else
                                    SCAN_msg = "S K Y     D R A G O N !"
                              end
                        elseif look == "Roboian316" then
                              if a == 1 then
                                    SCAN_msg = "Beep boop quiz time?"
                              elseif a == 2 then
                                    SCAN_msg = "The IRS? ...heck are they gonna do? Tax my food?! ...oh wait!"
                              elseif a == 3 then
                                    SCAN_msg = "Peanuts."
                              elseif a == 4 then
                                    SCAN_msg = "This Porygon could, in fact, hack my system."
                              else
                                    SCAN_msg = "A team member! Very important!"
                              end
                        elseif look == "Squisheeey" then
                              if a == 1 then
                                    SCAN_msg = "Not the squishiest. 9/10."
                              elseif a == 2 then
                                    SCAN_msg = "Playcar certified; no license needed."
                              else
                                    SCAN_msg = "Ducklet? Ledian? Whatever, he's a Ditto now."
                              end
                        elseif look == "TerrificHorse59" then
                              if a == 1 then
                                    SCAN_msg = "A team member! Very important!"
                              elseif a == 2 then
                                    SCAN_msg = "It's an honor to support this one in these trying times."
                              elseif a == 3 then
                                    SCAN_msg = "Should be part of the AKG, since he loves killing me for no reason."
                              elseif a == 4 then
                                    SCAN_msg = "MOD ABUSE! REPORT! REPOOOOORT!"
                              elseif a == 5 then
                                    SCAN_msg = "...nuh-uh."
                              elseif a == 6 then
                                    SCAN_msg = ":aga:"
                              else
                                    SCAN_msg = "Broke my dang scanner, this guy..."
                              end
                        elseif look == "BoundlessAltima" then
                              if a == 1 then
                                    SCAN_msg = "Some Mimikyu can get really creative. The power of art is spreading to the cloaks."
                              else
                                    SCAN_msg = "Eevee is popular. ...maybe I should wear something..."
                              end
                        
                        elseif look == "meiguess_" then
                              if a == 1 then
                                    SCAN_msg = "There's a certain gaze about this one..."
                              else
                                    SCAN_msg = "A Lilligant of the AKG. Considerate horn buddy that prefers the trees."
                              end
                        elseif look == "HaijimaJuu" then
                              if a == 1 then
                                    SCAN_msg = "Chained-up Toxic Guy."
                              else
                                    SCAN_msg = "I will read that book. I must, even."
                              end
                        elseif look == "weeklyfish" then
                              if a <= 3 then
                                    SCAN_msg = "Waxed and ready to spellcast; the candles do not contain."
                              elseif a < 6 then
                                    SCAN_msg = "...so is it like, a fashion choice, or like...?"
                              else
                                    SCAN_msg = "Lawful Neutral Shadow Wizard Money Gang."
                              end
                        elseif look == "Wutavik" then
                              if a == 1 then
                                    SCAN_msg = "Hosts decent parties, yes yes."
                              else
                                    SCAN_msg = "Based music taste, clearly."
                              end
                        elseif look == "SnommySnom" then
                              if a <= 4 then
                                    SCAN_msg = "Is not a snom."
                              else
                                    SCAN_msg = "...wait, a mining helmet? How... how would...?"
                              end
                        --Team members
                        elseif look == "shako_x3" then
                              if a == 1 then
                                    SCAN_msg = "BRO, SHAKO, THE GOAT OF IT ALL!"
                              elseif a < 6 then
                                    SCAN_msg = "CMD TODAY FOR SURE!"
                              else
                                    SCAN_msg = "It begins."
                              end
                        elseif look == "JawaMC" then
                              if a == 1 then
                                    SCAN_msg = "An admin! ...something must be happening! Oh boy! UPDATE?! CMD TODAY?!"
                              else
                                    SCAN_msg = "...heck is Jawa...?"
                              end
                        elseif look == "Rattallow" then
                              if a <= 4 then
                                    SCAN_msg = "A Mewtwo? In this economy???"
                              else
                                    SCAN_msg = "...there's something going on with this one. I can sense it."
                              end
                        elseif look == "IDKImJustAChatot" then
                              if a == 1 then
                                    SCAN_msg = "I can copy sounds, too! Delelelelelewooooooooop!!"
                              elseif a == 2 then
                                    SCAN_msg = "Ability! Copy!"
                              else
                                    SCAN_msg = "Chatot of Winds and Waves. ...I think I put food in their mailbox once."
                              end
                        else
                              SCAN_msg = "Someone new! It's " .. player:getTargetedEntity():getName() .. "! I should put in an entry sometime..."
                        end
                  else
                        scanned = false
                  end
            elseif player:getTargetedEntity():getNbt().Pokemon ~= nil then
                  host:setActionbar("This is a " .. player:getTargetedEntity():getName())
                  if scanning_no >= 50 then
                        if scanning_no == 50 then
                              harping = true
                        end
                        scanned = true
                        SCAN_msg = "This is a " .. player:getTargetedEntity():getName() .. "!"
                  else
                        scanned = false
                  end
                  
            elseif player:getTargetedEntity() ~= nil then
                  host:setActionbar("What's this thing?")
                  if scanning_no >= 50 then
                        if scanning_no == 50 then
                              harping = true
                              --logTable(player:getTargetedEntity():getNbt())
                        end
                        scanned = true
                        local look = player:getTargetedEntity():getName()
                        if player:getTargetedEntity():getType() == "minecraft:villager" then                              
                              if a == 1 then
                                    SCAN_msg = "Hrrr."
                              elseif a == 2 then
                                    SCAN_msg = "Hrrrrrr..."
                              elseif a == 3 then
                                    SCAN_msg = "Hrm!"
                              end
                        elseif look == "Painting" then                              
                              SCAN_msg = "What a nice picture."
                        else
                              SCAN_msg = "Something new! A " .. player:getTargetedEntity():getName() .. ". I should put in an entry sometime..."
                        end
                  else
                        scanned = false
                  end
            else
                  host:setActionbar("Nothing here, it seems...")
            end
      elseif player:getVehicle() ~= nil then
            return
      end
end

