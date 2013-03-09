package com.fugo.libs;
import nme.display.Sprite;
import nme.Lib;
import nme.events.Event;
/**
 * ...
 * @author Fugo
 */

class Game extends Sprite
{

	private var screen:Screen;
	private var desiredWidth:Float= 800;
	private var desiredHeight:Float = 480;
	var lastTimer:Int;
	private  var aspectRatio:Float;
	public function new( desiredWidth:Float = 800, desiredHeight:Float = 480) 
	{
		super();
		#if iphone
		Lib.current.stage.addEventListener(Event.RESIZE, init);
		#else
		addEventListener(Event.ADDED_TO_STAGE, init);
		#end
		this.desiredHeight = desiredHeight;
		this.desiredWidth = desiredWidth;
	}
	
	public function init(e:Event):Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		var stage = Lib.current.stage;
		stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		stage.align = nme.display.StageAlign.TOP_LEFT;
		
		Lib.trace("stage width:" + stage.stageWidth);
		Lib.trace("stage height:" +stage.stageHeight);
		Lib.trace("desiredWidth:" +desiredWidth);
		Lib.trace("desiredHeight:" + desiredHeight);
		
		var stageWidth:Float = cast(stage.stageWidth, Float);
		var stageHeight:Float = cast(stage.stageHeight, Float);
		var myscaleX:Float = stage.stageWidth/desiredWidth;
		var myscaleY:Float = stage.stageHeight/ desiredHeight;
		
		aspectRatio = 1;
		Lib.trace("myscaleX:" + myscaleX);
		Lib.trace("myscaleY:" + myscaleY);
		Lib.trace("myscaleX * desiredHeight " + myscaleX * desiredHeight);
		Lib.trace("myscaleY * desiredWidth " + myscaleY * desiredWidth);
		if (myscaleX * desiredHeight >= stage.stageHeight){
			aspectRatio = myscaleY;
		}
		else if (myscaleY * desiredWidth >= stage.stageWidth){
			aspectRatio = myscaleX;
		}
		
		Lib.trace("aspect ratio:" + aspectRatio);
		lastTimer = Lib.getTimer();
		addEventListener(Event.ENTER_FRAME, update);
	}
	
	public function update(delta:Float):Void {
		var timeNow:Int = Lib.getTimer();
		var delta:Int = timeNow - lastTimer;
		//Lib.trace("delta:" +delta);
		if(screen!=null)
			screen.onUpdate(cast(delta,Float) * 0.001);
		lastTimer = timeNow;
		
	}
	
	public function setScreen(newScreen:Screen):Void {
		Lib.trace("addedEventListener");
		if(screen != null)
			removeChild(screen);
		this.screen = newScreen;
		screen.scaleX = aspectRatio;
		screen.scaleY = aspectRatio;
		addChild(newScreen);
		screen.x = stage.stageWidth / 2 - screen.screenWidth / 2;
		screen.y = stage.stageHeight / 2 - screen.screenHeight / 2;
		Lib.trace("screen width:" + screen.screenWidth);
		Lib.trace("screen height:" + screen.screenHeight);
		Lib.trace("stage width:" + stage.stageWidth);
		Lib.trace("stage height" + stage.stageHeight);
		Lib.trace("screen x:" + screen.x);
		Lib.trace("screen y:" + screen.y);

	}
}