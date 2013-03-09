package com.fugo.shooter.logic;
import nme.Lib;
import nme.ui.Keyboard;

/**
 * ...
 * @author Fugo
 */

class GameLogic 
{

	public var player:Ship;
	public var enemy:Enemy;
	
	public var shooting(default, default):Bool;
	public function new() 
	{
		this.player = new Ship(0);
		this.enemy = new Enemy(1);
		player.x = 200;
		player.y = 300;
		
		enemy.x  = 200;
		enemy.y = -100;
		shooting = false;
	}
	
	public function update(delta:Float):Void
	{
		player.update(delta);
		enemy.update(delta);
		
		if (shooting && player.timeToShoot())
		{
			Lib.trace("pew");
		}
	}
	
}