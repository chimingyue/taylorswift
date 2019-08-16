const express=require("express")
const router=express.Router();
const pool=require("../pool");
//app.js: "/index"
//自己:          "/"
//完整地址: /index/
router.get("/",(req,res)=>{
  var sql=`SELECT cover,a_name,album_href FROM album`;
  pool.query(sql,[],(err,result)=>{
    if(err){
      console.log(err);
      res.send({code:0});
    }else{
      res.send(result);
    }
  })
})

module.exports=router;