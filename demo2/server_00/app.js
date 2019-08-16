const express = require('express');
const bodyParser = require('body-parser');
//首页
const index=require("./routes/index");
const singer=require("./routes/singer");
const carousel=require("./routes/carousel");
const songs=require("./routes/songs");
const related=require("./routes/related");
const product=require("./routes/product");
const product_detail=require("./routes/product_detail");
const album_info=require("./routes/album_info");
const album=require("./routes/album");
const register=require("./routes/register");
const username=require("./routes/user_name");
const login=require("./routes/login");
const commend=require("./routes/commend");
const update_commend=require("./routes/update_commend");
const user=require("./routes/user");

const cors=require("cors");


var app = express();
var server = app.listen(3000);
//只写一次，就可以让整个服务端所有接口都支持跨域
app.use(cors({
    origin:"http://127.0.0.1:5500"
}))
//使用body-parser中间件
app.use(bodyParser.urlencoded({extended:false}));
//托管静态资源到public目录下
app.use(express.static('public'));
/*使用路由器来管理路由*/
app.use("/index",index);
app.use("/singer",singer);
app.use("/carousel",carousel);
app.use("/songs",songs);
app.use("/related",related);
app.use("/product",product);
app.use("/product_detail",product_detail);
app.use("/album_info",album_info);
app.use("/album",album);
app.use("/register",register);
app.use("/username",username);
app.use("/login",login);
app.use("/commend",commend);
app.use("/update_commend",update_commend);
app.use("/user",user);
