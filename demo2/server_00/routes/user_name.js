const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get("/",(req,res)=>{
    var uname=req.query.uname;
    if(!uname){
        res.send("用户名错误");
        return;
    }
    var sql='SELECT * FROM user where uname=?';
    pool.query(sql,[uname],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:-1});
        }else{
            res.send({code:1});
        }
    })
})

module.exports=router;