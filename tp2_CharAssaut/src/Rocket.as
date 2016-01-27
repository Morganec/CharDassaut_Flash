package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Morgane Cabrol
	 */
	public class Rocket extends MovieClip 
	{
		public var tank:Tank;
		public var base:Base = new Base();
		public var canon:Turret ;
		private var vitesse:Point = new Point()
		public var enVie:Boolean;
		public var posDepart:Point = new Point();
		public var sonExplo:FuseeExplosion = new FuseeExplosion();
		
		public function Rocket(untank:Tank, positionDepart:Point) 
		{
			super();
			this.tank = untank;
			this.base = untank.base;
			this.canon = untank.canon;
			enVie = true;
			vitesse.x = 0;
			vitesse.y = 0;
			this.posDepart = positionDepart;
			this.x = posDepart.x;
			this.y = posDepart.y ;
			this.pointerTank();
			this.addEventListener(Event.ENTER_FRAME, Bouger , false, 0 , true);
			this.lancerAngle(5, this.rotation);
		}
		
		public function Bouger(e:Event):void 
		{
			if (this.toucheTank()){
				this.tank.finTank();
				this.finFusee(); 
				//this.enVie = false;
				//removeEventListener(Event.ENTER_FRAME, Bouger);
				
			}else {
				this.pointerTank();
			this.lancerAngle(5, this.rotation);
			this.x += vitesse.x;
			this.y += vitesse.y;
			}
			
		}
		
		
		public function pointerTank():void
		{
			var distanceX:Number =  base.x - this.x;
			var distanceY:Number =  base.y - this.y ;
			
			this.rotation = Trigo.retourneAngle2Objets(distanceX, distanceY);
		}
		
		
		private function lancerAngle(vitesse:Number, angle:Number):void
		{
			this.vitesse.x = Trigo.retourneVitesseX(vitesse, angle);
			this.vitesse.y = Trigo.retourneVitesseY(vitesse, angle);
		}
		
		private function toucheTank():Boolean
		{
			if (this.hitTestObject(this.base.hitBox) || this.hitTestObject(this.base.hitBox2)) {
				return true;
			}else {
				return false;
			}
		}
		
		public function supprimerEventFrame():void 
		{
			removeEventListener(Event.ENTER_FRAME, Bouger);
			enVie = false;
		}
		
		public function finFusee():void 
		{
			this.gotoAndPlay(2);
			sonExplo.play();
			enVie = false;
			this.removeEventListener(Event.ENTER_FRAME, Bouger);
		}

	}

}