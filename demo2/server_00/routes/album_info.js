const express=require("express")
const router=express.Router();
const pool=require("../pool");

router.get("/",(req,res)=>{
    var aid=req.query.aid ;
    var sql=`SELECT cover,a_name,singer,time_out,corporation,album_intro,songs_count FROM album WHERE aid=?`;
    pool.query(sql,[aid],(err,result)=>{
        if(err){
        console.log(err);
        res.send({code:0});
        }else{
        res.send(result);
        }
    })
})

module.exports=router;