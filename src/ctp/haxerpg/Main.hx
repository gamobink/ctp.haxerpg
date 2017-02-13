package ctp.haxerpg;

import openfl.display.Sprite;
import openfl.Lib;

/**
 * ...
 * @author Garrett 'caboosetp' Robertson
 */

// Assets:
// openfl.Assets.getBitmapData("img/assetname.jpg");
 
class Main extends Sprite {

	public function new() {
		super();
		
		InputController.hookKeyboard(this);
		
	}

}
