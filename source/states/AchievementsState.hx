package states;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;

class AchievementsState extends FlxState {
    private var curSelected:Int = 0;

    override public function create():Void {
        super.create();
    }

    override public function update(elapsed:Float):Void {
        // Controls
        if (FlxG.keys.justPressed.ESCAPE) {
            FlxG.switchState(new states.MainMenuLOL());
        }
        if (FlxG.keys.justPressed.ENTER) {
            //do smth
        }

        super.update(elapsed);
    }
}