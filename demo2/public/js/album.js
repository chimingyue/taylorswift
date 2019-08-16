 //��������DOM����
//����Ҫ�޸ĵ�Ԫ��
window.onload=function(){
    new Vue({
        el:"#allalbum",
        data() {
            return {
                currentSrc:"",
                currentIndex:0,
                album_song_list:[],
                album_list:[],
                album_info_list:[],
                song_commend_list:[],
                commend_text:"When we have the first kiss,we never imagine that someday it could turn into the last kiss...",
                times:0,
                like:"img/button/support.png",
                like2:"img/button/support2.png"
            }
        },
        created() {
                if(location.href!==""){
                    var aid=location.href.split("=")[1];
                    var obj={aid:aid}
                    axios.get("http://127.0.0.1:3000/album",{params:obj}).then(result=>{
                        this.album_song_list=result.data;
                    })
                    axios.get("http://127.0.0.1:3000/album_info",{params:obj}).then(result=>{
                        this.album_info_list=result.data;
                    })
                    axios.get("http://127.0.0.1:3000/commend").then(result=>{
                        this.song_commend_list=result.data;
                    })
                }
        },
        methods: {
            play(i){
                this.currentSrc=this.album_song_list[i].album_song_audio;
                this.currentIndex = i+1; 
            },
            commend(){
                if(!this.commend_text){
                    alert("说些什么再评论吧");
                }else{
                    var t=new Date().getTime();
                    var text=this.commend_text;
                    var uid=sessionStorage.getItem("uid");
                    if(!uid){
                        alert("请登录后评论");
                    }else{
                        var obj={uid:uid}
                        axios.get("http://127.0.0.1:3000/user",{params:obj}).then(result=>{
                            var res=result.data.data;
                            var commend_user=res[0].uname;
                            var commend_avatar=res[0].avatar;
                            var obj2={commend_user:commend_user,commend_avatar:commend_avatar,commend:text,commend_time:t,commend_like:0}
                            //更新最新评论的接口
                            axios.get("http://127.0.0.1:3000/update_commend",{params:obj2}).then(result=>{
                                if(result.data.code==1){
                                    axios.get("http://127.0.0.1:3000/commend").then(result=>{
                                        this.song_commend_list=result.data;
                                        alert("评论成功");
                                        this.commend_text="";
                                    })
                                }else{
                                    alert("请重试");
                                }
                                
                            })
                        })
                    }
                }
            },
            commend_like(item,i){
                this.times++;
                if(this.times%2!==0){
                    item.commend_like++;
                    // this.refs.support.src="img/button/support2.png"
                }else{
                    item.commend_like--;
                }
            }
        },
    })


    //����
    var as=document.getElementsByClassName("count");
    for(var a of as){
        (function(){
            var i= parseInt( a.textContent.slice(1,-1) );
            //���¼�
            a.onclick=function(){
                this.innerHTML=`<img class="mr-1" src="img/button/support.png" alt=""/>(${++i})`;
            }
        })()
    }
    //����������
    var textarea=document.querySelector("textarea");
    textarea.onfocus=function(){
        textarea.innerHTML="";
    }
    textarea.onblur=function(){
        textarea.innerHTML="When we have the first kiss,we never imagine that someday it could turn into the last kiss...";
    }
    //��ҳ��

}


