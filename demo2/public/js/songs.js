window.onload=function (){
    new Vue({
        el:"#song",
        data:{
            singer_list:[],
            related_singer_list:[],
            carousel_list:[],
            currentSrc:"",
            currentIndex:0
        },
        created() {
            axios.get("http://127.0.0.1:3000/songs").then(result=>{
                this.singer_list=result.data;
            }),
            axios.get("http://127.0.0.1:3000/related").then(result=>{
                this.related_singer_list=result.data;
            })
        },
        methods: {
            play(i){
                this.currentSrc=this.singer_list[i].album_song_audio;
                this.currentIndex = i+1; 
            }
        },
    })
    var a=document.querySelector(".my_dropdown>a");
    (function(){
        var ul=document.querySelector(".my_dropdown>ul");
        a.onclick=function(e){
            e.stopPropagation();
            ul.style.height!=="0px"? ul.style.height="0px":ul.style.height="113px"
        }
        window.onclick=function(){
            ul.style.height="0px";
        }
    })()
    //轮播
    var i=0;
    var LIWIDTH=265;
    var DURATION=2000;
    var LICOUNT=4;
    var ulImgs=document.getElementById("ul-imgs");
    var ulIdxs=document.getElementById("ul-idxs");
    var lis=ulIdxs.children;
    function moveTo(to){
        if(to==undefined){
            to=i+1;
        }
        if(i==0){
            if(to>i){
                ulImgs.className="mytransition";
            }else{
                ulImgs.className="";
                ulImgs.style.marginLeft=-LIWIDTH*LICOUNT+"px";
                setTimeout(function(){
                    moveTo(LICOUNT-1);
                },100);
                return;
            }
        }
        i=to;
        ulImgs.style.marginLeft=-i*LIWIDTH+"px";
        for(var li of lis){
            li.className="";
        }
        if(i==LICOUNT){
            i=0;
            setTimeout(function(){
                ulImgs.className="";
                ulImgs.style.marginLeft=0;
            },DURATION)
        }
        lis[i].className="active";
    }

    var btnLeft=document.getElementById("btn-left");
    var btnRight=document.getElementById("btn-right");
    var canClick=true;
    btnRight.onclick=function(){
        move(1);
    }
    function move(n){
        if(canClick){
            moveTo(i+n);
            canClick=false;
            setTimeout(function(){
                canClick=true;
            },DURATION+100)
        }
    }
    btnLeft.onclick=function(){
        move(-1);
    }
    var interval=3000;
    var timer=setInterval(function(){
        moveTo()
    },3000);
    var banner=document.getElementById("banner");
    banner.onmouseover=function(){
        clearInterval(timer);
    }
    banner.onmouseout=function(){
        timer=setInterval(function(){
            moveTo()
        },3000)
    }
    var ulIdxs=document.getElementById("ul-idxs");
    var canClick=true;
    ulIdxs.onclick=function(e){
        if(canClick){
            var li=e.target;
            if(li.nodeName=="LI"){
                if(li.className!=="active"){
                    for(var i=0;i<lis.length;i++){
                        if(lis[i]==li){
                            break;
                        }
                    }
                    moveTo(i);
                    setTimeout(function(){
                        canClick=true;
                    },DURATION);
                }
            }
        }
    }
}
