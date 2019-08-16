const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get("/",(req,res)=>{
  var obj=req.query;
  var sql='INSERT INTO song_commend SET ?';
  pool.query(sql,[obj],(err,result)=>{
    if(err){
      console.log(err);
    }else{
        if(result.affectedRows>0){
            res.send({code:1});
         }else{
           res.send({code:-1});
         }
    }
  })
})
module.exports=router;