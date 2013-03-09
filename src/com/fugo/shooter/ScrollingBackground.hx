package com.fugo.shooter;
import nme.Assets;
import nme.display.Bitmap;
import nme.display.BitmapData;
import nme.display.Sprite;

/**
 * ...
 * @author Fugo
 */

class ScrollingBackground extends Sprite
{

	private var bgBitmapData:BitmapData;
	private var background1:Bitmap;
	private var background2:Bitmap;
	private var scrollSpeed:Float;
	public function new() 
	{
		super();
		bgBitmapData = Assets.getBitmapData("img/HUD/Background.png");
		background1 = new Bitmap(bgBitmapData);
		background2 = new Bitmap(bgBitmapData);
		scrollSpeed = 100;
		addChild(background1);
		addChild(background2);
		
		background1.x = 0;
		background1.y = 0;
		background2.x = 0;
		background2.y = background1.y - background1.height;
	}
	
	public function update(delta:Float):Void
	{
		background1.y += scrollSpeed * delta;
		background2.y += scrollSpeed * delta;
		
		if (background1.y > background1.height)
		{
			background1.y = background2.y - background1.height;
		}
		if (background2.y > background2.height)
		{
			background2.y = background1.y - background2.height;
		}
	}
}