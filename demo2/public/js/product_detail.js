new Vue({
    el:"#product_detail",
    data() {
        return {
            product_detail_list:[]
        }
    },
    created() {
        if(location.href!==""){
            var pid=location.href.split("=")[1];
            var obj={pid:pid}
            axios.get("http://127.0.0.1:3000/product_detail",{params:obj}).then(result=>{
                this.product_detail_list=result.data;
            })
        }
    },
})
window.onload=function (){
        var as=document.querySelectorAll("#details_a a");
        var span=document.querySelector("#total");
        for(var a of as){
            a.onclick=function(){
                var a=this;
                var input= a.parentNode.children[1];
                var n=parseInt(input.value);
                if(a.innerHTML=="+"){
                    n++;
                }else if(n>1){
                    n--;
                }
                    input.value=n;
                }
            }

            /*add to*/
            var a=as[0].parentNode.nextElementSibling;
            var cart=document.querySelector(".cart.position-fixed");
            var imgs=document.querySelectorAll(".myimg");
            var container=document.querySelector(".container");
            a.onclick=function(e){
                e.stopPropagation();
                cart.style.right="0px";
            }
            container.onclick=function(){
                cart.style.right="-33%";
            }
            /*购物车*/
            var ass=document.querySelectorAll(".position-fixed a.btn");
            for(var a of ass){
                a.onclick=function(){
                    var a=this;
                    var input= a.parentNode.children[3];
                    var n=parseInt(input.value);
                    if(a.innerHTML=="+"){
                        n++;
                    }else if(n>1){
                        n--;
                    }
                    input.value=n;
                    var price=parseFloat(input.parentNode.children[1].innerHTML.slice(1));
                    var t=n*price;
                    span.innerHTML=`$${t.toFixed(2)}`;
                }
            }

            //结算
            var p=span.parentNode;
                p.onclick=function(){
                    var account=document.querySelector(".account.position-fixed");
                    account.style.display="block";
                }
            var btn=document.querySelector(".btn-danger");
                btn.onclick=function(){
                    alert("ok");
                }
            var closes=document.querySelectorAll(".position-fixed .float-right");
                for(var close of closes){
                    close.onclick=function(){
                        var div=this.parentNode.parentNode;
                        div.style.display="none";
                    }
                }
}

