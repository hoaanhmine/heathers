function onCreate()

for i=0,getProperty('unspawnNotes.length') do
	if getPropertyFromGroup('unspawnNotes',i,'noteType') == 'Backers' then
		setPropertyFromGroup('unspawnNotes',i,'noAnimation',true)
	end
end

end


function opponentNoteHit(id,d,t,s)
if t == 'Backers' then
anim = {'singLEFT','singDOWN','singUP','singRIGHT'}
playAnim('gf',anim[d+1],true)
setProperty('gf.holdTimer',0)
triggerEvent('Screen Shake','0.1,0.002')
triggerEvent('Add Camera Zoom','0.015,0.015')
holdTimer = 0
setProperty('camGame.scroll.x',getProperty('camGame.scroll.x')+50)
end
end