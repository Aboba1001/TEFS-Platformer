package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class GalleryState extends FlxState {
    private var list:Array<String>;

    // Variables
    private var curSelected:Int = 0;
    private var allowInput:Bool = false;
    
    private var bg:FlxSprite;
    private var image:FlxSprite;
    private var title:FlxText;
    private var description:FlxText;

    // Functions
    override public function create():Void {

        bg = new FlxSprite();
        bg.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
        bg.screenCenter();
        bg.alpha = 0.5;
        add(bg);

        super.create();
    }

    override public function update(elapsed:Float) {
        // Controls
        if(FlxG.keys.justPressed.ESCAPE) {
            FlxG.switchState(new states.MainMenuLOL());
        } else if(FlxG.keys.justPressed.ENTER) {
            trace('Pressed Enter');
        }

        if (FlxG.keys.justPressed.UP || FlxG.keys.justPressed.W) {
            trace('Pressed UP/W');
        } else if (FlxG.keys.justPressed.DOWN || FlxG.keys.justPressed.S) {
            trace("Pressed DOWN/S");
        }

        if (FlxG.mouse.justMoved) {

        } else if (FlxG.mouse.justPressed) {
            
        }
        // End Of Controls Zone
    }

    private function onSelect():Void {
        
    }
}