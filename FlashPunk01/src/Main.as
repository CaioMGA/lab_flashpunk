package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Caio Marchi
	 */
	[Frame(factoryClass="Preloader")]
	public class Main extends Engine
	{
		private var _gameWorld:GameWorld;
		
		public function Main():void 
		{
			super(550, 400, 30, false);
			_gameWorld = new GameWorld();
		}
		
		override public function init():void
		{
			trace("The game has started! lol");
			FP.world = _gameWorld;
			//console com FPS, e outras informações úteis
			FP.console.enable();
			FP.log("Começou o Jogo!");
		}
	}

}