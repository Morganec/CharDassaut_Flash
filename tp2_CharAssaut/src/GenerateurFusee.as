package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Morgane Cabrol
	 */
	public class GenerateurFusee extends Sprite 
	{
		//public var tablFusee:Array = new Array();
		//public var fuseeEnJeu:Array = new Array();
		public var tablPosition:Array = new Array();
		public var pos1:Point = new Point();
		public var pos2:Point =new Point();
		public var pos3:Point=new Point();
		public var pos4:Point=new Point();
		public var tank:Tank;
		public var base:Base = new Base(); 
		
		//public var joue:Boolean = true;
		
		public function GenerateurFusee(untank:Tank) 
		{
			super();
			this.tank = untank;
			this.base = this.tank.base;
			Constante.fuseeEnJeu = new Array();
			//Constante.fuseeEnJeu.push(new Rocket(this.tank));
			this.declarerPos();
			//this.placerFusee();
			this.creerFusee();
			this.addEventListener(Event.ENTER_FRAME, enterFrame , false, 0 , true);
		}
		
		public function declarerPos():void 
		{
			pos1.x =950;
			pos1.y = 750;
			tablPosition.push(pos1);
			
			pos2.x = -150;
			pos2.y = 750;
			tablPosition.push(pos2);
			
			pos3.x = -150;
			pos3.y = -150;
			tablPosition.push(pos3);
			
			pos4.x = 950;
			pos4.y = -150;
			tablPosition.push(pos4);
		}
		
		public function creerFusee():void 
		{
			
			var j:int;
			
			if (tablPosition.length != 0) {
				j = Math.floor(Math.random() * tablPosition.length)
			var position:Point = tablPosition[j];
			tablPosition.splice(j, 1);
				
				Constante.fuseeEnJeu.push(new Rocket(this.tank,position));
				this.addChild(Constante.fuseeEnJeu[Constante.fuseeEnJeu.length - 1]);
			}
				
			
				
			
		}
		
		public function  afficherFusee():void 
		{
			for (var i:int = 0 ; i <  Constante.fuseeEnJeu.length; i++ ) {
				this.addChild(Constante.fuseeEnJeu[i]);
			}
		}
		
		
		
		
		//public function placerFusee():void 
		//{
			//this.declarerPos();
			//var j:int;
			//
			//for (var i:int = 0 ; i < Constante.fuseeEnJeu.length ; i++ ) {
				//
				//j = Math.floor(Math.random() * tablPosition.length)
				//var position:Point = tablPosition[j];
				//tablPosition.splice(j, 1);
				//
				//
				//Constante.fuseeEnJeu[i].x = position.x;
				//Constante.fuseeEnJeu[i].y = position.y;
				//this.addChild(Constante.fuseeEnJeu[i]);
				//
			//}
		//}
		
		private function enterFrame(e:Event):void 
		{	
			//for (var i:int = 0 ; i < Constante.fuseeEnJeu.length ; i++ ) {	
				//if (Constante.fuseeEnJeu[i].hitTestObject(this.base.hitBox) ||Constante.fuseeEnJeu[i].hitTestObject(this.base.hitBox2)) {
					//this.removeChild(fuseeEnJeu[i]);
					//this.tank.canon.gotoAndPlay(2);
					//joue = false;
					//this.removeEventListener(Event.ENTER_FRAME, enterFrame);
					//trace("toujours dans le enterFrame Hé hé  " );
				
				//}else {
				//fuseeEnJeu[i].Bouger();
				//}
			//}
			
			for (var i:int = 0 ; i < Constante.fuseeEnJeu.length ; i++ ) {
				if (Constante.fuseeEnJeu[i].enVie == false) {
					
					if (Constante.fuseeEnJeu[i].currentFrame == 20) {
						var position:Point = Constante.fuseeEnJeu[i].posDepart;
						
						tablPosition.push(position)
						this.removeChild(Constante.fuseeEnJeu[i]);
						Constante.fuseeEnJeu.splice(i, 1);
						//Constante.fuseeEnJeu.push(new Rocket(this.tank));
						//this.placerFusee();
						if (this.tank.enVie) {
							this.creerFusee();
						}else {
							this.supprimerEventFrame();
						}
						
					}
					
				}
			}
		}
		
		public function supprimerEventFrame():void 
		{
			
			for (var i:int = 0 ; i < Constante.fuseeEnJeu.length ; i++ ) {
				Constante.fuseeEnJeu[i].supprimerEventFrame();
				this.removeChild(Constante.fuseeEnJeu[i]);
			}
			removeEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
	}

}