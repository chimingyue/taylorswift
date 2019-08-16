window.onload=function(){
    new Vue({
        el:"#allproduct",
        data:{
            product_core_list:[],
            product_carousel_list:[]
        },
        created() {
            axios.get("http://127.0.0.1:3000/product").then(result=>{
                for(var i=0;i<16;i++){
                    var product_core_list=result.data.slice(0,i);
                }
                this.product_core_list=product_core_list;
            })
        },
    })

    // 商品轮播
    var pleft=document.querySelector(".btn-left");
    var pright=document.querySelector(".btn-right");
    var ul=document.querySelector("#myul");
    var lis=document.querySelectorAll(".carousel_product>.list-unstyled li");
    var times=0;
    if(times==0){
        pleft.setAttribute("disabled","disabled");
    }
    pright.onclick=function(){
        if(!pright.hasAttribute("disabled")){
            times++;
            ul.style.marginLeft=-times*217+"px";
            pleft.removeAttribute("disabled");
            if(times==lis.length-5){
                pright.setAttribute("disabled","disabled")
            }
        }
    }
    pleft.onclick=function(){
        if(!pleft.hasAttribute("disabled")){
            times--;
            ul.style.marginLeft=-times*217+"px";
            pright.removeAttribute("disabled");
            if(times==0){
                pleft.setAttribute("disabled","disabled")
            }
        }
    }
}