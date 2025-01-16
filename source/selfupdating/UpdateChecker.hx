package selfupdating;

import haxe.Http;
import sys.io.File;

class UpdateChecker
{
	static var GIT_URL:String = "";

	public static function set_url(new_url:String)
	{
		GIT_URL = new_url;
	}

	public static function checkForUpdates():Int
	{
		#if !sys
		return 2;
		#elseif hl
		return 2;
		#else
		var web_file = new Http('$GIT_URL/version.json');

		web_file.onData = function(data:String)
		{
			var result:VersionFile = haxe.Json.parse(data);
			switch (result.updatetype)
			{
				case ASSETS:
					trace("Update is downloadable");
					for (file in result.assets_to_download)
					{
						var filecontentcall = new Http('$GIT_URL/assets/$file');
						filecontentcall.onData = function(data:String)
						{
							trace("Downloaded: " + 'assets/$file');
							File.saveContent('assets/$file', data);
						}

						filecontentcall.onError = function(error)
						{
							trace('error: $error');
						}
					}
					return 1;
				case REINSTALL:
					trace("Update is not downloadable");
					return 0;
			}
		}

		web_file.onError = function(error)
		{
			trace('error: $error');
		}

		web_file.request();
		#end

		return 2;
	}
}