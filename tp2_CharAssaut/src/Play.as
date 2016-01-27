package  
{
	import flash.display.DisplayObject;
	import flash.display.SimpleButton;
	
	/**
	 * ...
	 * @author Morgane Cabrol
	 */
	public class Play extends SimpleButton 
	{
		
		public function Play(upState:DisplayObject=null, overState:DisplayObject=null, downState:DisplayObject=null, hitTestState:DisplayObject=null) 
		{
			super(upState, overState, downState, hitTestState);
			
		}
		
	}

}