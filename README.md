# Nessla-Self-Heal-TV-Trainer
TV Trainer to train your new Tems

##### Main Features:
- [x] Switches automatically to the next Tem
- [x] 3 Luma Options available
- [x] 4 Movement Options
- [x] Uses Nessla with Lure and Chain Lightning to heal by itself
- [x] Automatically changing Proteins Gear to double the speed of TV Training
- [x] Uses Cowards Cloak (only last Tem, no Switching to another Tem for now
- [x] Telegram Status notifications: Kill Count, Amount of Tems left to train, Luma Notification)


##### To-Do:
- [ ] Update Movements (Movements are kinda bad for now, waiting for an update from TemBot)
- [ ] Bug Fixes
- [ ] more Luma Options
- [ ] Cleaner Scripting
- [ ] More customization Options (Custom Sleep and Waiting Times and more)
- [ ] you tell me what to add...

## Preparation and Requirements
##### Mandatory:
- Nessla with Electrsynthesis, Lure equipped and Chain Lightning as first move
- Nessla needs to be the second Tem to get hit by Chain Lightning
- at least 1 Tem that needs to be trained on first spot
- TV trained Tem needs to have a super cheap first move that can be used every round

##### Recommended:
- LVL 58 Nessla with max Stats
- 99 TemCards in case you use throwing Cards on Luma
- Proteins on first Tem and Cowards Cloak on last one
- A Spot with a 100% encounter rate of the same Tem

## LUA Settings
You have the option to change a few Settings inside the LUA. These are found directly on top of the script:

##### Movement Options
   1. Up/Down - Unsafe Movement
   2. Curved Movement - Does a curve when changing directions
   3. Maevement - A Mix between Random, Circle and Curved Movements
   4. Left/Right - Unsafe Movement
   
##### Luma Options
   1. Wait on Luma - Stops the script and waits for User input
   2. Disconnect on Luma - Stops the script and closes the game
   3. Throwing Cards on Luma - Throwing cards until Luma is caught and continues the script
   
##### Number of Tems to train TV
   - You have to change the number according to the Temtems you want to TV train
   - min 1, max 5
   
##### Number of enemies to kill for desired TV
   - This is the amount of kills that your Tem needs to get the desired TV
   - max should be 500 when using no Proteins, 250 if you use Proteins

##### Your VM Name or Number
   - This is only for Telegram notification if you have multiple VM's to know which VM found a Luma
   - Set the Name your VM is called, needs to be inside the "", for example `vm = "TemBot VM Nr 3"`
   
##### Continuous Notifications to Telegram
   - Set this to '1' if you wish to get every now and then a Status Notification on Telegram 
   
##### Using Proteins as Gear?
   - Set this to '1' if you have your first Temtem equipped with Proteins
   - You need to unequip everything else on all other Tem except Nessla and the last Tem if you use Cowards Cloak
      
##### Using Cowards Cloak as Gear?
   - Set this to '1' if you have the last Tem equipped with the Cowards Cloak
   
## How-To

##### 1. Download the Script
   You can Download the latest release [here](https://github.com/Muchacho13Scripts/Nessla-Self-Heal-TV-Trainer/releases/latest)
   
   Click on 'Assets' and download the LUA file
   
   ![alt text](https://github.com/Muchacho13Scripts/KisiwaDesertScript/blob/master/img/downloadLUA.png?raw=true)

##### 2. Start TemBot

##### 3. Edit your Settings in 'Main Settings' and 'Misc Settings'
   Check these Screenshots:
   
   ![alt text](https://github.com/Muchacho13Scripts/KisiwaDesertScript/blob/master/img/settings1.png?raw=true)
   
   ![alt text](https://github.com/Muchacho13Scripts/KisiwaDesertScript/blob/master/img/settings2.png?raw=true)

##### 4. Load up the LUA Script
   Click on 'Load File' and open the downloaded LUA File
   
   ![alt text](https://github.com/Muchacho13Scripts/KisiwaDesertScript/blob/master/img/loadLUA.png?raw=true)

##### 5. Change Settings in LUA Script to your liking
   Check 'LUA Settings' in this ReadMe for more information
   
   You may have to scroll down a bit to see all Settings
   
   ![alt text](https://github.com/Muchacho13Scripts/KisiwaDesertScript/blob/master/img/LUASettings.png?raw=true)
   
##### 6. Start TemTem and move to the desired Spot
   Start here:
   
   ![alt text](https://github.com/Muchacho13Scripts/KisiwaDesertScript/blob/master/img/startlocation.png?raw=true)
   
##### 7. Start the Script and check your Settings 
   Default Button to start is 'F3'
   
   Stop the Script with 'F2'

## Changelog

##### V1 - Initial GitHub Release

## Donations
If you like my work you can consider a small donation for a beer [here](https://www.paypal.me/scriptchacho)


## Bug Reporting
If you find any bugs report them here (I still need to figure out how GitHub works) or send a message on Discord: Muchacho13#0901

## Special Thanks
- NhMarco for creating TemBot and making it possible to create LUA-Scripts
- Mae for awesome Movement, Vullfy detection and help making these scripts. Mae's Github: https://github.com/MaeBot
- Slagathor for help with PixelDetection. Slagathor's Github: https://github.com/tyboe2013
- The whole TemBot Team and the TemBot Community!
