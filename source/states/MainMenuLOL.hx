package states;

import flixel.system.FlxAssets.FlxAngelCodeXmlAsset;
import flixel.sound.FlxSound;
import lime.system.System;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxState;
import flixel.tweens.FlxTween;
import flixel.tweens.misc.ColorTween;
import lime.system.System;
import flixel.util.FlxColor;

class MainMenuLOL extends FlxState {
    private var curSelected:Int = 0;
    private var options:Array<String> = [
        "Start",
        "Shop",
        "Achievements",
        "Gallery",
        "Settings",
        "Exit"
    ];

    public var ver:String = "1.0 RELEASE";

    public var fazClicks:Int = 0;
    public var fazbear:FlxSprite;

    private var optionTexts:Array<FlxText> = [];
    private var optionText:FlxText;
    private var verText:FlxText;
    private var exitButton:FlxSprite;
    private var BG:FlxSprite;
    private var backgrad:FlxSprite;

    private var scroll:FlxSound;
    private var confirm:FlxSound;

    private var optionColorTween:FlxTween;
    private var optionPosXTween:FlxTween;

    private var canChoose:Bool = true;
    private var hovering:Bool = false;

    private var defaultOptionSize:Int = 50;
    private var optionSizeMult:Int = 1;

    override public function create():Void {

        scroll = FlxG.sound.load("assets/sounds/menumove.wav");
        confirm = FlxG.sound.load("assets/sounds/menuconfirm.wav");

        BG = new FlxSprite(0, 0);
        BG.makeGraphic(FlxG.width, FlxG.height, 0xFF000000);
        add(BG);

        backgrad = new FlxSprite(FlxG.width, FlxG.height);
        backgrad.loadGraphic("assets/images/back_grad.png");
        backgrad.setGraphicSize(FlxG.width, FlxG.height);
        backgrad.screenCenter(XY);
        backgrad.updateHitbox();
        add(backgrad);

        for (i in 0...options.length) {
            optionText = new FlxText(FlxG.width / 2 - 600 + i * 50, 100 + i * 90, 0, options[i]);
            optionText.setFormat("assets/fonts/Comic Sans MS.ttf", 50, 0xFFFFFFFF, "left");
            optionText.textField.defaultTextFormat.leading = 10;
            add(optionText);
            optionTexts.push(optionText);
        }

        exitButton = new FlxSprite();
        exitButton.makeGraphic(60, 60, 0xFFFF0000);
        add(exitButton);

        verText = new FlxText(FlxG.width - 100, FlxG.height - 30, 100, "v: " + ver);
        verText.setFormat(null, 12, 0xFFFFFFFF, "right");
        add(verText);

        fazbear = new FlxSprite(FlxG.width / 2 + 300, FlxG.height / 2 - 50);
        fazbear.loadGraphic("assets/images/freddy.png");
        fazbear.scale.set(0.3, 0.3);
        add(fazbear);

        refresh();
        super.create();
    }

    override public function update(elapsed:Float):Void {

        // HUR HUR HUR HUR HUR
        if (FlxG.mouse.overlaps(fazbear, FlxG.camera) && FlxG.mouse.justPressed) {
            HURHURHURHUR();
        }

        if (FlxG.mouse.overlaps(exitButton, FlxG.camera) && FlxG.mouse.justPressed) {
            System.exit(0);
        }

        // Handle navigations and stuff
        if (canChoose == true)
        {
            if (FlxG.keys.justPressed.ENTER || FlxG.keys.justPressed.SPACE) {
                onConfirm();
                refresh();
                //canChoose = false;
            }

            if (FlxG.keys.justPressed.UP || FlxG.keys.justPressed.W) {
                changeItem(-1);
                refresh();
            } else if (FlxG.keys.justPressed.DOWN || FlxG.keys.justPressed.S) {
                changeItem(1);
                refresh();
            }
        }

        super.update(elapsed);
    }

	function changeItem(huh:Int = 0)
	{
        curSelected += huh;
        
        if (curSelected >= options.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = options.length - 1;
    }

    private function refresh():Void {
        scroll.play();
        for (i in 0...optionTexts.length) {
            if (i == curSelected) {
                optionTexts[i].size = defaultOptionSize + optionSizeMult;
                optionTexts[i].color = 0xFFFFFF00;
            } else {
                optionTexts[i].size = defaultOptionSize;
                optionTexts[i].color = 0xFFFFFFFF;
            }
        }
    }

    private function onConfirm():Void 
    {
        confirm.play();
        switch (curSelected) {
            case 0:
                FlxG.switchState(new states.PlayState());
                trace('Entering PlayState');
            case 1:
                FlxG.switchState(new states.ShopState());
                trace('Entering ShopState');
            case 2:
                trace('Entering Achievements Menu');
            case 3:
                FlxG.switchState(new states.GalleryState());
                trace('Entering Gallery');
            case 4:
                FlxG.switchState(new states.OptionsState());
                trace('Entering Options');
            case 5:
                trace('Quitting Game...');
                System.exit(0);
        }
    }

    private function HURHURHURHUR():Void {
        fazClicks += 1;
    }
}