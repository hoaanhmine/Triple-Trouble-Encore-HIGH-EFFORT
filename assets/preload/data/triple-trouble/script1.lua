local followchars = true;
local allowCountdown = false;
function onCreate()

    makeLuaSprite('black', 'black', 0,0)
    setObjectCamera('black', 'camother')
    addLuaSprite('black', false)

    makeLuaSprite('circle', 'CircleTripleTrouble', 1280,0)
    setObjectCamera('circle', 'camother')
    addLuaSprite('circle', true)

    makeLuaSprite('text', 'TextTripleTrouble', -1280,0)
    setObjectCamera('text', 'camother')
    addLuaSprite('text', true)

end

function onSongStart()
    doTweenX('circlemove', 'circle', 0, 1, 'linear')
    doTweenX('textmove', 'text', 0, 1, 'linear')
end

function onCountdownTick(counter)
    if counter == 0 then
        playSound('intro3', 1)
    end
    if counter == 1 then
        setProperty('countdownReady.x', -5000);
        playSound('intro2', 1)
    end
    if counter == 2 then
        setProperty('countdownSet.x', -5000);
        playSound('intro1', 1)
    end
    if counter == 3 then
        setProperty('countdownGo.x', -5000);
        playSound('introGo', 1)
    end
end

function onTweenCompleted(tag)

    if tag == 'circlemove' then
        runTimer('wait', 0.5, 1)
    end
end

function onTimerCompleted(tag)

	if tag == 'wait' then
        doTweenAlpha('circlealpha', 'circle', 0, 1, 'linear')
        doTweenAlpha('textalpha', 'text', 0, 1, 'linear')
        doTweenAlpha('blackalpha', 'black', 0, 1, 'linear')
    end
end

function onEndSong()
    if isStoryMode and not seenCutscene then
        startVideo('youcantruncutscene2')
        seenCutscene = true
        return Function_Stop
    end
    return Function_Continue
end

function onUpdate()
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end

local campointx = 0
local campointy = 0
local bfturn = false
local camMovement = 10
local velocity = 5

function onMoveCamera(focus)
	if focus == 'boyfriend' then
	campointx = getProperty('camFollow.x')
	campointy = getProperty('camFollow.y')
	bfturn = true
	
	elseif focus == 'dad' then
	campointx = getProperty('camFollow.x')
	campointy = getProperty('camFollow.y')
	bfturn = false
	setProperty('cameraSpeed', 0)
	
	end
end


function goodNoteHit(id, direction, noteType, isSustainNote)
	if bfturn then
		if direction == 0 then
			setProperty('camFollow.x', campointx - camMovement)
		elseif direction == 1 then
			setProperty('camFollow.y', campointy + camMovement)
		elseif direction == 2 then
			setProperty('camFollow.y', campointy - camMovement)
		elseif direction == 3 then
			setProperty('camFollow.x', campointx + camMovement)
		end
		setProperty('cameraSpeed', velocity)
	end	
end

		-- delete this if you dont want the oponent to move the camera
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if not bfturn then
		if direction == 0 then
			setProperty('camFollow.x', campointx - camMovement)
		elseif direction == 1 then
			setProperty('camFollow.y', campointy + camMovement)
		elseif direction == 2 then
			setProperty('camFollow.y', campointy - camMovement)
		elseif direction == 3 then
			setProperty('camFollow.x', campointx + camMovement)
		end
		setProperty('cameraSpeed', velocity)
	end	
end
function onUpdatePost()
 setProperty("iconP1.scale.y", (getProperty("iconP1.scale.y") - 1) / -0.75 + 1)
 setProperty("iconP2.scale.y", (getProperty("iconP2.scale.y") - 1) / -0.55 + 1)
 setProperty("iconP1.y", -50 + (getProperty("iconP1.scale.y") * 75))
 setProperty("iconP2.y", -50 + (getProperty("iconP2.scale.y") * 75))
end

local gfSpeed = 1;

function onBeatHit()

	if (curBeat % gfSpeed == 0) then
		if curBeat % (gfSpeed * 2) == 0 then
			setProperty('iconP1.scale.x', 1.8 );
			setProperty('iconP1.scale.y', 1.8 );
			setProperty('iconP2.scale.x', 0.0 );
			setProperty('iconP2.scale.y', 0.0 );

			setProperty('iconP1.angle', -30);
			setProperty('iconP2.angle', 0);
		else
			setProperty('iconP1.scale.x', 2.0 );
			setProperty('iconP1.scale.y', 2.1 );
			setProperty('iconP2.scale.x', 0.0 );
			setProperty('iconP2.scale.y', 0.0 );

			setProperty('iconP2.angle', 0);
			setProperty('iconP1.angle', 0);
		end

	end

end

function onUpdate()

    if (getProperty('iconP1.angle') >= 0) then
	    if ('iconP1.angle' ~= 0) then
    	    setProperty('iconP1.angle', getProperty('iconP1.angle')-1);
    	end
    else
        if ('iconP1.angle' ~= 0) then
    	    setProperty('iconP1.angle', getProperty('iconP1.angle')+1);
    	end
    end

    if (getProperty('iconP2.angle') >= 0) then
	    if ('iconP2.angle' ~= 0) then
    	    setProperty('iconP2.angle', getProperty('iconP2.angle')-1);
    	end
    else
        if ('iconP2.angle' ~= 0) then
    	    setProperty('iconP2.angle', getProperty('iconP2.angle')+1);
    	end
    end

end