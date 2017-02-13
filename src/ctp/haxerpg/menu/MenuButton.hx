package ctp.haxerpg.menu;

import openfl.display.Sprite;
import src.ctp.haxerpg.menu.Menu;

/**
 * ...
 * @author Garrett 'caboosetp' Robertson
 */
class MenuButton {
	
	// Valid States
	public static var IDLE = 0;
	public static var HOVER = 1;
	public static var SELECTED = 2;
	public static var INACTIVE = 3;
	
	// Display Graphics
	public var display:Sprite;
	public var displaySub:Sprite;
	
	public var displayIdle:Sprite;
	public var displayHover:Sprite;
	public var displaySelected:Sprite;
	public var displayInactive:Sprite;
	 
	// Current State - Controls sub displays, calls actions
	public var currentState:Int;
	
	// Actions
	public function actionIdle:Action;
	public function actionHover:Action;
	public function actionSelected:Action;
	public function actionInactive:Action;
	public function actionCancel:Action;
	
	
	// Keyboard/Controller Nav for Menu Items
	public var navTop:MenuButton;
	public var navRight:MenuButton;
	public var navBottom:MenuButton;
	public var navLeft:MenuButton;

	public function new() {
		display = new Sprite();
	}
	
	public function changeState(newState:Int):Void{
		// Reset Current State
		if (displaySub) {
			display.removeChild(displaySub);
			displaySub = Null;
		}
		
		// No, switch doesn't work here in haxe
		if (newState == IDLE) {
				display.addChild(displaySub = displayIdle);
				actionIdle.fire();
		} else if(newstate == HOVER) {
				dispaly.addChild(displaySub = displayHover);
				actionHover.fire();
		} else if(newstate == SELECTED) {
				display.addChild(displaySub = displaySelected);
				actionSelected.fire();
		} else if(newstate == INACTIVE) {
				display.addChild(displaySub = displayInactive);
				actionInactive.fire();
		}
		
		currentState = newState;
		
	}
	
}