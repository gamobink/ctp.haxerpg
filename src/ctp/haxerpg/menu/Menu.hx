package src.ctp.haxerpg.menu;

import ctp.haxerpg.menu.MenuButton;
import openfl.display.Sprite;

/**
 * ...
 * @author Garrett 'caboosetp' Robertson
 */
class Menu {
	
	public var display:Sprite;
	
	public var focus:MenuButton;
	public var defaultFocus:MenuButton;
	
	public var keyDelayMax:Int = 50;
	public var keyDelayCurr:Int = 0;

	public function new() {
		display = new Sprite();
	}
	
	public function update(dt:Int):Void {
		//// Keyboard/Controller Input
		if (focus) {
			if (keyDelayCurr > 0) {
				keyDelayCurr -= dt;
			} else {
				if (InputController.keySelect)
					focus.actionSelected();
				else if (InputController.keyCancel)
					focus.actionCancel();
				else if (InputController.keyUp && focus.navTop)
					setFocus(focus.navTop);
				else if (InputController.keyRight && focus.navRight)
					setFocus(focus.navRight);
				else if (InputController.keyDown && focus.navBottom)
					setFocus(focus.navDown);
				else if (InputController.keyLeft && focus.navLeft)
					setFocus(focus.navLeft);
			}
		}
		
	}
	
	public function setFocus(button:MenuButton) {
		if (focus != button) {
			keyDelayCurr = keyDelayMax;
			// Unselect currnet focus
			if (focus != null)
				focus.actionIdle();
			// Set new focus
			focus = button;
			if (button != null)
				button.actionSelected;
		}
	}
	
	public function addButton(button:MenuButton) {
		addChild(button.display);
		if (defaultFocus == null)
			defaultFocus = button;
	}
	
	
}