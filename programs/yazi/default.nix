
{ pkgs,config, ...}:
{

	#home.file.".config/yazi/theme.toml".source = ./theme.toml;
	programs.yazi = {
		enable = true;
	};

}
