new Vue({
     el:"#allindex",
     data() {
         return {
             singer_list:[],
             intro_album_list:[],  //单独接口
             album_list:[],        //0-7
             single_list:[],        //8-15
             uname:"",
             upwd:'',
             phone:""
         }
     },
     created() {
         axios.get("http://127.0.0.1:3000/index").then(result=>{
             this.album_list=result.data.slice(0,8);
             this.single_list=result.data.slice(8);
             this.intro_album_list=result.data.slice(1,5);
         })
         axios.get("http://127.0.0.1:3000/singer").then(result=>{
            this.singer_list=result.data;
         })
     }
 })
window.onload=function(){
    var verifyCode = new GVerify("v_container");
    (function(){
        //轮播图
        $.ajax({
            url:"http://localhost:3000/carousel",
            type:"get",
            //无请求参数
            dataType:"json"
        }).then(function(result){
            var carousel1=result[0];
            var html=`
            <a href="album.html" >
                <img src="${carousel1.img}" class="w-100"/>
            </a>`;
            document.getElementById("carousel1").innerHTML=html;
            var carousel2=result[1];
            var html=`
            <a href="album.html" >
                <img src="${carousel2.img}" class="w-100"/>
            </a>`;
            document.getElementById("carousel2").innerHTML=html;
            var carousel3=result[2];
            var html=`
            <a href="album.html" >
                <img src="${carousel3.img}" class="w-100"/>
            </a>`;
            document.getElementById("carousel3").innerHTML=html;
            var carousel4=result[3];
            var html=`
            <a href="album.html" >
                <img src="${carousel4.img}" class="w-100"/>
            </a>`;
            document.getElementById("carousel4").innerHTML=html;
            var carousel5=result[4];
            var html=`
            <a href="album.html" >
                <img src="${carousel5.img}" class="w-100"/>
            </a>`;
            document.getElementById("carousel5").innerHTML=html;
            var carousel6=result[5];
            var html=`
            <a href="album.html" >
                <img src="${carousel6.img}" class="w-100"/>
            </a>`;
            document.getElementById("carousel6").innerHTML=html;
        })
        var i=0;
        var register=document.querySelector(".breadcrumb>li:first-child");
        var rdiv=document.querySelector(".position-fixed#regsite");
        var registe=document.querySelector("#regsite #register");
        var login=document.querySelector(".breadcrumb>li:last-child");
        var ldiv=document.querySelector(".position-fixed#login");
        register.onclick=function(){
            rdiv.style.display="block";
            rdiv.style.zIndex=i;
        }
        /*直接点击登录弹出登录界面*/
        login.onclick=function(){
            i++;
            ldiv.style.display="block";
            ldiv.style.zIndex=i;
        }
        /*×*/
        var closes=document.querySelectorAll(".position-fixed .float-right");
        for(var close of closes){
            close.onclick=function(){
                var div=this.parentNode.parentNode;
                div.style.display="none";
            }
        }
        /*没有账号去注册*/
        var a=document.querySelector(".position-fixed#login div>a")
        a.onclick=function(){
            i++;
            rdiv.style.display="block";
            rdiv.style.zIndex=i;
            ldiv.style.display="none";
        }
        /*已有账号，直接登录 */
        var a=document.querySelector(".position-fixed#regsite div>a")
        a.onclick=function(){
            i++;
            ldiv.style.display="block";
            ldiv.style.zIndex=i;
            rdiv.style.display="none";
        }
    })()	
}












        

