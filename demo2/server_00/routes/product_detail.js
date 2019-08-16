const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get("/",(req,res)=>{
    var pid=req.query.pid;
    var sql='SELECT * FROM product where pid=?';
    pool.query(sql,[pid],(err,result)=>{
        if(err){
        console.log(err);
        }else{
        res.send(result);
        }
    })
})

module.exports=router;