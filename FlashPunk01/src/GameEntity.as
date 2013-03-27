package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	/**
	 * ...
	 * @author Caio Marchi
	 */
	public class GameEntity extends Entity
	{
		[Embed(source="../lib/icaro_sprite_5x1.png")]
		private const SHEET:Class;
		
		private var _timeInterval:Number;
		
		public function GameEntity() 
		{
			graphic = new Spritemap(SHEET, 32, 32, onAnimationEnd);
			Spritemap(graphic).add("Stopped", [0]);//mexer nisso depois
			Spritemap(graphic).add("Flying", [0, 1, 2, 3, 4], 8);
			
			//customizing Keys on flashpunk
			Input.define("UP", Key.W, Key.UP);
			Input.define("DOWN", Key.S, Key.DOWN);
			Input.define("LEFT", Key.A, Key.LEFT);
			Input.define("RIGHT", Key.D, Key.RIGHT);
			
			type = "GameEntity";
			Spritemap(graphic).play("Flying");
		}
		private function onAnimationEnd():void
		{
			Spritemap(graphic).play("Stopped");
			_timeInterval = 0;
		}
		
		
		override public function update():void
		{
			_timeInterval += FP.elapsed;
			
			if (_timeInterval >= 0.2)
			{
				Spritemap(graphic).play("Flying");
			}
			
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
		
		override public function added():void
		{
			trace("The entity has been added to the world");
			trace("Entity in the world: " + world.count);
		}
		
		override public function removed():void
		{
			trace("The entity has been removed from the world!");
		}
		
	}

}