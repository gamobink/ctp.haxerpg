package src.ctp.haxerpg.menu;

import ctp.haxerpg.menu.MenuButton;
import openfl.display.Sprite;

/**
 * ...
 * @author Garrett 'caboosetp' Robertson
 */
class Menu {
	
	public var display:Sprite = new Sprite();;
	
	public var buttonList:Array<MenuButton> = new Array<MenuButton>();
	
	public var focus:MenuButton = null;
	public var defaultFocus:MenuButton = null;
	
	public var keyDelayMax:Int = 50;
	public var keyDelayCurr:Int = 0;

	public function new() {
		
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
	
	public function addButton(button:MenuButton):Void {
		addChild(button.display);
		buttonList.push(button);
	}
	
	public function addButtonsH(buttons:Array<MenuButton>) {
		// Case, No Buttons
		if (buttons == null || buttons.length == 0)
			throw "Can not add empty list of buttons";
		addButton(buttons[0]);
		// Case, 1 button
		if (buttons.length == 1)
			return;
		// Case, 2 buttons
		if (buttons.length == 2) {
			addButton(buttons[1]);
			buttons[0].navRight = buttons[1];
			buttons[1].navLeft = buttons[0];
		} else {
		// Case 3+ buttons
			var i:Int = 1;
			while (i < buttons.length - 1) {
				addButton(buttons[i]);
				buttons[i - 1].navRight = buttons[i];
				buttons[i].navLeft = buttons[i - 1];
				buttons[i].navRight = buttons[i + 1];
				buttons[i + 1].navLeft = buttons[i];
			}
			addButton(buttons[buttons.length]);
		}
	}
	
	public function addButtonsV(buttons:Array<MenuButton>) {
		// Case, No Buttons
		if (buttons == null || buttons.length == 0)
			throw "Can not add empty list of buttons";
		addButton(buttons[0]);
		// Case, 1 button
		if (buttons.length == 1)
			return;
		// Case, 2 buttons
		if (buttons.length == 2) {
			addButton(buttons[1]);
			buttons[0].navDown = buttons[1];
			buttons[1].navTop = buttons[0];
		} else {
		// Case 3+ button
			var i:Int = 1;
			while (i < buttons.length - 1) {
				addButton(buttons[i]);
				buttons[i - 1].navDown = buttons[i];
				buttons[i].navTop = buttons[i - 1];
				buttons[i].navDown = buttons[i + 1];
				buttons[i + 1].navTop = buttons[i];
			}
			addButton(buttons[buttons.length]);
		}
	}
	
	public function removeButton(button:MenuButton, fixNav:Bool=true):Void {
		var index = buttonList.indexOf(button);
		if (index == -1)
			throw "Button can not be removed as it is not in the menu.";
		// Fix Navigation Holes
		if (fixNav) {
			if (button.navLeft)
				button.navLeft.navRight = button.navRight;
			if (button.navRight)
				button.navRight.navLeft = button.navLeft;
			if (button.navTop)
				button.navTop.navBottom = button.navBottom;
			if (button.navBottom)
				button.navBottom.navTop = button.navTop;
		}
	}
	
}