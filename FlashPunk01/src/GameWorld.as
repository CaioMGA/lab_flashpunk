package  
{
	import net.flashpunk.World;
	/**
	 * ...
	 * @author Caio Marchi
	 */
	public class GameWorld extends World
	{
		
		private var _gameEntity:GameEntity;
		
		public function GameWorld() 
		{
			_gameEntity = new GameEntity();
			add(_gameEntity);
			
		}
		
	}

}