package;

import haxe.macro.Compiler.DefineDescription;
import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.FlxCamera;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import flixel.util.FlxColor;

typedef Data = {
    Name: String,
    Description: String,
    Unlocked: Bool
}

class AchievementsHandler extends FlxState {
    public static var Achievements:Map<String, Bool> = new Map<String, Bool>();

    //pOPup
    private var bg:FlxSprite;
    private var name:String;
    private var description:String;

    public static function unlockAchievement(name:String):Void {
        Achievements.set(name, true);
    }

    public function new() {
        super();

        var bg = new FlxSprite();
        bg.makeGraphic(200, 50, FlxColor.BLACK);
        bg.alpha = 0.5;
        bg.scrollFactor.set(0, 0);
        add(bg);

        var name = new FlxText(10, 10, 180, "Achievement Unlocked!");
        name.setFormat(null, 16, FlxColor.WHITE, "center");
        name.scrollFactor.set(0, 0);
        add(name);

        var description = new FlxText(10, 30, 180, description);
        description.setFormat(null, 14, FlxColor.WHITE, "center");
        description.scrollFactor.set(0, 0);
        add(description);
    }
}