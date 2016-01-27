package  
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Morgane Cabrol
	 */
	public class CollisionMur 
	{
		
		public function CollisionMur() 
		{
			super();
		
			//tablMur.push(Constante.monMain.tablMur);
		}
		
		
		public  static function testCollisionMur(obj:DisplayObject):Boolean
		{
			
			
			
			for (var i:int = 0 ; i <  Constante.monMain.tablMur.length ; i++ ) {
				if (obj.hitTestObject(Constante.monMain.tablMur[i].hitBox)) {
					
					return true;
				}
				
				if (obj.hitTestObject( Constante.monMain.tablMur[i].hitBoxHaut)) {
					
					return true;
				}
				
				if (obj.hitTestObject( Constante.monMain.tablMur[i].hitBoxBas)) {
					
					return true;
				}
			}
			
			return false;
		}
		
	}

}