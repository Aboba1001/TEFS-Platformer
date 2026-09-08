package states;

#if html
import js.html.ConstrainBooleanParameters;
#end
import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;

typedef ItemData = {
    var name:String;
    var description:String;
    var price:Int;
    @:optional var isSinglePurchase:Bool;
}

class ShopState extends FlxState {

    // Variables
    private var coinsCounter:FlxText;
    private var coinsBG:FlxSprite;
    private var description:FlxText;
    private var descriptionBG:FlxSprite;
    private var controlsTxt:FlxText;
    private var controlsBG:FlxSprite;

    private var ShopItems:Array<String>;

    private var curSelected:Int = 0;
    private var canChoose:Bool = true;

    override public function create():Void {

        coinsBG = new FlxSprite(0, 0, null);
        coinsBG.makeGraphic(100, 30, FlxColor.YELLOW);
        coinsBG.alpha = 0.5;
        add(coinsBG);

        coinsCounter = new FlxText(0, 0, 0, "Coins: ");
        coinsCounter.setFormat(null, 20, 0xFFFFFFFF, "left");
        add(coinsCounter);

        controlsBG = new FlxSprite(0, 0, null);
        controlsBG.makeGraphic(FlxG.width, 30, FlxColor.BLACK);
        controlsBG.alpha = 0.5;
        add(controlsBG);

        controlsTxt = new FlxText(0, 0, 0, null);
        controlsTxt.setFormat(null, 30, 0xFFFFFFFF, "center");
        controlsTxt.screenCenter(X);
        add(controlsTxt);

        #if (windows || linux || mac)
        controlsTxt.text = "Press ESC to go back | ENTER to buy or equip/unequip choosen item ";
        #end
        #if (android || ios)

        #end

        super.create();
    }

    override public function update(elapsed:Float):Void {

        // Controls
        if (FlxG.keys.justPressed.ESCAPE) {
            FlxG.switchState(new states.MainMenuLOL());
        } else if (FlxG.keys.justPressed.ENTER) {
        
        }

        // Functions

        super.update(elapsed);
    }
}