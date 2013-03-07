package com.fugo.libs;
import nme.display.Sprite;
import nme.events.Event;
/**
 * ...
 * @author Fugo
 */

class Screen extends Sprite
{
	private function new() {
		super();
		addEventListener(Event.ADDED_TO_STAGE, onEnterScreen);
		
	}
	public function onEnterScreen(e:Event):Void {
		removeEventListener(Event.REMOVED_FROM_STAGE, onEnterScreen);
		addEventListener(Event.REMOVED_FROM_STAGE, onLeaveScreen);
	}
	public function onLeaveScreen(e:Event):Void {
		removeEventListener(Event.REMOVED_FROM_STAGE, onLeaveScreen);
		addEventListener(Event.ADDED_TO_STAGE, onEnterScreen);
	}
	public function onUpdate(delta:Float):Void {
		
	}
}