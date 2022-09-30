function onCreate()
	makeLuaSprite('tt_ground', 'tt_ground', -110, -500);
	setLuaSpriteScrollFactor('tt_ground', 1, 1);
	scaleObject('tt_ground', 1.7, 1.7);

	makeLuaSprite('tt_tree_1', 'tt_tree_1', -150, -100);
	setLuaSpriteScrollFactor('tt_tree_1', 0.7, 0.7);
	scaleObject('tt_tree_1', 1.5, 1.2);

	makeLuaSprite('tt_bgm', 'tt_bgm', 0, -300);
	setLuaSpriteScrollFactor('tt_bgm', 0.6, 0.6);
	scaleObject('tt_bgm', 1.2, 1.2);

	makeLuaSprite('tt_tree_2', 'tt_tree_2', -200, -100);
	setLuaSpriteScrollFactor('tt_tree_2', 0.3, 0.3);
	scaleObject('tt_tree_2', 1.2, 1.2);

	makeAnimatedLuaSprite('staticBACKGROUND2','staticBACKGROUND2', -300, -300)addAnimationByPrefix('staticBACKGROUND2','dance','menuSTATICNEW instance ',24,true)
	objectPlayAnimation('staticBACKGROUND2','dance',false)
	setScrollFactor('staticBACKGROUND2', 1, 1);
	scaleObject('staticBACKGROUND2', 2, 2);

	makeLuaSprite('tt_fg', 'tt_fg', -250, -150);
	setLuaSpriteScrollFactor('tt_fg', 0, 0);
	scaleObject('tt_fg', 1.17, 1);

	if not lowQuality then

	makeAnimatedLuaSprite('evil_ring','evil_ring', 300, 200)addAnimationByPrefix('evil_ring','dance','spin',16,true)
	objectPlayAnimation('evil_ring','dance',false)
	setScrollFactor('evil_ring', 0.6, 0.6);
	scaleObject('evil_ring', 0.5, 0.5);

	makeAnimatedLuaSprite('evil_ring2','evil_ring', 500, 175)addAnimationByPrefix('evil_ring2','dance','spin',16,true)
	objectPlayAnimation('evil_ring2','dance',false)
	setScrollFactor('evil_ring2', 0.6, 0.6);
	scaleObject('evil_ring2', 0.5, 0.5);

	makeAnimatedLuaSprite('evil_ring3','evil_ring', 700, 160)addAnimationByPrefix('evil_ring3','dance','spin',16,true)
	objectPlayAnimation('evil_ring3','dance',false)
	setScrollFactor('evil_ring3', 0.6, 0.6);
	scaleObject('evil_ring3', 0.5, 0.5);

	makeAnimatedLuaSprite('evil_ring4','evil_ring', 900, 160)addAnimationByPrefix('evil_ring4','dance','spin',16,true)
	objectPlayAnimation('evil_ring4','dance',false)
	setScrollFactor('evil_ring4', 0.6, 0.6);
	scaleObject('evil_ring4', 0.5, 0.5);

	end

	addLuaSprite('staticBACKGROUND2', false);
	addLuaSprite('tt_tree_2', false);
	addLuaSprite('tt_bgm', false);
	addLuaSprite('evil_ring', false);
	addLuaSprite('evil_ring2', false);
	addLuaSprite('evil_ring3', false);
	addLuaSprite('evil_ring4', false);
	addLuaSprite('tt_tree_1', false);
	addLuaSprite('tt_ground', false);
	addLuaSprite('tt_fg', true);
	
	close(true);
end