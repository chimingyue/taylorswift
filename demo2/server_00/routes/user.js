const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get("/",(req,res)=>{
	var uid=req.query.uid;
	if(!uid){
		res.send({code:0,msg:"请登录后评论"});
		return;
	}
	pool.query("select * from user where uid=?",[uid],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
    		res.send({code:1,data:result});
		}else{
			res.send({code:-1});
		}
	});
});

//导出路由器
module.exports=router;