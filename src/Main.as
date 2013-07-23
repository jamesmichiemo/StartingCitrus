package
{
	import com.citrusengine.core.StarlingCitrusEngine;
	
	import flash.display.Sprite;
	
	
	[SWF(frameRate="60", width="1240", height="720", backgroundColor="0x333333")]
	public class Main extends StarlingCitrusEngine
	{
		
		public function Main()
		{
			setUpStarling(true);
			
			state = new StarlingDemoGameState();
		}
	}
}