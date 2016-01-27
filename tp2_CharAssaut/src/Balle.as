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
	public class Balle extends MovieClip 
	{
		private var vitesse:Point = new Point()
		public var enVie:Boolean; //est ce que la balle est en vie ou doit etre supprimer
		
		public function Balle() 
		{
			super();
			vitesse.x = 0;
			vitesse.y = 0;
			enVie = true;
		}
		
		public function lancerBalle(obj:DisplayObject, vitesse:Number):void
		{
			var distanceX:Number =  obj.x - this.x;
			var distanceY:Number =  obj.y - this.y ;
			
			this.rotation = Trigo.retourneAngle2Objets(distanceX, distanceY);
			
			this.vitesse.x = Trigo.retourneVitesseX(vitesse,this.rotation);
			this.vitesse.y = Trigo.retourneVitesseY(vitesse, this.rotation);
			
			this.addEventListener(Event.ENTER_FRAME, Bouger , false, 0 , true);
		}
		
		private function Bouger(e:Event):void 
		{
			if (toucheFusee()) {
				Constante.score += 50;
				this.gotoAndPlay(3);
				enVie = false;
				removeEventListener(Event.ENTER_FRAME, Bouger);
				
			}
			
			if (sortStage()) {
				enVie = false;
				removeEventListener(Event.ENTER_FRAME, Bouger);
			}
			if (CollisionMur.testCollisionMur(this)) {
				vitesse.x = -vitesse.x;
				vitesse.y = -vitesse.y;
			}
			
			
			
			this.x += vitesse.x;
			this.y += vitesse.y
		}
		
		public function toucheFusee():Boolean
		{
			for (var i:int = 0 ; i < Constante.fuseeEnJeu.length ; i++ ) {
				if (this.hitTestObject(Constante.fuseeEnJeu[i]) && Constante.fuseeEnJeu[i].enVie == true) {
					Constante.fuseeEnJeu[i].finFusee();
					return true
				}
			}return false;
			
		}
		
		public function sortStage():Boolean
		{
			if (this.x > Constante.monMain.stage.stageWidth || this.x < 0 || this.y > Constante.monMain.stage.stageHeight || this.y < 0 ) {
					
					return true;
					
			}return false;
		}
		
		
		public function supprimerEventFrame():void 
		{
			removeEventListener(Event.ENTER_FRAME, Bouger);
		}
		
	}

}