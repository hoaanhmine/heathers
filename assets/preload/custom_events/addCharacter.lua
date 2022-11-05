character = false
charName = ''
x = 400
y = 300
holdTimer = 999999;


function onEvent(n,v,b)
	--debugPrint(n)
	if n == 'addCharacter' then
		x = split(b,',')[1]
		y = split(b,',')[2]
		--debugPrint('added '..v)
		if v == '' then
			--debugPrint('init extra char')
		else
			char(v)
		end




		for i=0,getProperty('unspawnNotes.length') do
			if getPropertyFromGroup('unspawnNotes',i,'noteType') == 'Note '..charName then
				setPropertyFromGroup('unspawnNotes',i,'noAnimation',true)
			end
		end
		for i=0,getProperty('notes.length') do
			if getPropertyFromGroup('notes',i,'noteType') == 'Note '..charName then
				setPropertyFromGroup('notes',i,'noAnimation',true)
			end
		end






	end












end


function char(name)
	charName = name

	character = true
	addHaxeLibrary('Character')
	runHaxeCode("setVar('"..name.."',new Character("..x..","..y..",'"..name.."'));game.add(getVar('"..name.."'));")
	runHaxeCode("Reflect.setProperty(PlayState.instance,'"..name.."',getVar('"..name.."'));")
	runHaxeCode("game.modchartSprites.set('"..name.."',getVar('"..name.."'));")
end


function onUpdate(elapsed)

holdTimer = holdTimer + elapsed;
end

noteyet = false

function onBeatHit()
	if character then

		if holdTimer > stepCrochet * 0.0011 * 7.1 or not noteyet then
			--runHaxeCode("getVar('"..charName.."').specialAnim = false;getVar('"..charName.."').dance();")

		end


	end

end

function opponentNoteHit(id,d,t,s)
if (t == 'Chorus' or t == 'Backers' )and character then
noteyet = true
anim = {'singLEFT','singDOWN','singUP','singRIGHT'}
runHaxeCode("getVar('"..charName.."').playAnim('"..anim[d+1].."',true);getVar('"..charName.."').specialAnim = true;")
holdTimer = 0
end
end

function goodNoteHit(id,d,t,s)
if t == 'Note '..charName and character then
noteyet = true
anim = {'singLEFT','singDOWN','singUP','singRIGHT'}
runHaxeCode("getVar('"..charName.."').playAnim('"..anim[d+1].."',true);getVar('"..charName.."').specialAnim = true;")
holdTimer = 0
end
end


function split (inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end
