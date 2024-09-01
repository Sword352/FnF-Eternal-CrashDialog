package;

import haxe.ui.HaxeUIApp;
import haxe.ui.containers.VBox;

@:build(haxe.ui.ComponentBuilder.build("assets/main-view.xml"))
class MainView extends VBox {
    /**
     * List of quotes the crash dialog can choose.
     * Pretty overkill amount but why not lol
     */
    var quotes:Array<Quote> = [
        {author: "PlankDev",       quote: "never assume in life.. dont think that carrot big because carrot big leaf because small leaf carrot big not leaf big size"},
        {author: "PlankDev",       quote: "why do they call oven an oven when you of in the cold food of out hot eat the food"},
        {author: "PlankDev",       quote: "whoops! all runtime exception"},
        {author: "PlankDev",       quote: "oops! unpacked 338.zip"},
        {author: "PlankDev",       quote: "erm... what the blast"},
        {author: "PlankDev",       quote: "you're did it !!!!"},
        {author: "Crazyb3ndy",     quote: "we're getting silly with this one"},
        {author: "Crazyb3ndy",     quote: "haha your pc went boom boom"},
        {author: "Crazyb3ndy",     quote: "smart fella? more like CRASH fella.."},
        {author: "Crazyb3ndy",     quote: "fact checkers say your game crashed"},
        {author: "LeonBrother",    quote: "Looks like a pipe exploded"},
        {author: "LeonBrother",    quote: "Come back next Friday"},
        {author: "LeonBrother",    quote: "Haha someone's code isn't funkin'"},
        {author: "LeonBrother",    quote: "Looks like it's crashing time!"},
        {author: "Glade",          quote: "um hi i'm the friendly crash quote"},
        {author: "Glade",          quote: "thank god the game isn't a car!"},
        {author: "Glade",          quote: "pluh simulator"},
        {author: "Chris Speciale", quote: "Life is like a burrito. If you stuff it too much, something's bound to spill out, and it's probably gonna be embarrassing."},
        {author: "Chris Speciale", quote: "Dont test in production. ;D"},
        {author: "Chris Speciale", quote: "WTH is a unit test?"},
        {author: "SMB",            quote: "Roses are red Violet's are blue I'm gonna throw a null object reference in your window"},
        {author: "SMB",            quote: "a crash? aw man"},
        {author: "RapperGF",       quote: "3 DAYS"},
        {author: "RapperGF",       quote: "I can't believe it's not vslice"},
        {author: "Swordcube",      quote: "Only happened in QA testing"},
        {author: "glintfish",      quote: "woodermort doodli"},
        {author: "therealjake12",  quote: "go back to the basement"},
        {author: "MAJigsaw77",     quote: "Game over"},
        {author: "Cobalt",         quote: "eats ur code"},
        {author: "betpowo",        quote: "You fool! You've messed with the natural order!"},
        {author: "Nick",           quote: "c_"},
        {author: "ZesCrew2",       quote: "too bad, so sad"},
        {author: "LarryFrosty",    quote: "sands undertale"},
        {author: "Crowplexus",     quote: "Super Mario breaks every bone in his body"},
        {author: "Moxie",          quote: "Hi. I'm Eternal, and I'm a crashaholic."},
        {author: "Meloomazy",      quote: "what the scallop"}
    ];
    
    override function onReady():Void {
        var args:Array<String> = Sys.args();

        if (args.length == 0) {
            // you shouldn't really open the crash handler manually
            Sys.exit(0);
        }

        HaxeUIApp.instance.icon = "assets/win-icon.png";

        var quote:Quote = quotes[Std.random(quotes.length)];
        topText.text = '"${quote.quote}" - ${quote.author}\n'+ topText.text;

        notice.text = 'Crash dump saved at "' + args[1] + '"\n' + notice.text;
        crashDump.text = args[0];

        restartBtn.onClick = (_) -> {
            openFile("EternalFunkin");
            Sys.exit(0);
        };

        githubBtn.onClick = (_) -> openFile("https://github.com/Sword352/FnF-Eternal/");
        dumpBtn.onClick = (_) -> openFile(args[1]);
        exitBtn.onClick = (_) -> Sys.exit(0);
    }

    function openFile(file:String):Void {
        switch (Sys.systemName()) {
            case "Windows":
                Sys.command("start", ["", file]);
            case "Mac":
                Sys.command("/usr/bin/open", [file]);
            case "Linux":
                Sys.command("/usr/bin/xdg-open", [file]);
        } 
    }
}

@:structInit
class Quote {
    public var quote:String;
    public var author:String;
}
