package com.fugo.shooter;
import browser.display.BitmapData;
import com.fugo.libs.Screen;
import com.fugo.shooter.logic.GameLogic;
import haxe.io.Input;
import nme.Assets;
import nme.display.Bitmap;
import nme.events.Event;
import nme.Lib;
import nme.display.FPS;
/**
 * ...
 * @author Fugo
 */

class GameScreen extends Screen
{

	private var background:ScrollingBackground;
	private var gameLogic:GameLogic;
	
	private var ship:Bitmap;
	private var enemy:Bitmap;
	private var input:InputProcessor;
	public function new() 
	{
		super();
		background = new ScrollingBackground();
		addChild(background);
		
		gameLogic = new GameLogic();
		ship = new Bitmap(Assets.getBitmapData("img/Ships/plane.png"));
		enemy = new Bitmap(Assets.getBitmapData("img/Enemies/enemyPlane.png"));
		
		addChild(ship);
		addChild(enemy);
		input = InputProcessor.instance;
		addChild(input);
		ship.x = gameLogic.player.x;
		ship.y = gameLogic.player.y;
		enemy.x = gameLogic.enemy.x;
		enemy.y = gameLogic.enemy.y;
		
		var fpsLogger:FPS = new FPS(10, 10, 0xffffff);
		addChild(fpsLogger);
	}
	
	override public function onEnterScreen(e:Event):Void 
	{
		super.onEnterScreen(e);
	}
	
	override public function onUpdate(delta:Float):Void 
	{
		super.onUpdate(delta);
		background.update(delta);
		gameLogic.update(delta);
		ship.x = gameLogic.player.x;
		ship.y = gameLogic.player.y;
		enemy.x = gameLogic.enemy.x;
		enemy.y = gameLogic.enemy.y;
	}
	
	override public function onLeaveScreen(e:Event):Void 
	{
		super.onLeaveScreen(e);
	}
	
}