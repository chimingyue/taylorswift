const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get("/",(req,res)=>{
  var aid=req.query.aid ;
  var sql='SELECT album_song_audio,album_song_name,album_song_time,album_song_singer FROM album_songs WHERE album_id=?';
  pool.query(sql,[aid],(err,result)=>{
    if(err){
      console.log(err);
    }else{
      res.send(result);
    }
  })
})

module.exports=router;
