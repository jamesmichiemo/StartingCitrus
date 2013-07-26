package
{
	import Box2D.Dynamics.Contacts.b2Contact;
	
	import com.citrusengine.core.CitrusEngine;
	import com.citrusengine.core.StarlingState;
	import com.citrusengine.math.MathVector;
	import com.citrusengine.objects.platformer.box2d.Coin;
	import com.citrusengine.objects.platformer.box2d.Crate;
	import com.citrusengine.objects.platformer.box2d.Enemy;
	import com.citrusengine.objects.platformer.box2d.Hero;
	import com.citrusengine.objects.platformer.box2d.Platform;
	import com.citrusengine.physics.box2d.Box2D;
	
	import flash.geom.Rectangle;
	
	public class StarlingDemoGameState extends StarlingState
	{
		
		private var _ce:CitrusEngine;
		
		public function StarlingDemoGameState()
		{
			super();
			_ce = CitrusEngine.getInstance();
		}
		
		override public function initialize():void
		{
			super.initialize();
			
			var box2D:Box2D = new Box2D("box2D");
			box2D.visible = true;
			add(box2D);
			
			add(new Platform("bottom", {x:350, y:stage.stageHeight-50, height:100, width:700}));
			add(new Platform("water", {x:stage.stageWidth / 2, y:stage.stageHeight, width:100000}));
			add(new Platform("port", {x:0, y:250, height:2000, width:100}));
			add(new Platform("cloud", {x:250, y:250, width:170, oneWay:true}));
			                                                  // step:5
			var coin:Coin = new Coin("coin", {x:360, y:500/*, view:"levels/SoundPatchDemo/jewel.png"*/});
			add(coin);
			coin.onBeginContact.add(coinTouched);
			
			var hero:Hero = new Hero("hero", {x:100, y:350, width:60, height:135});
			add(hero);
			hero.onGiveDamage.add(heroAttack);
			hero.onTakeDamage.add(heroHurt);
			
			var enemy:Enemy = new Enemy("enemy", {x:stage.stageWidth - 50, y:350, width:46, height:68, leftBound:20, rightBound:stage.stageWidth - 20});
			add(enemy);
			
			var block:Crate = new Crate("crate", {x:400, y:350, width:100, height:100});
			
			
			
			view.setupCamera(hero, new MathVector(stage.stageWidth / 2, stage.stageHeight / 2), new Rectangle(0, 0, 10000, 450), new MathVector(.25, .05));
			
			// Step:5 For animations embed art and xml and create an AnimationSequence
			/*[Embed(source="/../embed/Hero.xml", mimeType="application/octet-stream")]
			
			private var _heroConfig:Class;
			
			[Embed(source="/../embed/Hero.png")]
			
			private var _heroPng:Class;
			
			var bitmap:Bitmap = new _heroPng();
			var texture:Texture = Texture.fromBitmap(bitmap);
			var xml:XML = XML(new _heroConfig());
			var sTextureAtlas:TextureAtlas = new TextureAtlas(texture, xml);
			
			hero.view = new AnimationSequence(sTextureAtlas, ["walk", "duck", "idle", "jump", "hurt"], "idle");*/
		}
		
		private function heroHurt():void
		{
			_ce.sound.playSound("Hurt",1,0);
			trace("trigger hero hurt sound");
		}
		
		private function heroAttack():void
		{
			_ce.sound.playSound("Kill",1,0);
			trace("trigger hero attack sound");
		}
		
		private function coinTouched(contact:b2Contact):void
		{
			trace('coin touched by an object');
		}
		
	}
}