package ctp.haxerpg;

import openfl.events.EventDispatcher;
import openfl.events.KeyboardEvent;

/**
 * ...
 * @author Garrett 'caboosetp' Robertson
 */
class InputController{
	
	//// General Input Variables
	public static var inputUp:Bool;
	public static var inputRight:Bool;
	public static var inputDown:Bool;
	public static var inputLeft:Bool;
	
	public static var inputSelect:Bool;
	public static var inputCancel:Bool;
	
	
	//// Keyboard Control Variables
	public static var keyUp:Int = 38;
	public static var keyRight:Int = 39;
	public static var keyDown:Int = 40;
	public static var keyLeft:Int = 37;
	
	public static var keySelect:Int = 68; // D
	public static var keyCancel:Int = 83; // S
	
	
	//// Keyboard Control Functions
	public static function hookKeyboard(ked:EventDispatcher):Void{
		ked.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
		ked.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
	}
	
	public static function keyDownHandler(ke:KeyboardEvent):Void{
		var kc:Int = ke.keyCode;
		
		// I wish switch worked here, but switch only accepts constants
		if (kc == keySelect)
			inputSelect = true;
		else if (kc == keyCancel)
			inputCancel = true;
		else if (kc == keyUp)
			inputUp = true;
		else if (kc == keyRight)
			inputRight = true;
		else if (kc == keyDown)
			inputDown = true;
		else if (kc == keyLeft)
			inputLeft = true;
	}
	
	public static function keyUpHandler(ke:KeyboardEvent):Void{
		var kc:Int = ke.keyCode;
		
		// I wish switch worked here, but switch only accepts constants
		if (kc == keySelect)
			inputSelect = false;
		else if (kc == keyCancel)
			inputCancel = false;
		else if (kc == keyUp)
			inputUp = false;
		else if (kc == keyRight)
			inputRight = false;
		else if (kc == keyDown)
			inputDown = false;
		else if (kc == keyLeft)
			inputLeft = false;
	}
	
}