



function onCreatePost()
d = 100
if downScroll then d = -100 end

addHaxeLibrary('Conductor')
addHaxeLibrary('ClientPrefs')
addHaxeLibrary('NoteSplash')
addHaxeLibrary('Main')

runHaxeCode([[

var ds = ClientPrefs.downScroll;
Main.fpsVar.visible = false;
for(i in 0...4){
	game.opponentStrums.members[i].origin.set();
	game.playerStrums.members[i].origin.set();
	game.opponentStrums.members[i].offset.set();
	game.playerStrums.members[i].offset.set();
	game.opponentStrums.members[i].scale.set(0.7,0.7);
	game.playerStrums.members[i].scale.set(0.7,0.7);
	//game.opponentStrums.members[i].x = 190+(100*i);
	//game.playerStrums.members[i].x = 730+(100*i);

}
game.iconP1.visible = false;
game.iconP2.visible = false;
game.healthBar.visible = false;
game.healthBarBG.visible = false;
game.timeTxt.visible = false;
game.timeBarBG.visible = false;
game.timeBar.visible = false;
game.scoreTxt.visible = false;
var o = (ClientPrefs.downScroll?1:-1);

for(i in game.unspawnNotes){
	i.extraData.set('endNote',false);
	i.origin.set();
	i.offset.set();
	i.noteSplashDisabled = true;
	if(i.isSustainNote && i.prevNote != null){
		i.extraData.set('endNote',true);


		if(i.prevNote.isSustainNote){
	
			i.prevNote.extraData.set('endNote',false);
		}



		if(!i.prevNote.extraData.get('endNote') && i.prevNote.isSustainNote){
			i.prevNote.scale.y = (Conductor.stepCrochet / 100 * 1.03)*game.songSpeed;

			i.offset.y = -20;
			if(ds){
				i.offset.y = -20;
			}
		}else{
			i.prevNote.scale.y = 0.7;
			i.offset.y = 40;
		}

	}
	i.alpha = 1;

}

for(i in game.notes){
	i.scale.set(0.7,0.7);
	i.scale.set(0.7,0.7);
	i.alpha = 1;
}



]])


end

e = 0.0
function onUpdatePost(elapsed)
e = e + elapsed
runHaxeCode([[

var ds = ClientPrefs.downScroll;
for(i in 0...4){
	game.remove(game.strumLineNotes,true);
	game.add(game.strumLineNotes);
	game.remove(game.strumLineNotes,true);
	game.add(game.strumLineNotes);
}

for(i in game.notes){
	i.alpha = 1;
	if(i.isSustainNote){
		i.offset.y = 15;
			if(ds){
				i.offset.y = 30;
			}
	}
	if(i.extraData.get('endNote')){
		i.updateHitbox();
		i.offset.x += 0;
		i.offset.y = 15+(1*game.songSpeed);
			if(ds){
				i.offset.y = 35-(1*game.songSpeed);
			}
	}
}



]])


end

i = 0


function goodNoteHit(id,d,t,s)

	strum = getPropertyFromGroup('notes',id,'strumTime')

ss = math.abs(strum-getSongPosition()) <= 45 

	if ss and not s then
	color = {'purple 1','blue 1','green 1','red 1'}
	makeAnimatedLuaSprite('splash'..d,'noteSplashes',_G['defaultPlayerStrumX'..d]-80,defaultPlayerStrumY1-60)
	addLuaSprite('splash'..d)
	addAnimationByPrefix('splash'..d,'splash','note splash '..color[d+1],24,false);
	addOffset('splash'..d,'splash',40,45)
	playAnim('splash'..d,'splash',true)
	setObjectCamera('splash'..d,'other')
	i = i+1
	end
	

end
function noteMiss(id,d,t,s)

end