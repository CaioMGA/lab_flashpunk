package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Caio Marchi
	 */
	public class GameWorld extends World
	{
		private var _gameEntity:GameEntity;
		
		[Embed(source="../lib/1.png")]
		private const IMAGE:Class;
		
		public function GameWorld() 
		{
			_gameEntity = new GameEntity();
			add(_gameEntity);
			
			addGraphic(new Image(IMAGE), 0, 0, 32);
			
		}
		override public function update():void
		{
			super.update();
			
			var entityArray:Array = [];
			
			getType("GameEntity", entityArray);
			for each(var entity:Entity in entityArray)
			{
				entity.x = entity.x > 550 ? 550 : entity.x;
				entity.y = entity.y > 400 ? 400 : entity.y;
				entity.x = entity.x < 0 ? 0 : entity.x;
				entity.y = entity.y < 0 ? 0 : entity.y;
			}
		}
	}
}