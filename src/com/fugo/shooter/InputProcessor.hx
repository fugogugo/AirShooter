package com.fugo.shooter;
import com.fugo.shooter.logic.GameLogic;
import nme.display.Sprite;
import nme.events.Event;
import nme.events.KeyboardEvent;
import nme.events.MouseEvent;
import nme.Lib;
import nme.ui.Keyboard;

/**
 * ...
 * @author Fugo
 */

class InputProcessor extends Sprite
{

	private var gameLogic:GameLogic;
	public function new(gameLogic:GameLogic) 
	{		
		super();
		this.gameLogic = gameLogic;
	}
	
	private function init(e:Event):Void
	{
		Lib.trace("key added");
		removeEventListener(Event.ADDED_TO_STAGE, init);
		addEventListener(Event.REMOVED_FROM_STAGE, onRemove);
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
	}
	
	private function onRemove(e:Event):Void
	{
		stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	private function onKeyDown(e:KeyboardEvent):Void
	{
		
	}
	var counter:Int = 0;
	private function onKeyUp(e:KeyboardEvent):Void
	{
		if (e.keyCode == Keyboard.SPACE) {
			Lib.trace("space" + counter);
			counter++;
		}
	}
}