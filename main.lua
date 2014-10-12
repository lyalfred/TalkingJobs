
image = display.newImage("sj.png", 0,0)
image.anchorX=0
image.anchorY=0

sheetData = {
	width=306,
	height=88,
	numFrames=2,
	sheetContentWidth=612,
	sheetContentHeight=88 
	}

mySheet = graphics.newImageSheet( "sjsprite.png", sheetData )

sequenceData = {
	{ name = "animate", start=1, count=2, time=365},
	}

animation = display.newSprite( mySheet, sequenceData )
animation.x = display.contentWidth/2.1
animation.y = display.contentHeight/4.95

local options = {
	text = "Talking",
	x = 65,
	y = 20,
	font = native.systemFontBold,
	fontSize = 24
}
local myText = display.newText( options )
myText.text = "Talking"
local options = {
	text = "Talking",
	x = 245,
	y = 20,
	font = native.systemFontBold,
	fontSize = 24
}
local myText = display.newText( options )
myText.text = "Steve Jobs"

local widget = require( "widget" )

local soundTable = {
	headSound1 = audio.loadSound( "audio/1WHY ARE YOU STILL HERE.wav"  ),
	headSound2 = audio.loadSound( "audio/1I ALREADY FIRED YOU.wav" ),
	chestSound1 = audio.loadSound( "audio/2You psychopathic.mp3"  ),
	chestSound2 = audio.loadSound( "audio/You stole.mp3" ),
	abdomenSound1 = audio.loadSound( "audio/0.5Get Out.wav" ),
	abdomenSound2 = audio.loadSound( "audio/1You gotta put in the hours.wav" ),
	groinSound1 = audio.loadSound( "audio/0.5No.wav" ),
	groinSound2 = audio.loadSound( "audio/1I'm going to sue you.mp3" ),
	legsSound1 = audio.loadSound( "audio/1You're Done.wav" ),
	legsSound2 = audio.loadSound( "audio/1Get your shit and get out.wav" )
}

local numberOfSounds = {
	head = 2,
	chest = 2,
	abdomen = 2,
	groin = 2,
	legs = 2
}

local function handleButtons(event)
	if event.phase ~= "began" then return nil end
	local soundType = ""
	if event.target == head then
	soundType = "head"
	
	elseif event.target == chest then soundType = "chest"
	elseif event.target == abdomen then soundType = "abdomen"
	elseif event.target == groin then soundType = "groin"
	elseif event.target == legs then soundType = "legs"
	else
		print("warning: unknown button pressed")
		return nil
	end
	local selected = math.random(1, numberOfSounds[soundType])
	local file = soundType .. "Sound" .. selected
	animation:play() 
	local tmr;
	tmr = timer.performWithDelay(1500, function(e)
		animation:pause(e.count);
		if(e.count == 10) then
			timer.cancel(tmr)
			tmr = nil
		end
	end,1)
	audio.play(soundTable[file])
end

head = display.newRect(145, 65, 65, 110)
head.isVisible = false
head.isHitTestable = true
head:addEventListener("touch", handleButtons)

chest = display.newRect(140, 168, 145, 90)
chest.isVisible = false
chest.isHitTestable = true
chest:addEventListener("touch", handleButtons)

abdomen = display.newRect(140, 260, 145, 90)
abdomen.isVisible = false
abdomen.isHitTestable = true
abdomen:addEventListener("touch", handleButtons)

groin = display.newRect(130, 345, 140, 70)
groin.isVisible = false
groin.isHitTestable = true
groin:addEventListener("touch", handleButtons)

legs = display.newRect(125, 450, 138, 130)
legs.isVisible = false
legs.isHitTestable = true
legs:addEventListener("touch", handleButtons)





