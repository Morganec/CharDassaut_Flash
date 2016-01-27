package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Morgane Cabrol
	 */
	public class Jeu extends MovieClip 
	{
		private var flagpole:flagPole ;
		
		public var tank:Tank ;
		public var cible:MovieClip = new MovieClip();
		//public var fusee:Rocket;
		public var joue:Boolean ;
		//public var test:Boolean = true;
		//public var tablFusee:Array = new Array();
		//public var nbFusee:int = 4;
		public var generateurF:GenerateurFusee ;
		public var niveau:int = 1;
		public var sonDrap:TadaSon = new TadaSon();
		
		
		
		public function Jeu(viseur:MovieClip) 
		{
			super();
			
			cible = viseur;
			cible.x =viseur .x;
			cible.y = viseur.y
			flagpole = new flagPole();
			
			
			this.tank = new Tank(this.cible);
			generateurF = new GenerateurFusee(this.tank);
			
			this.addChild(generateurF);
			
			this.addChild(flagpole)
			this.addChild(tank);
			
			joue = true;
			Constante.monMain.stage.addEventListener(MouseEvent.CLICK, sourisClick, false, 0, true);
			this.addEventListener(Event.ENTER_FRAME, enterframe , false, 0 , true);
			
			while(CollisionMur.testCollisionMur(flagpole)) {
				flagpole.placerAleatoirement();
			}
			
			
			
			
		}
		
	
		
		private function sourisClick(e:MouseEvent):void 
		{
			if (tank.tablBalle.length == 0) {
				trace("attendre que le chargeur se recharge");
			}else {
				
				var longueur:uint = (Constante.tablBallEnjeu.push(tank.tablBalle.pop())) - 1;
				Constante.tablBallEnjeu[longueur].x = tank.canon.x;
				Constante.tablBallEnjeu[longueur].y = tank.canon.y;
				this.addChild(Constante.tablBallEnjeu[longueur]);
				Constante.tablBallEnjeu[longueur].lancerBalle(cible, 10);
				
				
			trace(tank.tablBalle.length);
			}
			
			
		}
		
		
		
		
		
		
		public function enterframe(e:Event):void 
		{
		
			if (this.tank.enVie == false) {
				for (var i:int = 0 ; i < Constante.fuseeEnJeu.length ; i++ ) {
					Constante.fuseeEnJeu[i]. supprimerEventFrame(); 
					Constante.fuseeEnJeu.splice(i,1);
				}
					//generateurF.supprimerEventFrame();
					this.removeEventListener(Event.ENTER_FRAME, enterframe);
				
				Constante.monMain.stage.removeEventListener(MouseEvent.CLICK, sourisClick);
				this.joue = false;
				Constante.score = 0 ;
				
				
			}
			
			for (var j:int = 0 ; j < Constante.tablBallEnjeu.length ; j++ ) {
				if (Constante.tablBallEnjeu[j].enVie == false) {
					this.removeChild(Constante.tablBallEnjeu[j]);
					Constante.tablBallEnjeu.splice(j, 1);
					tank.tablBalle.push(new Balle());
				}
			}
			
			
			
			if (tank.base.hitBox.hitTestObject(flagpole) || tank.base.hitBox2.hitTestObject(flagpole)) {
				Constante.score += 500;
				sonDrap.play();
				this.removeChild(flagpole);
				flagpole = new flagPole();
				this.addChild(flagpole);
				niveau++;
				while(CollisionMur.testCollisionMur(flagpole)) {
					flagpole.placerAleatoirement();
				}
				generateurF.creerFusee();
				
				
			}
			
				
			
			
			
			
			
		}
		
		
		public function bougerObjet(e:uint):void 
		{
			
			this.tank.code = e;
			
		}
		
		public function arreterObjet():void 
		{
			this.tank.code = 0;
			
		}
		
		
		public function supprimerEventFrame():void 
		{
			for (var j:int = 0 ; j < Constante.tablBallEnjeu.length ; j++ ) {
				Constante.tablBallEnjeu[j].supprimerEventFrame();
			}
			generateurF.supprimerEventFrame();
			tank.supprimerEventFrame();
			Constante.monMain.stage.removeEventListener(MouseEvent.CLICK, sourisClick);
			this.removeEventListener(Event.ENTER_FRAME, enterframe);
			tank = null ;
			generateurF = null ;

		}
		
		
	
	}
		
}

