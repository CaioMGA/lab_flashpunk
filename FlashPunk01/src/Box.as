package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Caio Marchi
	 */
	public class Box extends Entity
	{
		[Embed(source = "../lib/wall.png")]
		private const IMAGE:Class;
		
		public function Box() 
		{
			graphic = new Image(IMAGE);
			
			setHitbox(64, 64);
		}
		
	}

}