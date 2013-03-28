package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Caio Marchi
	 */
	
	
	public class GameWorld extends World
	{
		private var _gameEntity:GameEntity;
		private var _box:Box;
		private var _button:Button;
		
		[Embed(source="../lib/1.png")]
		private const IMAGE:Class;
		
		[Embed(source="../lib/button.png")]
		private const BUTTONSHEET:Class;
		
		public function GameWorld() 
		{
			_gameEntity = new GameEntity();
			_box = new Box();
			_button = new Button(onButtonClick, null);
			
			_button.setSpritemap(BUTTONSHEET, 64, 64);
			add(_gameEntity);
			add(_box);
			add(_button);
			
			_button.x = 400;
			_button.y = 200;
			
			_box.x = 200;
			_box.y = 150;
			
			addGraphic(new Image(IMAGE), 0, 0, 32);
			
		}
		
		private function onButtonClick():void
		{
			FP.screen.color = Math.random() * 0xFFFFFF;
			
			trace("Botão pressionado! <o> \\o/ <o>");
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
			if (_gameEntity.collideWith(_box, _gameEntity.x, _gameEntity.y))
			{
				_gameEntity.x = _gameEntity.y = 0;
			}
		}
	}
}