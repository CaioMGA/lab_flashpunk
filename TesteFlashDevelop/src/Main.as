package 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * ...
	 * @author Caio Marchi
	 */
	[Frame(factoryClass="Preloader")]
	public class Main extends Sprite 
	{
		[Embed(source="../lib/0.png")]
		public var ImagemTeste:Class;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			trace("Dig-din-dig-din-dig-din");
			var imagemTeste:Bitmap = new ImagemTeste();
			addChild(imagemTeste);
		}

	}

}