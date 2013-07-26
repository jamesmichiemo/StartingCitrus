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
			
			// the room with no cieling
			add(new Platform("water", {x:stage.stageWidth / 2, y:stage.stageHeight + 16, width:100000}));
			add(new Platform("port", {x:0, y:250, height:2000, width:100}));
			add(new Platform("starboard", {x:7000, y:250, height:2000, width:100}));
			
			
			add(new Platform("floor1a", {x:350, y:stage.stageHeight-50, height:100, width:700}));	
			add(new Platform("floor1b", {x:1155, y:stage.stageHeight-50, height:100, width:500}));
			add(new Platform("floor1c", {x:2255, y:stage.stageHeight-50, height:100, width:600}));
			add(new Platform("floor1d", {x:2655, y:stage.stageHeight-100, height:200, width:200}));
			add(new Platform("floor1e", {x:3155, y:stage.stageHeight-100, height:400, width:800}));
			add(new Platform("floor1f", {x:5155, y:stage.stageHeight-50, height:100, width:1500}));
			add(new Platform("floor1g", {x:5155, y:stage.stageHeight-100, height:200, width:400}));
			add(new Platform("floor1h", {x:6455, y:stage.stageHeight-50, height:100, width:600}));
			add(new Platform("floor1i", {x:6855, y:stage.stageHeight-100, height:900, width:300}));
			
			 
			add(new Platform("cloud1", {x:500, y:400, height:100, width:600, oneWay:true}));
			add(new Platform("cloud2", {x:2500, y:250, height:100, width:300, oneWay:true}));
			add(new Platform("cloud3", {x:4000, y:stage.stageHeight-50, height:40, width:300, oneWay:true})); 
			add(new Platform("cloud4", {x:5800, y:400, height:100, width:300, oneWay:true}));
			add(new Platform("cloud5", {x:6400, y:300, height:100, width:400, oneWay:true}));
			                                                  // step:5
			var coin:Coin = new Coin("coin", {x:360, y:500/*, view:"levels/SoundPatchDemo/jewel.png"*/});
			add(coin);
			coin.onBeginContact.add(coinTouched);
			
			var hero:Hero = new Hero("hero", {x:300, y:350, width:30, height:90});
			add(hero);
			hero.onGiveDamage.add(heroAttack);
			hero.onTakeDamage.add(heroHurt);
			
			add(new Enemy("enemy1", {x:500, y:350, width:46, height:68, leftBound:5, rightBound:10}));
			add(new Enemy("enemy2", {x:5300, y:350, width:46, height:68, leftBound:5, rightBound:10}));
			add(new Enemy("enemy3", {x:6000, y:350, width:46, height:68, leftBound:5, rightBound:10}));
			
			
			add(new Crate("crate1", {x:400, y:350, width:100, height:100}));
			add(new Crate("crate2", {x:200, y:350, width:100, height:100}));
			add(new Crate("crate3", {x:1100, y:350, width:100, height:100}));
			add(new Crate("crate4", {x:2200, y:350, width:100, height:100}));
			add(new Crate("crate5", {x:2600, y:350, width:100, height:100}));
			add(new Crate("crate6", {x:3100, y:350, width:100, height:100}));
			add(new Crate("crate7", {x:5000, y:350, width:100, height:100}));
			add(new Crate("crate8", {x:5100, y:350, width:100, height:100}));
			add(new Crate("crate9", {x:5500, y:350, width:100, height:100}));
			add(new Crate("crate10", {x:6400, y:350, width:100, height:100}));
			
			
			
			
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