package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.effects.FlxTrail;
import flixel.addons.effects.FlxTrailArea;
import flixel.addons.effects.chainable.FlxTrailEffect;

class Player extends FlxSprite {
    public var speed:Float = 100;
    public var trail:FlxTrail;

    public function new(posx:Float, posy:Float) {
        super(posx,posy);
        makeGraphic(16, 16, 0xFF00FF00);
        trail = new FlxTrail(this, null, 10, 6, 0.3, 0.05);
        FlxG.state.add(trail);
    }

    override public function update(elapsed:Float):Void {
        onMovement();
        super.update(elapsed);
    }

    private function onMovement():Void {
        velocity.x = 0;
        velocity.y = 0;

        if (FlxG.keys.pressed.LEFT || FlxG.keys.pressed.A) {
            velocity.x = -speed;
        } 
        if (FlxG.keys.pressed.RIGHT || FlxG.keys.pressed.D) {
            velocity.x = speed;
        } 
        if (FlxG.keys.pressed.UP || FlxG.keys.pressed.W) {
            velocity.y = -speed;
        } 
        if (FlxG.keys.pressed.DOWN || FlxG.keys.pressed.S) {
            velocity.y = speed;
        }
    }
}