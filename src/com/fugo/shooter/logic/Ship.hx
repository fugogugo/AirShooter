package com.fugo.shooter.logic;
import nme.geom.Vector3D;
/**
 * ...
 * @author Fugo
 */

class Ship extends Entity
{

	public inline static var LEFT:Int = 0;
	public inline static var RIGHT:Int = 1;
	public inline static var IDLE:Int = 2;
	
	private var bulletTimer:Float;
	private var coolDown:Float;
	private var moveTo:Int;
	private var speed:Vector3D;
	public function new(id:Int) 
	{
		super(id);
		coolDown = 0.3;
		bulletTimer = 0;
		moveTo = IDLE;
		
		speed = new Vector3D(100, 0, 0, 0);
	}
	
	public function move(moveTo:Int):Void {
		this.moveTo = moveTo;
	}
	
	public function timeToShoot():Bool
	{
		if (bulletTimer <= 0) {
			bulletTimer = coolDown;
			return true;
		}
		return false;
	}
	public function update(delta:Float):Void
	{
		if (bulletTimer > 0) {
			bulletTimer -= delta;
		}
		switch(moveTo) {
			case LEFT: x -= speed.x * delta; 
			case RIGHT: x += speed.x * delta; 
		}
	}
}