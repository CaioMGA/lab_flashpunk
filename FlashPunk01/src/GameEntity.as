package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	/**
	 * ...
	 * @author Caio Marchi
	 */
	public class GameEntity extends Entity
	{
		[Embed(source="../lib/0.png")]
		private const IMAGE:Class;
		
		public function GameEntity() 
		{
			graphic = new Image(IMAGE);
			
			//customizing Keys on flashpunk
			Input.define("UP", Key.W, Key.UP);
			Input.define("DOWN", Key.S, Key.DOWN);
			Input.define("LEFT", Key.A, Key.LEFT);
			Input.define("RIGHT", Key.D, Key.RIGHT);
		}
		
		override public function update():void
		{
			//not so effective cheking keys technique
			//if (Input.check(Key.A) || Input.check(Key.LEFT))
			//{
				//x -= 50 * FP.elapsed;
			//}
			//else if (Input.check(Key.S) || Input.check(Key.DOWN))
			//{
				//y += 50 * FP.elapsed;
			//}
			//else if (Input.check(Key.D) || Input.check(Key.RIGHT))
			//{
				//x += 50 * FP.elapsed;
			//}
			//else if (Input.check(Key.W) || Input.check(Key.UP))
			//{
				//y -= 50 * FP.elapsed;
			//}
			
			//best way to check'em
			if (Input.check("UP"))
			{
				y -= 50 * FP.elapsed;
			}
			else if (Input.check("DOWN"))
			{
				y += 50 * FP.elapsed;
			}
			if ( Input.check("LEFT"))
			{
				x -= 50 * FP.elapsed;
			}
			else if ( Input.check("RIGHT"))
			{
				x += 50 * FP.elapsed;
			}
		}
		
	}

}