const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.post("/",(req,res)=>{
  var obj=req.body;
  var sql='INSERT INTO user SET ?';
  pool.query(sql,[obj],(err,result)=>{
    if(err){
      console.log(err);
    }else{
        if(result.affectedRows>0){
            res.send({code:1,msg:"注册成功"});
         }else{
           res.send({code:-1,msg:"注册失败"});
         }
    }
  })
})


module.exports=router;