function onCreate()
setPropertyFromClass('flixel.FlxG','sound.music.volume',0)
setPropertyFromClass('Main','fpsVar.visible',false)
setProperty('skipCountdown',true)
setProperty('vocals.time',0)

end
function onCreatePost()
setProperty('vocals.volume',0)
setProperty('vocals.time',0)

makeLuaSprite('BG','BG',-589,-170)
addLuaSprite('BG')

makeLuaSprite('reflection','reflection',-239,662-43)
addLuaSprite('reflection')

initLuaShader('reflection')


makeLuaSprite('shadow1','shadow',484,726)
addLuaSprite('shadow1')

makeLuaSprite('shadow2','shadow',877,720)
addLuaSprite('shadow2')


makeLuaSprite('shadow3','shadow',-44.0,726)
addLuaSprite('shadow3')

makeLuaSprite('shadow4','shadow',877,720)
addLuaSprite('shadow4')


makeLuaSprite('spotlight','spotlight',-502,-327)
addLuaSprite('spotlight',true)
setBlendMode('spotlight','multiply')

makeLuaSprite('spotlight2','spotlight2',-502,-327)
addLuaSprite('spotlight2')

c = 1
d = 210
if downscroll then c = -1 end
noteTweenY('0',4,defaultPlayerStrumY0-(d*c),0.01)
noteTweenY('1',5,defaultPlayerStrumY0-(d*c),0.01)
noteTweenY('2',6,defaultPlayerStrumY0-(d*c),0.01)
noteTweenY('3',7,defaultPlayerStrumY0-(d*c),0.01)



triggerEvent('addCharacter','heatherd','-66,74')

setProperty('heatherd.visible',false)
setProperty('gf.visible',false)
setProperty('boyfriend.visible',false)



runHaxeCode('game.getLuaObject("BG").color.hue = 40')

setProperty('camHUD.visible',false)
setProperty('timeTxt.visible',false)
setProperty('timeBarBG.visible',false)
setProperty('timeBar.visible',false)
setProperty('iconP1.visible',false)
setProperty('iconP2.visible',false)
setProperty('healthBar.visible',false)
setProperty('healthBarBG.visible',false)

setTextFont('scoreTxt','cheri.ttf')
setObjectOrder('dadGroup',getObjectOrder('boyfriendGroup'))
setObjectOrder('heatherd',getObjectOrder('gfGroup'))
end

function onSongEnd()

setPropertyFromClass('Main','fpsVar.visible',true)

end
function onBeatHit()
charDan('dad')
charDan('heatherd')
charDan('heatherm')

if curBeat == 31 then
if flashingLights then cameraFlash('camGame','ffffff',0.4,true) end
setProperty('heatherd.visible',true)
setProperty('gf.visible',true)
setProperty('boyfriend.visible',true)
setProperty('spotlight.visible',false)
setProperty('spotlight2.visible',false)
end

if curBeat == 75 then
noteTweenY('0',4,defaultPlayerStrumY0,2*crochet/1000,'elasticOut')
noteTweenY('1',5,defaultPlayerStrumY1,2*crochet/1000,'elasticOut')
noteTweenY('2',6,defaultPlayerStrumY2,2*crochet/1000,'elasticOut')
noteTweenY('3',7,defaultPlayerStrumY3,2*crochet/1000,'elasticOut')
end

if curBeat == 196 then
setProperty('camOther._fxFadeCompleted',true)
if flashingLights then cameraFlash('camOther','ffffff',0.5,true) end
setProperty('spotlight.visible',true)
end

if curBeat == 212 then
setProperty('camGame.visible',false)
end



if curBeat == 213 then
setProperty('camOther._fxFadeCompleted',true)
if flashingLights then cameraFlash('camOther','0x55ff99cc',0.5,true) end
setProperty('camGame.visible',true)
end

if curBeat == 235 then
doTweenAlpha('a','spotlight',0,0.3)
end

if curBeat == 236 then
playAnim('gf','walk')
setProperty('gf.specialAnim',true)
playAnim('heatherd','walk')
doTweenX('walk1','gfGroup',625,crochet*.005)
doTweenY('walk2','gfGroup',148,crochet*.005)
doTweenX('walk3','heatherd',261,crochet*.006)
doTweenY('walk4','heatherd',117,crochet*.006)
end

if curBeat == 241 then
playAnim('gf','danceLeft')
setProperty('gf.specialAnim',false)
end

if curBeat == 242 then
playAnim('heatherd','danceLeft')
end

if curBeat == 292 or curBeat == 293 or curBeat == 392 or curBeat == 395 then
setProperty('camGame._fxFadeCompleted',true)
if flashingLights then cameraFlash('camGame','ffffff',0.5,true) end
end
if curBeat == 396 then
if flashingLights then cameraFlash('camOther','ffffff',0.5,true) end
setProperty('camGame.visible',false)
setProperty('camHUD.alpha',0)
end

end
function onTweenCompleted()


end
function charDan(char)

if getProperty(char..'.animation.curAnim.name') == 'idle' then
	playAnim(char,'idle')
elseif getProperty(char..'.animation.curAnim.name') == 'danceLeft' then
	playAnim(char,'danceRight')
elseif getProperty(char..'.animation.curAnim.name') == 'danceRight' then
	playAnim(char,'danceLeft')
end

if getProperty(char..'.animation.curAnim.name') == 'idle-alt' then
	playAnim(char,'idle-alt')
elseif getProperty(char..'.animation.curAnim.name') == 'danceLeft-alt' then
	playAnim(char,'danceRight-alt')
elseif getProperty(char..'.animation.curAnim.name') == 'danceRight-alt' then
	playAnim(char,'danceLeft-alt')
end
end


function onStepHit()
	if curStep < 128 then
setProperty('camHUD.visible',false)
		syncAnim()
	else
		setProperty('camHUD.visible',true)

	end

end



function onUpdatePost()
setProperty('spotlight.flipX',mustHitSection)
setProperty('spotlight2.flipX',mustHitSection)
setProperty('shadow3.x',getProperty('heatherd.x')-16)
setProperty('shadow3.y',getProperty('heatherd.y')+605)

setProperty('shadow4.x',getProperty('gf.x'))
setProperty('shadow4.y',getProperty('gf.y')+560)

end
function onNoteSpawn(id,d,t,s)
	setPropertyFromGroup('notes',id,'alpha' ,1)
end
function onCountdownTick()
--onBeatHit()
end

function onCountdownStart()
setProperty('vocals.volume',0)
--onBeatHit()
end

function onSongStart()
--onBeatHit()
setProperty('vocals.volume',1)
setProperty('vocals.time',0)
setPropertyFromClass('flixel.FlxG','sound.music.volume',1)
end

function syncAnim()

playAnim('dad','intro',true,false,24*(getSongPosition()/1000))

end