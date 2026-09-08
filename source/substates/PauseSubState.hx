package substates;

import flixel.math.FlxRandom;
import flixel.FlxSubState;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxSprite;
import lime.system.System;

class PauseSubState extends FlxSubState {

    private var curSelected = 0;
    private var optionMap:Array<String> = [
        "Resume",
        "Achievements",
        "Options",
        "Exit to Main Menu",
        "Exit to Desktop",
    ];

    private var tipsList:Array<String> = [
        "WE ARE TEFS",
    ];

    private var bg:FlxSprite;
    private var title:FlxText;
    private var optionTexts:Array<FlxText> = [];
    private var optionText:FlxText;
    private var tipText:FlxText;

    private var defaultOptionSize:Int = 40;
    private var optionSizeMult:Int = 1;

    override public function create():Void {
        super.create();

        bg = new FlxSprite(0, 0);
        bg.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
        bg.screenCenter();
        bg.alpha = 0.5;
        add(bg);

        title = new FlxText(FlxG.width / 2 + 375, FlxG.height / 2 - 350,  300, "Paused!");
        title.setFormat("assets/fonts/Comic Sans MS.ttf", 60, 0xFFFFFFFF, "center");
        add(title);

        tipText = new FlxText(0, 0, 0, null);
        add(tipText);

        for (i in 0...optionMap.length) 
        {
            var optionText = new FlxText(FlxG.width / 2, FlxG.height / 2 - 150 + i * 70, 500, optionMap[i]);
            optionText.setFormat("assets/fonts/Comic Sans MS.ttf", defaultOptionSize, 0xFFFFFFFF, "center");
            optionText.font = "assets/fonts/Comic Sans MS.ttf";
            optionText.screenCenter(X);
            add(optionText);
            optionTexts.push(optionText);
        }
        refresh();
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        // Controls
        if (FlxG.keys.justPressed.ESCAPE) {
            close();
        } else if (FlxG.keys.justPressed.ENTER || FlxG.keys.justPressed.SPACE) {
            onSelect();
        }

        if (FlxG.keys.justPressed.UP || FlxG.keys.justPressed.W) {
            changeItem(-1);
        } else if (FlxG.keys.justPressed.DOWN || FlxG.keys.justPressed.S) {
            changeItem(1);
        }

        if (FlxG.mouse.justMoved) {
            onHover();
        } else if (FlxG.mouse.justPressed) {
            onClick();
        }
    }

	function changeItem(huh:Int = 0)
	{
        curSelected += huh;
        
        if (curSelected >= optionMap.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = optionMap.length - 1;

        refresh();
    }

    private function onHover():Void {
        for (i in  0...optionTexts.length) {
            if (FlxG.mouse.overlaps(optionTexts[i], FlxG.camera)) {
                curSelected = i;
                refresh();
            }
        }
    }

    private function onClick():Void {
        for (i in  0...optionTexts.length) {
            if (FlxG.mouse.overlaps(optionTexts[i], FlxG.camera)) {
                onSelect();
                refresh();
            }
        }
    }

    private function refresh():Void {
        for (i in 0...optionTexts.length) {
            if (i == curSelected) {
                optionTexts[i].size = defaultOptionSize + optionSizeMult;
                optionTexts[i].color = 0xFFFFFF00;
                optionTexts[i].alpha = 1;
            } else {
                optionTexts[i].size = defaultOptionSize + optionSizeMult;
                optionTexts[i].color = 0xFFFFFFFF;
                optionTexts[i].alpha = 0.7;
            }
        }
    }

    private function onSelect():Void {
        switch (curSelected) {
            case 0: // Resume
                close();
            case 1: // Achievements
                FlxG.switchState(new states.AchievementsState());
            case 2: // Options
                FlxG.switchState(new states.OptionsState());
            case 3: // Quit to menu
                FlxG.switchState(new states.MainMenuLOL());
            case 4: // Quit to desktop
                trace('no');
                System.exit(0);
            // end
        }
    }
}