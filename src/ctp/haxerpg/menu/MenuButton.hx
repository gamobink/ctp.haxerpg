package ctp.haxerpg.menu;

import openfl.display.Sprite;

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
	
	// Keyboard/Controller Nav for Menu Items
	public var navTop:Sprite;
	public var navRight:Sprite;
	public var navBottom:Sprite;
	public var navLeft:Sprite;

	public function new() {
		display = new Sprite();
	}
	
	public function changeState(newState:Int):Void{
		// Reset Current State
		if (displaySub) {
			display.removeChild(displaySub);
			displaySub = Null;
		}
		
		switch (newState) {
			case IDLE:
				display.addChild(displaySub = displayIdle);
				actionIdle();
			case HOVER:
				dispaly.addChild(displaySub = displayHover);
				actionHover();
			case SELECTED:
				display.addChild(displaySub = displaySelected);
				actionSelected();
			case INACTIVE:
				display.addChild(displaySub = displayInactive);
				actionInactive();
		}
		
		currentState = newState;
		
	}
	
	// Graphic Actions
	public function actionIdle():Void{}
	public function actionHover():Void{}
	public function actionSelected():Void{}
	public function actionInactive():Void{}
	
	// Non Graphic Actions
	public function actionCancel():Void
	
}