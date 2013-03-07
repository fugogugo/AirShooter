package com.fugo.shooter;

import com.fugo.libs.Game;
import nme.display.Sprite;
import nme.events.Event;
import nme.Lib;

/**
 * ...
 * @author Fugo
 */

class Main extends Game 
{
	
	public function new() 
	{
		super(300, 400);
	}
	
	override public function init(e:Event):Void 
	{
		super.init(e);
		setScreen(new GameScreen());
	}
	
	static public function main() 
	{
		var stage = Lib.current.stage;
		stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		stage.align = nme.display.StageAlign.TOP_LEFT;
		
		Lib.current.addChild(new Main());
	}
	
}
