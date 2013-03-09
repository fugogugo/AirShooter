package com.fugo.libs;
import nme.display.Sprite;
import nme.events.Event;
/**
 * ...
 * @author Fugo
 */

class Screen extends Sprite
{
	public var screenWidth(default, null):Float;
	public var screenHeight(default, null):Float;
	private function new(screenWidth:Float, screenHeight:Float) {
		super();
		this.screenWidth = screenWidth;
		this.screenHeight = screenHeight;
		addEventListener(Event.ADDED_TO_STAGE, onEnterScreen);
	}
	
	private function getWidth():Float 
	{
		return 0;
	}
	private function setWidth(newWidth:Float):Void
	{
		
	}
	public function onEnterScreen(e:Event):Void {
		removeEventListener(Event.REMOVED_FROM_STAGE, onEnterScreen);
		addEventListener(Event.REMOVED_FROM_STAGE, onLeaveScreen);
		this.screenWidth *= scaleX;
		this.screenHeight *= scaleY;
	}
	public function onLeaveScreen(e:Event):Void {
		removeEventListener(Event.REMOVED_FROM_STAGE, onLeaveScreen);
		addEventListener(Event.ADDED_TO_STAGE, onEnterScreen);
	}
	public function onUpdate(delta:Float):Void {
		
	}
}