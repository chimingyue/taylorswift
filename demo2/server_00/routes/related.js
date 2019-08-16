const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get("/",(req,res)=>{
  var sql='SELECT * FROM related_singers';
  pool.query(sql,[],(err,result)=>{
    if(err){
      console.log(err);
    }else{
      res.send(result);
    }
  })
})

module.exports=router;