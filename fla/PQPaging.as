package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class PQPaging extends MovieClip {		
		private var _currentPage:int=0;//当前页
		private var pageNum:int=0;//数据总页数
		private var sNum:int=0;//显示几个按钮
		private var gNum:int=0;//每页几条数据
		private var pagePage:int=0;//分页按钮当前页索引
		private var pagePageNum:int=0;//分页按钮总页数
		
		private var pageData:Array=[];
		private var page:Array=[];
		private var setPage:Function;
		public function PQPaging() {
		}
		public function bindData(contact:Function,data:Array=null,pageNumber:int=0,itemNum:int=10,showNum:int=10):void{
			gNum=itemNum;
			setPage=contact;
			sNum=showNum;
			pageNum=pageNumber;
			if(data)pagingData(copyArray(data));
			else pagePageNum=Math.round(pageNum / sNum+0.4);
			initBtn();
		}
		public function getPageData(page:int):Array{
			return copyArray(pageData[page]);
		}
		private function initBtn():void{
			resetBtn();
			if(pageNum>sNum){
				var pn:int=sNum;
				if(pagePage==pagePageNum-1&&pageNum%sNum!=0)pn=pageNum%sNum;
				var sp:int=pagePage*sNum;
				for(var i:int=0;i<pn;i++){
					createBtn(i,(sp+i+1).toString());
					page[i].x=i*(page[i].width+3)+(pagePage==0?0:page[i].width+3);
				}
				if(pagePage<pagePageNum-1){
					createBtn(pn,">>");
					page[pn].x=page[pn-1].x+page[pn-1].width+3;
				}
				if(pagePage>0){
					createBtn(pn+1,"<<");
					page[pn+1].x=0;
				}
			}else{
				for(var j:int=0;j<pageNum;j++){
					page[j]=new pageBtn();
					page[j].buttonMode=true;
					page[j].x=j*(page[j].width+2);
					page[j].txt_num.htmlText=(j+1).toString();
					addChild(page[j]);
					page[j].addEventListener(MouseEvent.MOUSE_UP,pageChange);
				}
			}
		}
		private function createBtn(i:int,str:String):void{
			if(!page[i])page[i]=new pageBtn();
			page[i].buttonMode=true;
			page[i]["txt_num"].text=str;
			if(String(_currentPage+1)==str)page[i].gotoAndStop(2);
			addChild(page[i]);
			page[i].addEventListener(MouseEvent.MOUSE_UP,pageChange);
		}
		private function resetBtn():void{
			var n:int=page.length;
			for(var i:int=0;i<n;i++){
				if(this.contains(page[i]))removeChild(page[i]);
			}
		}
		private function pagingData(data:Array):void{
			var n:int=data.length;
			if(n<1){
				pageData=[];
				this.visible=false;
			}
			else this.visible=true;
			pageNum = n%gNum==0?n/gNum:(Math.round(n / gNum+0.5));
			pagePageNum=Math.round(pageNum / sNum+0.4);
			for(var i:int=0;i<pageNum;i++){
				pageData[i]=[];
				for(var j:int=0;j<gNum;j++){
					if(j+i*gNum+1>n)return;
					if(data.length<1)return;
					pageData[i].push(data.shift());
				}
			}
		}
		private function pageChange(e:MouseEvent):void{
			page[_currentPage%10].gotoAndStop(1);
			if(e.target.txt_num.text==">>"){
				if(pagePage>pagePageNum-1)return;
				pagePage++;
				initBtn();
			}else if(e.target.txt_num.text=="<<"){
				if(pagePage<1)return;
				pagePage--;
				initBtn();
			}else{
				_currentPage=int(e.target.txt_num.text)-1;
				e.target.gotoAndStop(2);
				setPage.apply(null,[_currentPage+1,pageData[_currentPage]]);
			}
		}
		private function copyArray(fromArr:Array):Array{
			if(fromArr==null)return [];
			var res:Array=[];
			var n:int=fromArr.length;
			for(var i:int=0;i<n;i++){
				if(fromArr[i] is Array){
					res.push(copyArray(fromArr[i]));
				}else{
					res.push(fromArr[i]);
				}
			}
			return res;
		}
		
		public function get currentPage():int
		{
			return _currentPage;
		}
		
	}
	
}
