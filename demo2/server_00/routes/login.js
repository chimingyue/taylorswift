const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.post("/",(req,res)=>{
	var n=req.body.uname;
	var p=req.body.upwd;
	if(!n){
		res.send("用户名错误");
		return;
	}
	if(!p){
		res.send("用户密码错误");
		return;
	}
	pool.query("select * from user where uname=? and upwd=?",[n,p],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
    		res.send({code:1,uid:result[0].uid});
		}else{
			res.send({code:-1});
		}
	});
});

//导出路由器
module.exports=router;