package  
{
	import flash.display.DisplayObject;
	/**
	 * ...
	 * @author Ken Bourgoin
	 */
	public class Trigo 
	{
		
		public function Trigo() 
		{
			
		}
	
		public static function calculerDistance(premier:DisplayObject, deuxieme:DisplayObject):Number
		{
			var distanceX:Number = premier.x - deuxieme.x;
			var distanceY:Number = premier.y - deuxieme.y;
			
			return Math.sqrt(Math.pow(distanceX, 2) + Math.pow(distanceY, 2));
		}
		
		public static function deg2rad(deg:Number):Number
		{
			return deg * (Math.PI / 180);
		}
		
		public static function rad2deg(rad:Number):Number
		{
			return rad  * (180 / Math.PI);
		}
		
		public static function retourneVitesseX(vitesse:Number, angle:Number):Number
		{
			var radian:Number = deg2rad(angle); //convertir mon angle en radian pour les calculs
			
			return Math.cos(radian) * vitesse;
		}
		
		public static function retourneVitesseY(vitesse:Number, angle:Number):Number
		{
			var radian:Number = deg2rad(angle); //convertir mon angle en radian pour les calculs
			
			return Math.sin(radian) * vitesse;
		}
		
		public static function retourneAngle2Objets(distanceX:Number, distanceY:Number):Number
		{
			return rad2deg(Math.atan2(distanceY, distanceX));
		}
	}
}