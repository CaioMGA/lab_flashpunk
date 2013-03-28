package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author Caio Marchi
	 */
	public class Button extends Entity
	{
		protected var _map:Spritemap;
		
		protected var _callback:Function;
		protected var _argument:*;
		
		public function Button(callback:Function, argument:*, x:Number=0, y:Number=0) 
		{
			super(x, y);
			
			_callback = callback;
			_argument = argument;
		}
		public function setSpritemap(asset:*, frameW:uint, frameH:uint):void
		{
			_map = new Spritemap(asset, frameW, frameH);
			
			_map.add("Up", [0]);
			_map.add("Over", [1]);
			_map.add("Down", [2]);
			
			graphic = _map;
			
			setHitbox(frameW, frameH);
		}
		
		protected var _over:Boolean;
		protected var _clicked:Boolean;
		
		override public function update():void
		{
			if (!world)
			{
				return;
			}
			_over = false;
			_clicked = false;
			
			if (collidePoint(x - world.camera.x, y - world.camera.y, Input.mouseX, Input.mouseY))
			{
				if (Input.mouseReleased)
				{
					clicked();
				}
				if (Input.mouseDown)
				{
					mouseDown();
				}
				else
				{
					mouseOver();
				}
			}
		}
		
		protected function clicked():void
		{
			if (!_argument)
			{
				_callback();
			}
			else
			{
				_callback(_argument);
			}
		}
		
		protected function mouseOver():void
		{
			_over = true;
		}
		
		protected function mouseDown():void
		{
			_clicked = true;
		}
		
		override public function render():void
		{
			if (_clicked)
			{
				_map.play("Down");
			}
			else if (_over)
			{
				_map.play("Over");
			}
			else
			{
				_map.play("Up");
			}
			super.render();
		}
	}
}