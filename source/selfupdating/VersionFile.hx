package selfupdating;

typedef VersionFile =
{
	var version:String;
	var releasenote:String;
	var updatetype:UpdateTypes;
	var ?assets_to_download:Array<String>;
}

enum abstract UpdateTypes(String) from String to String
{
	public var ASSETS:String = "ASSETS";
	public var REINSTALL:String = "REINSTALL";
}

