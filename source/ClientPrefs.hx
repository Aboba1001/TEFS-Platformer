package;

import flixel.FlxG;
import flixel.util.FlxSave;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;

// Stole from FNF': Psych Engine

class ClientPrefs {
    // Options Variables
    #if !mobile
    public static var fullscreen:Bool = false;
    #end
    public static var showFPS:Bool = true;
    public static var showMEM:Bool = true;
    public static var showVersion:Bool = true;
    public static var showDebugInfo:Bool = false;
    public static var shaders:Bool = true;
    public static var lowQuality:Bool = false;
    public static var colorblindFilter:String = "None";
    public static var framerate:Int = 60;
    
    // Functions
    public static function saveOptions() {
        
    }

    public static function onLoad() {
        #if !mobile
        if (FlxG.save.data.fullscreen != null) {
            fullscreen = FlxG.save.data.fullscreen;
        }
        #end
        if (FlxG.save.data.showFPS != null) {
            showFPS = FlxG.save.data.showFPS;
            if (Main.fpsVar != null) {
                Main.fpsVar.visible = showFPS;
            }
        }
        if (FlxG.save.data.showMEM != null) {
            showMEM = FlxG.save.data.showMEM;
        }
        if (FlxG.save.data.showVersion != null) {
            showVersion = FlxG.save.data.showVersion;
        }
        if (FlxG.save.data.showDebugInfo != null) {
            showDebugInfo = FlxG.save.data.showDebugInfo;
        }
        if (FlxG.save.data.shaders != null) {
            shaders = FlxG.save.data.shaders;
        }
        if (FlxG.save.data.lowQuality != null) {
            lowQuality = FlxG.save.data.lowQuality;
        }
        if (FlxG.save.data.colorblindFilter != null) {
            colorblindFilter = FlxG.save.data.colorblindFilter;
        }
        if (FlxG.save.data.framerate != null) {
            framerate = FlxG.save.data.framerate;
        }
    }
}
