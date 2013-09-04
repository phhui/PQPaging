package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class Main extends Sprite
	{
		private var arr3:Array=["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100"];
		private var arr:Array=["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b","a","b"];
		private var arr2:Array=["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24"];
		private var arr1:Array=[];
		private var p:PQPaging;
		private var b:int=10;
		public function Main()
		{
			
			p=new PQPaging();
			p.y=300;
			p.bindData(changePage,arr2);
			addChild(p);
			var pb:pageBtn=new pageBtn();
			addChild(pb);
			pb.addEventListener(MouseEvent.CLICK,xx);
		}
		private function changePage(page:int,data:Array):void{
			trace(page+"-"+(data?data.length:0)+":"+data);
		}
		private function xx(e:MouseEvent):void{
			arr2.shift();
			p.bindData(changePage,arr2);
			trace(p.getPageData(0));
		}
	}
}