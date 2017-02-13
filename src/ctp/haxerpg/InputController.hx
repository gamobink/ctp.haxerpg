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
		switch(ke.keyCode) {
			case keyUp:
				inputUp = true;
			case keyRight:
				inputRight = true;
			case keyDown:
				inputDown = true;
			case keyLeft:
				inputLeft = true;
			case keySelect:
				inputSelect = true;
			case keyCancel:
				inputCancel = true;
		}
	}
	
	public function keyUpHandler(ke:KeyboardEvent):Void{
		switch(ke.keyCode) {
			case keyUp:
				inputUp = false;
			case keyRight:
				inputRight = false;
			case keyDown:
				inputDown = false;
			case keyLeft:
				inputLeft = false;
			case keySelect:
				inputSelect = false;
			case keyCancel:
				inputCancel = false;
		}
		
	}
	
}