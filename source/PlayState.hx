package;

import flixel.FlxState;
import selfupdating.UpdateChecker;

class PlayState extends FlxState
{
	override public function create()
	{
		UpdateChecker.set_url("https://raw.githubusercontent.com/sphis-Sinco/self-updating/refs/heads/main");
		UpdateChecker.checkForUpdates();

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
