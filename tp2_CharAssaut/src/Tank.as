package  
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.media.Sound;
	import flash.ui.Keyboard;
	
	
	/**
	 * ...
	 * @author Morgane Cabrol
	 */
	public class Tank extends MovieClip 
	{
		public var code:uint = 0;
		public var canon:Turret ;
		private var vitesse:Point = new Point()
		public var base:Base = new Base();
		public var souris:Point = new Point(0, 0);
		public var cible:MovieClip = new MovieClip();
		public var tablBalle:Array = new Array()
		public var enVie:Boolean;
		public var sonMur:ToucheMur = new ToucheMur();
		public var sonExplo:BalleExplosion = new BalleExplosion();
		
		
		public function Tank(viseur:MovieClip) 
		{
			super();
			this.cible = viseur;
			cible.x = viseur.x ;
			cible.y = viseur.y ;
			canon = new Turret(this.cible);
			enVie = true;
			//canon.x = canon.y = 300;
			canon.x =base.x = 300;
			canon.y =base.y = 200;
			
			while (tablBalle.push(new Balle()) < 5 ){};
			
			
			canon.scaleX = canon.scaleY =  .2;
			base.scaleX = base.scaleY = .2;
			
			addChild(base);
			addChild(canon);
			
		
			
		
			addEventListener(Event.ENTER_FRAME, enterFrameHandler, false, 0, true);
			
			
		}
		
		private function toucheMur():Boolean
		{
			
			if ( CollisionMur.testCollisionMur(base.hitBox) || CollisionMur.testCollisionMur(base.hitBox2) ) {
				sonMur.play();
				return true;
			}else {
				return false;
			}
		}
		
		
		private function sorStage():Boolean {
			if (base.x +50  > Constante.monMain.stage.stageWidth || base.x -50 < 0 || base.y + 50> Constante.monMain.stage.stageHeight || base.y - 50 < 0 ) {
				return true
			}else {
				return false;
			}
		}
			
		
		
		
		
		private function enterFrameHandler(e:Event):void 
		{
			
			if (this.canon.currentFrame == 30) {
				enVie = false;
			canon.supprimerEventFrame();
			removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
			}
			
			this.canon.x = this.base.x;
			this.canon.y = this.base.y;
			
			
			
			
			if (code == Keyboard.LEFT) {
				
				trace("gauche");
				if (toucheMur() || sorStage()) {
					lancerAngle(1, this.base.rotation + 90 );
				this.base.x += vitesse.x;  
				this.base.y += vitesse.y;
				}else {
					
					this.base.rotation = this.base.rotation - 5;
					this.base.rightTreds.gotoAndPlay("forward");
				}
				
				
				
			}
			
			if (code == Keyboard.RIGHT) {
				trace("gauche");
				if (toucheMur() || sorStage()) {
					lancerAngle(1, this.base.rotation + 90 );
				this.base.x += vitesse.x;  
				this.base.y += vitesse.y;
				}else {
				this.base.rotation = this.base.rotation + 5;
				this.base.leftTreds.gotoAndPlay("forward");
				}
			
			}
			
			if (code == Keyboard.UP) {
				trace("haut");
				if (toucheMur() || sorStage()) {
					lancerAngle(1, this.base.rotation + 90 );
				this.base.x += vitesse.x;  
				this.base.y += vitesse.y;
				}else {
				lancerAngle(1, this.base.rotation -90 );
				this.base.x += vitesse.x;  
				this.base.y += vitesse.y;
				this.base.rightTreds.gotoAndPlay("forward");
				this.base.leftTreds.gotoAndPlay("forward");
				}
				
			}
			
			if (code == Keyboard.DOWN) {
				trace("haut");
				if (toucheMur() || sorStage()) {
					lancerAngle(1, this.base.rotation - 90 );
				this.base.x += vitesse.x;  
				this.base.y += vitesse.y;
				}else {
				lancerAngle(1, this.base.rotation + 90 );
				this.base.x += vitesse.x;  
				this.base.y += vitesse.y;
				this.base.rightTreds.gotoAndPlay("reverse");
				this.base.leftTreds.gotoAndPlay("reverse");
				}
				
			}
			
			
			if (this.canon.currentFrame >25) {
				
			
				this.enVie = false;
				this.supprimerEventFrame();
			}
		}
		
		private function lancerAngle(vitesse:Number, angle:Number):void
		{
			
			
			this.vitesse.x = Trigo.retourneVitesseX(vitesse, angle);
			this.vitesse.y = Trigo.retourneVitesseY(vitesse, angle);
		}
		
		public function supprimerEventFrame():void 
		{
			canon.supprimerEventFrame();
			removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
			
			
			
		}
		
		public function finTank():void 
		{
			sonExplo.play();
			this.canon.gotoAndPlay(2);
			
			
			
			
		}
	}

}