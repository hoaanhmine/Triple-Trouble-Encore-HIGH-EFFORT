function onEvent(n,v1,v2)
	if n == "trigger static" then
		if not lowQuality then
			runTimer('hide',1);
			makeAnimatedLuaSprite('redload','Phase3Static',-250,-150)
			addAnimationByPrefix('redload','redpog','Phase3Static instance ',30,true)
			objectPlayAnimation('redload','redpog',false)
			setScrollFactor('redload', 0, 0);
			scaleObject('redload', 6, 6);
			setObjectCamera('redload', 'other');
			addLuaSprite('redload', true);
		end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'hide' then
		removeLuaSprite('redload', false);
    end
end
