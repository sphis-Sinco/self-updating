package selfupdating;

class Checker
{
	public static var GIT_URL:String = "";

	public static function set_url(new_url:String)
	{
		GIT_URL = new_url;
	}

	public static function checkForUpdates()
	{
		// this is where we are going to do the checking shit
	}
}