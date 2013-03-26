package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Caio Marchi
	 */
	public class GameEntity extends Entity
	{
		[Embed(source = "../../../../lib/ICONE.png")]
		private const IMAGE:Class;
		public function GameEntity() 
		{
			graphic = new IMAGE(IMAGE);
		}
		
	}

}