package com.fugo.shooter.logic;
import nme.geom.Vector3D;
/**
 * ...
 * @author Fugo
 */

class Enemy extends Entity
{

	public inline static var RED_TYPE:Int = 1;
	private var speed:Vector3D;
	public var type(default, null):Int;
	public function new(id:Int) 
	{
		super(id);
		speed = new Vector3D(0, 100, 0, 0);
		type = RED_TYPE;
	}
	
	public function update(delta:Float):Void
	{
		this.y += speed.y * delta;
	}
}