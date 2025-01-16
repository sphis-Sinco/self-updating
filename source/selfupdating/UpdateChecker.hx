package selfupdating;

import haxe.Http;

class UpdateChecker
{
	static var GIT_URL:String = "";

	public static function set_url(new_url:String)
	{
		GIT_URL = new_url;
	}

	public static function checkForUpdates()
	{
		var web_file = new Http(GIT_URL);

		web_file.onData = function(data:String)
		{
			var result:VersionFile = haxe.Json.parse(data);
			trace('File Version: ${result.version}');
		}

		web_file.onError = function(error)
		{
			trace('error: $error');
		}

		web_file.request();
	}
}