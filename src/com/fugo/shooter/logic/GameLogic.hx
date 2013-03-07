package com.fugo.shooter.logic;

/**
 * ...
 * @author Fugo
 */

class GameLogic 
{

	public var player:Ship;
	public var enemy:Enemy;
	
	public function new() 
	{
		this.player = new Ship(0);
		this.enemy = new Enemy(1);
		player.x = 200;
		player.y = 300;
		
		enemy.x  = 200;
		enemy.y = -100;
	
	}
	
	public function update(delta:Float):Void
	{
		player.update(delta);
		enemy.update(delta);
	}
}