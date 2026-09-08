package states;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.tweens.misc.ColorTween;
import Option;

class OptionsState extends FlxState {

    private var curSelected:Int = 0;
    private var curOption:Option = null;
    private var Options:Array<String> = [
        "Fullscreen",
        "FPS",
    ];

    private var optionTexts:Array<FlxText> = [];
    private var optionText:FlxText;
    private var descriptionTxt:FlxText;
    private var descriptionBG:FlxText;
    private var title:FlxText;

    override public function create():Void {
        super.create();
    }

    override public function update(elapsed:Float):Void {

        // Controls
        if (FlxG.keys.justPressed.ESCAPE) {
            FlxG.switchState(new states.MainMenuLOL());
        } else if (FlxG.keys.justPressed.ENTER) {
            onConfirm();
        }

        if (FlxG.keys.justPressed.UP) {
            trace("Pressed UP");
        } else if (FlxG.keys.justPressed.DOWN) {
            trace("Pressed DOWN");
        }

        super.update(elapsed);
    }

    private function onRefresh():Void
    {

    }

    private function onConfirm():Void
    {

    }
}