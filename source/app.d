import std.process : environment;
import core.thread;
import std.file : rmdirRecurse, exists, FileException;

void main()
{
	immutable spotify_update_path = environment.get("APPDATA")~"/../Local/Spotify/Update";
	while(true)
	{
		Thread.sleep(1.seconds);
		if( spotify_update_path.exists )
		{
			try
			{
				rmdirRecurse( spotify_update_path );
			}
			catch(FileException e){}
			catch(Exception e){}
		}
	}
}
