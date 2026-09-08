package;

import flixel.FlxGame;
import openfl.display.Sprite;
import flixel.FlxG;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;

import source.FPS;

class Main extends Sprite
{
	public static var fpsVar:FPS;

	public function new()
	{
		super();

		fpsVar = new FPS(10, 10, 0xFFFFFF);
		addChild(new FlxGame(0, 0, states.MainMenuLOL));
		addChild(fpsVar);

        stage.addEventListener(KeyboardEvent.KEY_DOWN, FullScreen);
	}

    public dynamic function FullScreen(what:KeyboardEvent):Void {
        if (what.keyCode == Keyboard.F11 || what.keyCode == Keyboard.F)
		{
            if (FlxG.fullscreen) {
                FlxG.fullscreen = false;
            } else {
                FlxG.fullscreen = true;
            }
        }
    }
}
