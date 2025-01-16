package selfupdating;

class UpdateChecker
{
	static var GIT_URL:String = "";

	public static function set_url(new_url:String)
	{
		GIT_URL = new_url;
	}

	public static function checkForUpdates()
	{
		#if hl
		return;
		#end

		var web_file = new haxe.Http(GIT_URL);

		web_file.onData = function(data:String)
		{
			var result:VersionFile = haxe.Json.parse(data);
			switch (result.updatetype)
			{
				case ASSETS:
					trace("Update is downloadable");
				case REINSTALL:
					trace("Update is not downloadable");
			}
		}

		web_file.onError = function(error)
		{
			trace('error: $error');
		}

		web_file.request();
	}
}