package  
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Morgane Cabrol
	 */
	public class Turret extends MovieClip
	{
		public var cible:MovieClip = new MovieClip();
		public function Turret(viseur:MovieClip) 
		{
			super();
			this.cible = viseur;
			cible.x = viseur.x ;
			cible.y = viseur.y ;
			
			
			this.addEventListener(Event.ENTER_FRAME, pointerSouris , false, 0 , true);
		}
		
		public function pointerSouris(e:Event):void
		{
			var distanceX:Number =  cible.x - this.x;
			var distanceY:Number =  cible.y - this.y ;
			
			this.rotation = Trigo.retourneAngle2Objets(distanceX, distanceY);
		}
		
		public function supprimerEventFrame():void 
		{
			removeEventListener(Event.ENTER_FRAME, pointerSouris);
		}
		
	}

}