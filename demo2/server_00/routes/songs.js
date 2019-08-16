const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get("/",(req,res)=>{
  var sql='SELECT * FROM album_songs where is_recommend=1';
  pool.query(sql,[],(err,result)=>{
    if(err){
      console.log(err);
    }else{
      res.send(result);
    }
  })
})

module.exports=router;