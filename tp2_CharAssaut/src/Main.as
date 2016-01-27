package 
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.ui.Mouse;
	
	/**
	 * ...
	 * @author Morgane Cabrol
	 */
	public class Main extends MovieClip 
	{
		private var jeu:Jeu;
		
		public var i:int = 0;
		
		public var viseur:MovieClip = new MovieClip();
		
		public var murGauche:MovieClip = new MovieClip();
		public var murDroite:MovieClip = new MovieClip();
		public var murBas:MovieClip = new MovieClip();
		public var murMilieu:MovieClip = new MovieClip();
		public var murHaut:MovieClip = new MovieClip();
		
		public var tablMur:Array = new Array();
		
		public var playAg:Play = new Play();
		
		public var score:TextField = new TextField();
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			trace("test yolo 2");
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Constante.monMain = this;
			Mouse.hide();
			stage.mouseChildren = false;
			viseur.x = mouseX;
			viseur.y = mouseY;
			
			tablMur.push(murBas, murHaut, murDroite, murGauche, murMilieu);
			
			score.text = "Score : " + String(Constante.score);
			
			playAg.y = 200;
			playAg.x = 350;
			jeu = new Jeu(viseur);
			stage.addChild(jeu);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, bougerObjet, false, 0 , true);
			stage.addEventListener(KeyboardEvent.KEY_UP, arreterObjet, false, 0 , true);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, suivreSouris, false, 0, true);
			stage.addEventListener(Event.ENTER_FRAME, enterFrame, false, 0, true);
			
			// entry point
		}
		
		private function enterFrame(e:Event):void 
		{
			score.text = "Score : " + String(Constante.score);
			if (!jeu.joue) {
				
				jeu.supprimerEventFrame();
				stage.removeChild(jeu);
				this.addChild(playAg);
				Mouse.show();
				
				stage.mouseChildren = true;
				
				playAg.addEventListener(MouseEvent.CLICK, rejouer, false, 0, true);
				stage.removeEventListener(Event.ENTER_FRAME, enterFrame);
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, bougerObjet);
			stage.removeEventListener(KeyboardEvent.KEY_UP, arreterObjet);
			}
		}
		
		private function rejouer(e:MouseEvent):void 
		{
			
			playAg.removeEventListener(MouseEvent.CLICK, rejouer);
			
			removeChild(playAg);
			Mouse.hide();
			jeu = new Jeu(viseur);
			stage.addChild(jeu);
			stage.addEventListener(Event.ENTER_FRAME, enterFrame, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, bougerObjet, false, 0 , true);
			stage.addEventListener(KeyboardEvent.KEY_UP, arreterObjet, false, 0 , true);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, suivreSouris, false, 0, true);
			
		}
		
		private function suivreSouris(e:MouseEvent):void 
		{
			this.viseur.x = mouseX;
			this.viseur.y = mouseY;
			
			
		}
		
		private function bougerObjet(e:KeyboardEvent):void 
		{
			
			//jeu.tank.code = e.keyCode;
			jeu.bougerObjet(e.keyCode);
			
		}
		
		private function arreterObjet(e:KeyboardEvent):void 
		{
			//jeu.tank.code = 0;
			jeu.arreterObjet();
			
		}
		
	}
	
}