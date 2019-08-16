//点赞，评论，转发的dom操作
//查找要绑定事件的元素li
var lis=document.querySelectorAll(".my_moment ul>li:first-child");
//绑定事件
for(var li of lis){
    (function(){
        var i=parseInt( li.textContent.slice(3,-1) );
        var msg=li.textContent.slice(0,3);
        li.onclick=function(){
            this.innerHTML=`<li><a href="javascript:;" class="my_font text-primary mr-2">${msg}${++i})</a></li>`;
        }
    })()
}