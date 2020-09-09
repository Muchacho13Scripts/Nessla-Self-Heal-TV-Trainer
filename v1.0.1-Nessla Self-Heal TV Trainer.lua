-----------------Nessla Self-Heal TV Trainer Script by Scriptchacho----------------------
------------- Be sure to check out the readme: http://bit.ly/NesslaTVTrainer ------------
---------------------------------User Settings-------------------------------------------
--Movement Options
--1 - Up/Down Delay
--2 - Curved Movement - Does a curve when changing directions
--3 - Maevement - A Mix between Random, Circle and Curved Movements
--4 - Left/Right Delay
movement = 1
--------------
--Luma Options
--1 - Wait on Luma
--2 - Disconnect On Luma
--3 - Only Cards on Luma
LumaOption = 3
--------------
-- Number of Tems to train TV 
tems = 4
--------------
-- Number of enemies to kill for desired TV
temstokill = 500
--------------
-- Your VM Name or Number
vm = "Your VM Name"
--------------
-- Continuous Notifications to Telegram
notifications = 1
--------------
-- Using Proteins as Gear? (You need to equip your first Tem with it)
proteins = 1
--------------
--Using Cowards Cloak as Gear? (You need to equip your last Tem with it)
cloak = 1


























----------------------------------------------------------------------------------------------------
-----------------Do Not Change if you don't know what you are doing!!!------------------------------
----------------------------------Attributes--------------------------------------------------------
import ('TemBot.Lua.TemBotLua')
tems = tems - cloak
killedtem 				= 1
MovementSwitch 			= 2
notificationcounter 	= killedtem
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-------------------------------------Battle Functions-----------------------------------------------
----------------------------------------------------------------------------------------------------

function MainBattle(luma, nr) -- Main Battle Function
	if tblua:CheckLuma() == true then
		return LumaSetting(luma, nr)
	end
	Exhausted()
	local enemycount = CheckNumberOfEnemies()
	if enemycount == 1 then
		return SingleEncounterBattle(enemycount)
	else
		return DoubleEncounterBattle(enemycount)
	end
	return 0
end

function SingleEncounterBattle(enemies) -- sequences for single encounter
	local antistuck = 0
	while tblua:IsInWorld() == false
	do
		antistuck = CheckAntiStuck(antistuck)
		if tblua:IsInFight() == true then
			SimpleAttack()
			antistuck = 0
		else
			SkipExpSkill()
			DeadTem()
		end
	end
	return enemies
end

function DoubleEncounterBattle(enemies) -- sequences for double encounters
	local antistuck = 0
	local turn = 1
	local cards = 0
	local deadtem = 0	
	while tblua:IsInWorld() == false
	do
		antistuck = CheckAntiStuck(antistuck)
		if turn == 1 and tblua:IsInFight() == true then
			SwitchAttack()
			turn = turn + 1
			antistuck = 0
		elseif turn < 7 and tblua:IsInFight() == true then
			SimpleAttack()
			turn = turn + 1
		elseif turn == 7 and tblua:IsInFight() == true then
			runningaway()
		else
			SkipExpSkill()
			DeadTem()
		end
	end
	return enemies
end

function runningaway() -- simple runaway function
	-- runaway sequence
		while tblua:IsInWorld() == false
        do
            if tblua:IsInFight() == true then
                local RandomRunz = math.random(330, 694)
                tblua:Sleep(RandomRunz)
                tblua:PressKey(0x38)
            else
                local RandomSleepzzz = math.random(455, 694)
                tblua:Sleep(RandomSleepzzz)
			end
        end 
end

function Exhausted() -- skip turn when exhausted
	if tblua:GetPixelColor(276, 631) == "0xFFFFFF" then
		local sleepy = math.random(74, 132)
		tblua:Sleep(sleepy)
		tblua:PressKey(0x36)
		tblua:Sleep(sleepy)
		tblua:Sleep(sleepy)
		tblua:PressKey(0x36)
		tblua:Sleep(sleepy)
	end
end

function CheckNumberOfEnemies() -- checks the number of targets
    if tblua:GetPixelColor(1045, 100) == "0x1E1E1E" then
        if tblua:GetPixelColor(777, 65) == "0x1E1E1E" then
			return 2
		else
			return 1
		end
	end
end

function SwitchAttack() -- First Attack used on other Tem
    tblua:Sleep(math.random(666, 999))
	tblua:PressKey(0x31)
    tblua:Sleep(math.random(666, 999))
	tblua:PressKey(0x26)
    tblua:Sleep(math.random(666, 999))
	tblua:PressKey(0x46)
    tblua:Sleep(math.random(666, 999))
	tblua:PressKey(0x31)
    tblua:Sleep(math.random(666, 999))
	tblua:PressKey(0x46)
	tblua:Sleep(math.random(1820, 3594))
end

function SimpleAttack() -- First Attack used on marked Tem
	tblua:Sleep(math.random(666, 999))
    tblua:PressKey(0x31)
	tblua:Sleep(math.random(666, 999))
    tblua:PressKey(0x46)
	tblua:Sleep(math.random(666, 999))
    tblua:PressKey(0x31)
	tblua:Sleep(math.random(666, 999))
    tblua:PressKey(0x46)
	tblua:Sleep(math.random(1820, 3594))
end

function KeepTem() -- Keeping the Tem
    if tblua:GetPixelColor(750, 530) == "0x1CD1D3" then
		tblua:Sleep(math.random(666, 999))
        tblua:PressKey(0x46)
        tblua:Sleep(math.random(366, 999))
        tblua:PressKey(0x46)
        tblua:Sleep(math.random(366, 999))
        tblua:PressKey(0x46)
        tblua:Sleep(math.random(1820, 3594))
	end
end

function SkipExpSkill() -- Skips Exp Screen and new Attack Screen
	if tblua:GetPixelColor(215, 255) == "0x1CD1D3" then
		tblua:Sleep(math.random(666, 999))
		tblua:PressKey(0x1B)
		tblua:Sleep(math.random(1820, 3594))
	end
	
	if tblua:GetPixelColor(590, 245) == "0x1CD1D3" then
		tblua:Sleep(math.random(666, 999))
		tblua:PressKey(0x1B)
		tblua:Sleep(math.random(1820, 3594))
	end
end

function CheckAntiStuck(value) -- if nothing happens in fight because of lag, pressing escape to get back to menu and then flee
	if value > 200 then
		tblua:PressKey(0x1B)
		tblua:Sleep(math.random(750, 1594))
		tblua:PressKey(0x1B)
		tblua:Sleep(math.random(705, 1594))
		tblua:PressKey(0x1B)
		tblua:Sleep(math.random(750, 1594))
		tblua:PressKey(0x1B)
		tblua:Sleep(math.random(705, 1594))
		tblua:PressKey(0x1B)
		tblua:Sleep(math.random(750, 1594))
		tblua:PressKey(0x1B)
		tblua:Sleep(math.random(705, 1594))
		while tblua:IsInFight() == false
		do
			tblua:PressKey(0x1B)
			tblua:Sleep(math.random(800, 1594))
		end
		local RandomRunz = math.random(330, 694)
        tblua:Sleep(RandomRunz)
        tblua:PressKey(0x38)
		local RandomRunz = math.random(330, 694)
        tblua:Sleep(RandomRunz)
        tblua:PressKey(0x38)
		local RandomRunz = math.random(330, 694)
        tblua:Sleep(RandomRunz)
        tblua:PressKey(0x38)
		local RandomRunz = math.random(330, 694)
        tblua:Sleep(RandomRunz)
        tblua:PressKey(0x38)
		return 0
	else
	tblua:Sleep(math.random(650, 800))
	value = value + 1
	return value
	end	

end

function DeadTem() -- End Script if something dies
	if tblua:GetPixelColor(1180, 455) == "0x1E1E1E" then
	tblua:SendTelegramMessage("Message from VM:" .. vm)
	tblua:Sleep(math.random(1000, 3000))	
	tblua:SendTelegramMessage("Something Died....Disconnecting")
    local RandomDC = math.random(1548, 3110)
	tblua:Sleep(RandomDC)
	tblua:PressKey(0x1B)
	tblua:Sleep(RandomDC)
	tblua:PressKey(0x28)
	tblua:Sleep(RandomDC)
	tblua:PressKey(0x28)
	tblua:Sleep(RandomDC)
	tblua:PressKey(0x46)
	tblua:Sleep(RandomDC)
	tblua:PressKey(0x46)
	tblua:Sleep(RandomDC)
	tblua:PressKey(0x71)
	end
end

----------------------------------------------------------------------------------------------------
--------------------------------------Luma Functions------------------------------------------------
----------------------------------------------------------------------------------------------------

function LumaSetting(option, nr) -- Checks the Luma Option chosen
	if tblua:CheckLuma() == true then
		if option == 1 then
			WaitForLuma(nr)
		elseif option == 2 then
			DisconnectOnLuma(nr)
		elseif option == 3 then
			return CardsOnLuma(nr)
		else
			WaitForLuma(nr)
		end
	end
end

function WaitForLuma(vmnr) -- Waiting for Luma Option
	tblua:SendTelegramMessage("-----------------------------------------------------")	
	tblua:Sleep(math.random(500, 1000))					
	tblua:SendTelegramMessage("Message from VM:" .. vmnr)
	tblua:Sleep(math.random(300, 800))
	tblua:SendTelegramMessage("Luma Found! Stopping Script and Waiting...")
	tblua:TestMessage("Luma Found! Stopping Script and Waiting...")
	tblua:PressKey(0x71)
end

function DisconnectOnLuma(vmnr)
	tblua:SendTelegramMessage("-----------------------------------------------------")	
	tblua:Sleep(math.random(500, 1000))					
	tblua:SendTelegramMessage("Message from VM: " .. vmnr)
	tblua:Sleep(math.random(300, 800))
	tblua:SendTelegramMessage("Luma Found! Disconnecting...")
    local RandomDC = math.random(1548, 3110)
	tblua:Sleep(RandomDC)
	tblua:PressKey(0x1B)
	tblua:Sleep(RandomDC)
	tblua:PressKey(0x28)
	tblua:Sleep(RandomDC)
	tblua:PressKey(0x28)
	tblua:Sleep(RandomDC)
	tblua:PressKey(0x46)
	tblua:Sleep(RandomDC)
	tblua:PressKey(0x46)
	tblua:Sleep(RandomDC)
	tblua:PressKey(0x71)
end

function CardsOnLuma(vmnr)
	tblua:SendTelegramMessage("-----------------------------------------------------")	
	tblua:Sleep(math.random(500, 1000))					
	tblua:SendTelegramMessage("Message from VM: " .. vmnr)
	tblua:Sleep(math.random(300, 800))
	tblua:SendTelegramMessage("Luma Found! Start throwing Cards")
	if CheckNumberOfEnemies() == 1 then
		return LumaSingleEncounterCatch()
	else
		return LumaDoubleEncounterCatch()
	end

end

function LumaSingleEncounterCatch() -- sequences for single encounter
	local antistuck = 0
	local turn = 1
	while tblua:IsInWorld() == false
	do
		if turn == 1 and tblua:IsInFight() == true then
			SoloEncounterFirstCatch()
			turn = turn + 1
			antistuck = 0
		elseif turn == 2 and tblua:IsInFight() == true then
			SoloEncounterSecondCatch()
			antistuck = 0
		else
			KeepTem()
			SkipExpSkill()
			antistuck = CheckAntiStuck(antistuck)
		end
	end
	return 1
end

function LumaDoubleEncounterCatch() -- sequences for double encounter
	local antistuck = 0
	local turn = 1
	while tblua:IsInWorld() == false
	do
		if turn == 1 and tblua:IsInFight() == true then
			DoubleEncounterFirstCatch()
			turn = turn + 1
			antistuck = 0
		elseif turn == 2 and tblua:IsInFight() == true then
			if CheckNumberOfEnemies() == 2 then
			DoubleEncounterSecondCatchTem()
			else
			SoloEncounterSecondCatch()
			end
			antistuck = 0
		else
			KeepTem()
			SkipExpSkill()
			antistuck = CheckAntiStuck(antistuck)
		end
	end
	return 2
end

function DoubleEncounterFirstCatch() -- Slower Catch for First Catch Round (DOUBLE Encounter)
    tblua:Sleep(math.random(666, 999))
    tblua:PressKey(0x37)
	tblua:Sleep(math.random(666, 999))
	if tblua:GetPixelColor(558, 45) == "0x656565" and tblua:GetPixelColor(548, 22) == "0x656565" and tblua:GetPixelColor(544, 48) == "0x656565" then
		local cardsempty = 1
		local activateantistuck = 500
		return 1
	end
    tblua:PressKey(0x45)
    tblua:Sleep(math.random(666, 999))
    tblua:PressKey(0x46)
    tblua:Sleep(math.random(666, 999))
    tblua:PressKey(0x26)
    tblua:Sleep(math.random(666, 999))
    tblua:PressKey(0x46)
    tblua:Sleep(math.random(666, 999))
    tblua:PressKey(0x37)
    tblua:Sleep(math.random(666, 999))
	if tblua:GetPixelColor(558, 45) == "0x656565" and tblua:GetPixelColor(548, 22) == "0x656565" and tblua:GetPixelColor(544, 48) == "0x656565" then
		local cardsempty = 1
		local activateantistuck = 500
		return 1
	end
    tblua:PressKey(0x46)
    tblua:Sleep(math.random(666, 999))
    tblua:PressKey(0x46)
	tblua:Sleep(math.random(1820, 3594))
	local cardsavailable = 0
	local notstuck = 0
end

function SoloEncounterFirstCatch() -- Slower Catch for First Catch Round (SOLO Encounter)
    tblua:Sleep(math.random(666, 999))
	tblua:PressKey(0x37)
    tblua:Sleep(math.random(666, 999))
	if tblua:GetPixelColor(558, 45) == "0x656565" and tblua:GetPixelColor(548, 22) == "0x656565" and tblua:GetPixelColor(544, 48) == "0x656565" then
		local cardsempty = 1
		local activateantistuck = 500
		return 1
	end
	tblua:PressKey(0x45)
    tblua:Sleep(math.random(666, 999))
	tblua:PressKey(0x46)
    tblua:Sleep(math.random(666, 999))
	tblua:PressKey(0x37)
    tblua:Sleep(math.random(666, 999))
	if tblua:GetPixelColor(558, 45) == "0x656565" and tblua:GetPixelColor(548, 22) == "0x656565" and tblua:GetPixelColor(544, 48) == "0x656565" then
		local cardsempty = 1
		local activateantistuck = 500
		return 1
	end
	tblua:PressKey(0x46)
    tblua:Sleep(math.random(1820, 3594))
	local cardsavailable = 0
	local notstuck = 0
end

function DoubleEncounterSecondCatchTem() -- Faster Catch for Second Catch Round (DOUBLE Encounter)
    tblua:Sleep(math.random(666, 999))
    tblua:PressKey(0x37)
    tblua:Sleep(math.random(666, 999))
	if tblua:GetPixelColor(558, 45) == "0x656565" and tblua:GetPixelColor(548, 22) == "0x656565" and tblua:GetPixelColor(544, 48) == "0x656565" then
		local cardsempty = 1
		local activateantistuck = 500
		return 1
	end
    tblua:PressKey(0x46)
    tblua:Sleep(math.random(666, 999))
    tblua:PressKey(0x46)
    tblua:Sleep(math.random(666, 999))
    tblua:PressKey(0x37)
    tblua:Sleep(math.random(666, 999))
	if tblua:GetPixelColor(558, 45) == "0x656565" and tblua:GetPixelColor(548, 22) == "0x656565" and tblua:GetPixelColor(544, 48) == "0x656565" then
		local cardsempty = 1
		local activateantistuck = 500
		return 1
	end
    tblua:PressKey(0x46)
    tblua:Sleep(math.random(666, 999))
    tblua:PressKey(0x46)
    tblua:Sleep(math.random(1820, 3594))
	local cardsavailable = 0
	local notstuck = 0
end

function SoloEncounterSecondCatch() -- Faster Catch for Second Catch Round (SOLO Encounter)
    tblua:Sleep(math.random(666, 999))
	tblua:PressKey(0x37)
    tblua:Sleep(math.random(666, 999))
	if tblua:GetPixelColor(558, 45) == "0x656565" and tblua:GetPixelColor(548, 22) == "0x656565" and tblua:GetPixelColor(544, 48) == "0x656565" then
		local cardsempty = 1
		local activateantistuck = 500
		return 1
	end
	tblua:PressKey(0x46)
    tblua:Sleep(math.random(666, 999))
	tblua:PressKey(0x37)
    tblua:Sleep(math.random(666, 999))
	if tblua:GetPixelColor(558, 45) == "0x656565" and tblua:GetPixelColor(548, 22) == "0x656565" and tblua:GetPixelColor(544, 48) == "0x656565" then
		local cardsempty = 1
		local activateantistuck = 500
		return 1
	end
	tblua:PressKey(0x46)
    tblua:Sleep(math.random(1820, 3594))
	local cardsavailable = 0
	local notstuck = 0
end
----------------------------------------------------------------------------------------------------
-------------------------------------Movement Functions---------------------------------------------
----------------------------------------------------------------------------------------------------

function MainMovement(mov, switch)
    tblua:CheckPause()
    tblua:CheckLogout()
	if mov == 1 then		
		return movementupdown(switch)
	elseif mov == 2 then
		return movementcurved(switch)
	elseif mov == 3 then
		return movementmaevement(switch)
	elseif mov == 4 then
		return movementleftright(switch)
	end
end

function movementupdown(move) -- movement up/down function	
    if move == 1 then
        tblua:KeyDown(0x57)
        tblua:Sleep(tblua:GetTickrate()*math.random(99, 222))
        tblua:KeyUp(0x57)
        return 2
    else
        tblua:KeyDown(0x53)
        tblua:Sleep(tblua:GetTickrate()*math.random(99, 222))
        tblua:KeyUp(0x53)
        return 1
    end
end

function movementleftright(move) -- movement up/down function	
    if move == 1 then
        tblua:KeyDown(0x41)
        tblua:Sleep(tblua:GetTickrate()*math.random(99, 222))
        tblua:KeyUp(0x41)
        return 2
    else
        tblua:KeyDown(0x44)
        tblua:Sleep(tblua:GetTickrate()*math.random(99, 222))
        tblua:KeyUp(0x44)
        return 1
    end
end

function movementcurved(move) -- movement curved
    if move == 1 then
		tblua:CircleArea()
		tblua:Sleep(math.random(100, 300))
		return 2
    elseif move == 2 then
        tblua:RandomArea()
		tblua:Sleep(math.random(700, 1200))
		return 1
    else
        tblua:CircleArea()
		tblua:Sleep(math.random(100, 300))
		return 2
	end
end


function movementmaevement(move) -- movement random/circle/curved
    if move == 1 then
        tblua:CircleArea()
		return move
    elseif move == 2 then
		local changecurve = 1
		while tblua:IsInWorld() == true
		do
			if changecurve == 1 then
				tblua:CircleArea()
				tblua:Sleep(math.random(100, 300))
				changecurve = 2
			elseif changecurve == 2 then
				tblua:RandomArea()
				tblua:Sleep(math.random(700, 1200))
				changecurve = 1
			else
				tblua:CircleArea()
				tblua:Sleep(math.random(100, 300))
				changecurve = 2
				end
		end
		return move
    end
end

------------------------------------------------------------------------------------------------
--------------------------------Switching Tems to TV Train Functions----------------------------
------------------------------------------------------------------------------------------------

function Welcome()
	tblua:Sleep(math.random(20, 100))
	tblua:TestMessage("Nessla Self-Heal TV Trainer Script by Scriptchacho\nPlease report any Bugs to Muchacho13#0901 on Discord")
	tblua:Sleep(math.random(20, 100))
	tblua:TestMessage("Next up are your Settings. If something is wrong, stop the script by pressing F2 and check your Settings at the top of the script!")
	tblua:Sleep(math.random(20, 100))
	if notifications == 1 then
		tblua:Sleep(math.random(20, 100))
		tblua:TestMessage("Movement: " .. WelcomeMovement() .. "\nLuma Option: " .. WelcomeLuma() .. "\nNumber of Tems to train: " .. tostring(tems + cloak) .. "\nAmount of kills per Tem: " .. tostring(temstokill) .. "\nYou turned Telegram Status Notifications ON!")
	else
		tblua:Sleep(math.random(20, 100))
		tblua:TestMessage("\nNumber of Tems to train: " .. tostring(tems + cloak) .. "\nAmount of kills per Tem: " .. tostring(temstokill) .. "\nYou turned Telegram Status Notifications OFF!")	
	end
	if cloak == 1 then
		if proteins == 1 then
			tblua:Sleep(math.random(20, 100))
			tblua:TestMessage("You have Proteins equipped on your first Tem and Cowards Cloak on your last Tem")
		else
			tblua:Sleep(math.random(20, 100))
			tblua:TestMessage("You have equipped Cowards Cloak on your last Tem but no Proteins on your first Tem")
		end
	else
		if proteins == 1 then
			tblua:Sleep(math.random(20, 100))
			tblua:TestMessage("You have Proteins equipped on your first Tem but no Cowards Cloak on your last Tem")
		else
			tblua:Sleep(math.random(20, 100))
			tblua:TestMessage("You have chosen to not use any gear for your TV Training")
		end
	end
	tblua:Sleep(math.random(20, 100))
	tblua:TestMessage("If everything is fine, you can start the Script by clicking OK now! \n\nHave Fun!!!")
end

function WelcomeMovement()
	if movement == 1 then
		return "Up/Down Delay"
	elseif movement == 2 then
		return "Curved Movement"
	elseif movement == 3 then
		return "Maevement"
	elseif movement == 4 then
		return "Left/Right Delay"
	end
end

function WelcomeLuma()
	if movement == 1 then
		return "Wait on Luma"
	elseif movement == 2 then
		return "Disconnect on Luma"
	elseif movement == 3 then
		return "Only throwing Cards on Luma"
	end
end

function SwitchOutTem(count, vmnr)
	local switchout = count + 1
	tblua:SendTelegramMessage("-----------------------------------------------------")	
	tblua:Sleep(math.random(500, 1000))					
	tblua:SendTelegramMessage("Message from VM: " .. vmnr)	
	tblua:Sleep(math.random(500, 1000))
	tblua:SendTelegramMessage("This Tem is done TV Training, remaining Tem: " .. tostring(count))
	tblua:Sleep(math.random(705, 1594))
	tblua:PressKey(0x55)
	tblua:Sleep(math.random(705, 1594))
	tblua:PressKey(0x58)
	tblua:Sleep(math.random(705, 1594))
	while switchout > 0
	do
		tblua:PressKey(0x53)
		tblua:Sleep(math.random(705, 1594))	
		switchout = switchout - 1
	end
	tblua:PressKey(0x46)
	tblua:Sleep(math.random(705, 1594))
	tblua:PressKey(0x1B)
	tblua:Sleep(math.random(705, 1594))
end

function SwitchOutTemProteins(count, vmnr)
	local switchout = count + 1
	tblua:SendTelegramMessage("-----------------------------------------------------")	
	tblua:Sleep(math.random(500, 1000))					
	tblua:SendTelegramMessage("Message from VM: " .. vmnr)	
	tblua:Sleep(math.random(500, 1000))
	tblua:SendTelegramMessage("This Tem is done TV Training, remaining Tem: " .. tostring(count))
	tblua:Sleep(math.random(705, 1594))
	tblua:PressKey(0x55)
	tblua:Sleep(math.random(705, 1594))
	tblua:PressKey(0x46)
	tblua:Sleep(math.random(705, 1594))
	tblua:PressKey(0x09)
	tblua:Sleep(math.random(705, 1594))
	tblua:PressKey(0x44)
	tblua:Sleep(math.random(705, 1594))
	tblua:PressKey(0x46)
	tblua:Sleep(math.random(705, 1594))
	tblua:PressKey(0x1B)
	tblua:Sleep(math.random(705, 1594))
	tblua:PressKey(0x58)
	tblua:Sleep(math.random(705, 1594))
	while switchout > 0
	do
		tblua:PressKey(0x53)
		tblua:Sleep(math.random(705, 1594))	
		switchout = switchout - 1
	end
	tblua:PressKey(0x46)
	tblua:Sleep(math.random(705, 1594))
	tblua:PressKey(0x46)
	tblua:Sleep(math.random(705, 1594))
	tblua:PressKey(0x09)
	tblua:Sleep(math.random(705, 1594))
	while tblua:GetPixelColor(853, 230) ~= "0xB1FEFF" or tblua:GetPixelColor(855, 309) ~= "0xB1FEFF" or tblua:GetPixelColor(1006, 194) ~= "0xB1FEFF" or tblua:GetPixelColor(1058, 272) == "0xB1FEFF" or tblua:GetPixelColor(925,279) == "0xB1FEFF" or tblua:GetPixelColor(911,236) == "0xB1FEFF" or tblua:GetPixelColor(966,250) == "0xB1FEFF" or tblua:GetPixelColor(907,288) == "0xB1FEFF"
	do
		tblua:PressKey(0x53)
        tblua:Sleep(math.random(650, 1250))	
	end		
	tblua:PressKey(0x46)
	tblua:Sleep(math.random(705, 1594))
	tblua:PressKey(0x1B)
	tblua:Sleep(math.random(705, 1594))
	tblua:PressKey(0x1B)
	tblua:Sleep(math.random(705, 1594))
end

function StatusNotification(counter, vmnr, killed, remaining)
	if counter > 99 then
		tblua:SendTelegramMessage("-----------------------------------------------------")	
		tblua:Sleep(math.random(500, 1000))					
		tblua:SendTelegramMessage("Message from VM: " .. vmnr)	
		tblua:Sleep(math.random(500, 1000))
		tblua:SendTelegramMessage("Temtem left to TV train: " .. tostring(remaining))
		tblua:Sleep(math.random(500, 1000))
		tblua:SendTelegramMessage("Kills left until next Tem: " .. tostring(killed))
		return 0
	else
		tblua:Sleep(math.random(2, 4000))
		return counter
	end
end

------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
------------------------------------- Start of Script ------------------------------------------
------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
-- Registering the Temtem Window
tblua:RegisterTemTemWindow()
tblua:GetAreaColor()
tblua:Sleep(1000)

if tblua:IsInWorld() == true then
	Welcome()
	while(true)
	do

------------------------------Doing Movement Overworld Actions-----------------------------------
		while tblua:IsInWorld() == true 
		do
			

			
			if temstokill < killedtem then
				tems = tems - 1
				if tems == 0 then
					tblua:SendTelegramMessage("-----------------------------------------------------")	
					tblua:Sleep(math.random(500, 1000))					
					tblua:SendTelegramMessage("Message from VM: " .. vm)	
					tblua:Sleep(math.random(500, 1000))
					tblua:SendTelegramMessage("Script succesfully TV trained all of your Tems! Stopping the script now!")
					tblua:TestMessage("Script succesfully TV trained all of your Tems! Stopping the script now!")
					tblua:PressKey(0x71)
				end
				if proteins == 1 then
				
					SwitchOutTemProteins(tems, vm)
				else
					SwitchOutTem(tems, vm)
				end
				killedtem = 0
				
			else
				MovementSwitch = MainMovement(movement, MovementSwitch)  --Start Movement
			end
		end 
---------------------------- End of Doing Movement Overworld Actions-----------------------------

------------------------------------------Battle Scripts-----------------------------------------
		while tblua:IsInWorld() == false --loop if minimap not detected
		do
			tblua:StopMovement()            
			if tblua:IsInFight() == true then --if bot is in fight
				deadout = MainBattle(LumaOption, vm)
				killedtem = killedtem + deadout
				notificationcounter = notificationcounter + deadout
				tblua:CheckPause()
				tblua:CheckLogout()
				if notifications == 1 then
					notificationcounter = StatusNotification(notificationcounter, vm, temstokill - killedtem, tems)
				else
						tblua:Sleep(math.random(2, 4000))
				end
				MovementSwitch = math.random(2)
			end               
		end
	end
--------------------------------------------End Of Battle Scripts--------------------------------	
else
	MovementSwitch = 0
	tblua:TestMessage("Error: Not ready to start the script")
end

-------------------------------------------------------------------------------------------------

--------------------------------------------- Special Thanks! -----------------------------------
-- NhMarco for creating TemBot and making it possible to create LUA-Scripts
-- Mae for awesome Movement, Vullfy detection and help making these scripts. Mae's Github: https://github.com/MaeBot
-- Slagathor for help with PixelDetection. Slagathor's Github: https://github.com/tyboe2013
-- The whole TemBot Team and the TemBot Community!
