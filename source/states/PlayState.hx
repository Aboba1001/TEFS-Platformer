package states;

import flixel.addons.plugin.taskManager.FlxTask;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxTimer;
import flixel.FlxState;
import flixel.FlxG;

class PlayState extends FlxState {
    private var p:Player;

    // Variables
    private var health:Int = 100;
    private var maxHealth:Int = 100; 

    private var coins:Int = 0;
    private var score:Int = 0;

    // HUD elements
    private var scoreText:FlxText;
    private var coinsText:FlxText;
    private var healthText:FlxText;
    private var hpDisplay:FlxText;
    
    override public function create():Void {
        // Creating le player
        p = new Player(100, 100);
        add(p);

        // Creating HUD time :vvvvvvvvv
        scoreText = new FlxText(10, 10, 100, "Score: " + score);
        scoreText.scrollFactor.set(0, 0);
        add(scoreText);

        coinsText = new FlxText(10, 30, 100, "Coins: " + coins);
        coinsText.scrollFactor.set(0, 0);
        add(coinsText);

        hpDisplay = new FlxText(p.x, p.y - 3, 200, health + " / " + maxHealth);
        hpDisplay.setFormat(null, 8, 0xFFFF0000, "center");
        hpDisplay.updateHitbox();
        hpDisplay.scrollFactor.set(1,1);
        add(hpDisplay);

        // Givin coins
        new FlxTimer().start(0.5, function(timer:FlxTimer) {
            score += 1;
        }, 0);

        super.create();
    }

    override public function update(elapsed:Float):Void {

        if (FlxG.keys.justPressed.ESCAPE) {
            openSubState(new substates.PauseSubState());
        }

        scoreText.text = "Score: " + score;
        coinsText.text = "Coins: " + coins;

        hpDisplay.text = health + " / " + maxHealth;
        hpDisplay.x = p.x - 75;
        hpDisplay.y = p.y - 6;

        super.update(elapsed);
    }
}