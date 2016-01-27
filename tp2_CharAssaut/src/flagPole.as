package  
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Morgane Cabrol
	 */
	public class flagPole extends MovieClip 
	{
	
		public function flagPole() 
		{
			super();
			this.placerAleatoirement();
		
			
		}
		
		public function placerAleatoirement():void {
			x = Math.floor(Math.random() * 700);
			y = Math.floor(Math.random() * 500);
			
			this.x = x;
			this.y = y;
		}
		
		
		
	}

}