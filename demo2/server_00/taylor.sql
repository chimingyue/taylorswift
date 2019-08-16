SET NAMES UTF8;
DROP DATABASE IF EXISTS Taylor_Swift;
CREATE DATABASE Taylor_Swift CHARSET=UTF8;
USE Taylor_Swift;

/*歌手基本信息列表*/
CREATE TABLE singer_detail(
	did SMALLINT PRIMARY KEY AUTO_INCREMENT,
	d_img VARCHAR(128),
	name VARCHAR(30),
	country VARCHAR(20),
	birth VARCHAR(10),
	style VARCHAR(50),
	count SMALLINT,
	awards VARCHAR(500)
);

/*歌手动态发布*/
CREATE TABLE moment(
	mid INT PRIMARY KEY AUTO_INCREMENT,
	moment_content VARCHAR(500),
	moment_img1 VARCHAR(128),
	moment_img2 VARCHAR(128),
	moment_img3 VARCHAR(128),
	moment_img4 VARCHAR(128),
	moment_like VARCHAR(8),
	moment_commend VARCHAR(8),
	moment_share VARCHAR(8)
);

/*评论表*/
CREATE TABLE song_commend(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	commend_user VARCHAR(30),
	commend_avatar VARCHAR(128),
	commend VARCHAR(500),
	commend_time BIGINT,
	commend_like VARCHAR(8)
);

/*全部专辑列表*/
CREATE TABLE album(
	aid SMALLINT PRIMARY KEY AUTO_INCREMENT,
	cover VARCHAR(128),
	a_name VARCHAR(50),
	singer VARCHAR(50),
	time_out VARCHAR(10),
	corporation VARCHAR(50),
	album_intro VARCHAR(500),
	songs_count SMALLINT,
	album_href VARCHAR(128)
);

/*专辑歌曲列表*/
CREATE TABLE album_songs(
	a_sid SMALLINT PRIMARY KEY AUTO_INCREMENT,
	album_song_audio VARCHAR(50),
	album_song_name VARCHAR(50),
	album_song_time VARCHAR(10),
	album_song_singer VARCHAR(50),
	which_album VARCHAR(50),
	is_recommend TINYINT(1),
	album_id SMALLINT,
	FOREIGN KEY(album_id) REFERENCES album(aid)
);

/*图片轮播列表*/
CREATE TABLE carousel(
	img_id SMALLINT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(128),
	title VARCHAR(30),
	href VARCHAR(128)
);

/*相关歌手*/
CREATE TABLE related_singers(
	rid INT PRIMARY KEY AUTO_INCREMENT,
	related_singers_name VARCHAR(50),
	related_singers_img VARCHAR(128)
);

/*周边商品*/
CREATE TABLE product(
	pid INT PRIMARY KEY AUTO_INCREMENT,
	product_name VARCHAR(100),
	product_price VARCHAR(10),
	product_img VARCHAR(128),
	product_href VARCHAR(30),      #商品链接  detail.html?pid=1
	product_intro VARCHAR(128),
	product_material VARCHAR(50),
	surprise VARCHAR(200),
	note VARCHAR(200),
	right_owner VARCHAR(30),
	photo_by VARCHAR(50),
	manager VARCHAR(100),
	others VARCHAR(500)
);


/*用户列表*/
CREATE TABLE user(
	uid INT PRIMARY KEY AUTO_INCREMENT,
	uname VARCHAR(16),
	upwd VARCHAR(16),
	gender INT,
	phone VARCHAR(16),
	email VARCHAR(50),
	user_name VARCHAR(30),
	avatar VARCHAR(128)
);

/*插入歌手信息数据*/
INSERT INTO singer_detail VALUES(NULL,'img/detail/detail_img1.jpg','Taylor Swift','American','1989','country&pop',7,'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Excepturi suscipit voluptate vitae exercitationem molestias reprehenderit. Voluptas distinctio exercitationem fugit illum,Lorem ipsum dolor sit, amet consectetur adipisicing elit. Excepturi suscipit voluptate vitae exercitationem molestias reprehenderit. Voluptas distinctio exercitationem');

/*插入发布动态数据*/

/*插入发布评论数据*/
INSERT INTO song_commend VALUES(NULL,"chaochao","img/album/comment_fans.jpg","这是一首殿堂级的专辑，每一首歌的歌名连在一起犹如一个宣言：朋友，准备好了么？结束无聊的游戏吧，我做了一些所谓的坏事，别怪我哦！精致的生活，看看你对我做了什么，是你带我走向华美。不我不要，轰鸣的引擎啊，带我逃离聚光之下吧。手牵手跳着舞，但我仍属女王，即便衣衫褴褛，但请叫它完美新年！",1565006886817,22301);
INSERT INTO song_commend VALUES(NULL,"chaochao","img/album/comment_fans.jpg","喜欢霉霉已经九年了从2008年的love story认识她 那时候觉得怎么会有那么漂亮的女生 公主一样 就深深地爱上了她 如今都已经九年了，霉霉红爆全球了。她的前五张实体专辑我都买了惹，坐等《Reputation》到货。泰过爱你，勒此不疲",1565006886817,8995);
INSERT INTO song_commend VALUES(NULL,"chaochao","img/album/comment_fans.jpg","哇，一生只有一个泰勒斯威夫特，没有华丽的语言，只想说一句，霉霉我爱你！",1565006886817,5632);
INSERT INTO song_commend VALUES(NULL,"chaochao","img/album/comment_fans.jpg","我真的爱你 从Enchanted开始 不会结束从Reputation 见证你的成长！That is my girl Taylor Swift！！！",1565006886817,4021);
INSERT INTO song_commend VALUES(NULL,"chaochao","img/album/comment_fans.jpg","我个人还真的比较吃这种偏安静的歌，像《clean》《you are in love》《state of grace( acoustic)》《this love》《safe and sound》特别是夜晚，感觉好像可以抚平白天的伤痛，又好像一切激动不安都变成了平静。",1565006886817,3899);
INSERT INTO song_commend VALUES(NULL,"chaochao","img/album/comment_fans.jpg","时隔49天，继首单蜜皇的第二单你需要冷静。前几天和果子狸的和好，让大家以为二单会有个合作，不论是solo单曲还是合作，都好听。",1565006886817,2000);

/*插入全部专辑数据*/
INSERT INTO album VALUES(NULL,'img/album/img_cover1.jpg','Lover','Taylor Swift','2019-07-23','环球唱片','空降献礼！Taylor Swift 全新专辑『LOVER』中第五首曲目《The Archer》无预警首播，这是 Taylor Swift 新专正式发行的第三首单曲，由霉霉与Jack Antonoff 共同创作。','3','album.html?aid=1');
INSERT INTO album VALUES(NULL,'img/album/img_cover2.jpg','Reputation','Taylor Swift','2017-11-10','环球唱片','阔别三年， Taylor Swift第六张录音专辑《reputation》11月10日全球发行。专辑除Taylor一手监制外，再邀三座格莱美得主的御用搭档Jack Antonoff，金曲制单机Max Martin及Shellback等实力音乐人联袂操刀。','15','album.html?aid=2');
INSERT INTO album VALUES(NULL,'img/album/img_cover3.jpg','1989','Taylor Swift','2014-10-27','Big Machine Records','首单《Shake It Off》于2014年8月19日发行。第三波单曲《Welcome To New York》词曲部分由Taylor和OneRepublic主唱Ryan Tedder合作完成,灵感来源于霉霉之前从洛杉矶搬往纽约经历。','16','album.html?aid=3');
INSERT INTO album VALUES(NULL,'img/album/img_cover4.jpg','Red','Taylor Swift','2012-10-22','环球唱片','《泰勒史薇芙特:红》今年排行榜最流行的顏色：RED！创下全球2200万张专辑与5000万张数字下载单曲佳绩6座格莱美奖认证乡村吉他小天后。','16','album.html?aid=4');
INSERT INTO album VALUES(NULL,'img/album/img_cover5.jpg','Speak Now','Taylor Swift','2010-10-25','Big Machine Records','《Speak Now》是美国乡乐流行女歌手泰勒·斯威夫特的第三张录音室专辑，专辑监制由泰勒本人担任。发行首周便以104.7万张的销售记录，拿下公告牌二百强专辑榜冠军。','17','album.html?aid=5');
INSERT INTO album VALUES(NULL,'img/album/img_cover6.jpg','Fearless','Taylor Swift','2008-11-11','环球唱片','发行这张唱片的唱片公司，Big Machine Records的CEO在谈到这张白金版时说：“Taylor的歌迷对于她的新歌以及一切有着难以置信的期望。那张《Fearless》仅仅发行了几周就有200多万歌迷购买，然后他们开始要求Taylor的新作，而现在新作发行了。','13','album.html?aid=6');
INSERT INTO album VALUES(NULL,'img/album/img_cover7.jpg','Taylor Swift','Taylor Swift','2006-10-24','环球唱片','Three years ago, a 13-year old Taylor Swift set out to be a star and moved from Reading, Pennsylvania, to Nashville. By 14, she had a publishing deal, and by 15, a recording contract.','13','album.html?aid=7');
INSERT INTO album VALUES(NULL,'img/album/img_cover2.jpg','Reputation','Taylor Swift','2017-11-10','环球唱片','阔别三年， Taylor Swift第六张录音专辑《reputation》11月10日全球发行。专辑除Taylor一手监制外，再邀三座格莱美得主的御用搭档Jack Antonoff，金曲制单机Max Martin及Shellback等实力音乐人联袂操刀。','15','album.html?aid=8');
INSERT INTO album VALUES(NULL,'img/single/img_single7.jpg','ME!','Taylor Swift / Brendon Urie','2019-04-26','环球唱片','10座格莱美大奖得主Taylor Swift携新单“ME!”强势回归！单曲特邀Panic! At The Disco乐队主唱Brendon Urie助阵。','1','album.html?aid=9');
INSERT INTO album VALUES(NULL,'img/single/img_single8.jpg','You Need Calm Down','Taylor Swift','2019-06-14','环球唱片','Taylor Swift第二支先行单曲“You Need To Calm Down”今日发行，个人第七张录音室大碟《Lover》将于8月23日正式发布！','1','album.html?aid=10');
INSERT INTO album VALUES(NULL,'img/single/img_single1.jpg','22','Taylor Swift','2013-03-12','环球唱片',NULL,'1','album.html?aid=11');
INSERT INTO album VALUES(NULL,'img/single/img_single2.jpg','Sweeter Than Fiction','Taylor Swift','2013-10-21','环球唱片',NULL,'1','album.html?aid=12');
INSERT INTO album VALUES(NULL,'img/single/img_single3.jpg','We Are Never Ever Getting Back Together','Taylor Swift','2012-08-13','Big Machine Records, LLC','新专辑《Red》首只单曲。','1','album.html?aid=13');
INSERT INTO album VALUES(NULL,'img/single/img_single4.jpg','Love Story','Taylor Swift','2009-03-01','环球唱片','Australian enhanced CD pressing of the second single lifted from her 2008 album Fearless. Features four versions of Love Story (U.S. Pop Mix, U.S. Album Version, Digital Dog Radio Mix and Enhanced Video. ','1','album.html?aid=14');
INSERT INTO album VALUES(NULL,'img/single/img_single5.jpg','Our Song','Taylor Swift','2007-08-22','BMG',NULL,'1','album.html?aid=15');
INSERT INTO album VALUES(NULL,'img/single/img_single6.jpg','Tim McGRAW','Taylor Swift','2006-06-19',' BMG','美国乡村小公主Taylor Swift出道首支单曲"Tim McGraw", 强烈的叙事性和画面感，细腻温柔的歌词和上口的旋律，小女生情感的宣泄。一颗来自纳什维尔的乡村音乐巨星从此冉冉升起。','1','album.html?aid=16');

/*插入专辑歌曲数据*/
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','The Archer','03:25','Taylor Swift','Lover',1,'1');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','ME!','03:25','Taylor Swift','Lover',1,'1');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','You Need Calm Down','03:25','Taylor Swift','Lover',1,'1');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3','... Ready For It?','03:25','Taylor Swift','Reputation',1,'2');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3','End Game','03:25','Taylor Swift','Reputation',1,'2');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3','I Did Something Bad','03:25','Taylor Swift','Reputation',1,'2');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3',"Don't Blame Me",'03:25','Taylor Swift','Reputation',NULL,'2');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3','Delicate','03:25','Taylor Swift','Reputation',1,'2');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3','Look What You Made Me Do','03:25','Taylor Swift','Reputation',1,'2');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3','So It Goes...','03:25','Taylor Swift','Reputation',NULL,'2');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3','Gorgeous','03:25','Taylor Swift','Reputation',1,'2');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3','Getaway Car','03:25','Taylor Swift','Reputation',1,'2');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3','King of My Heart','03:25','Taylor Swift','Reputation',NULL,'2');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3','Dancing With Our Hands Tied','03:25','Taylor Swift','Reputation',NULL,'2');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3','Dress','03:25','Taylor Swift','Reputation',NULL,'2');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3',"This Is Why We Can't Have Nice Things",'03:25','Taylor Swift','Reputation',NULL,'2');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3','Call It What You Want','03:25','Taylor Swift','Reputation',1,'2');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3',"New Year's Day",'03:25','Taylor Swift','Reputation',1,'2');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3',"Welcome To New York",'03:25','Taylor Swift','1989',1,'3');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3',"Blank Space",'03:25','Taylor Swift','1989',1,'3');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3',"Style",'03:25','Taylor Swift','1989',1,'3');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3',"Out Of The Woods",'03:25','Taylor Swift','1989',1,'3');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3',"All You Had To Do Was Stay",'03:25','Taylor Swift','1989',1,'3');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3',"Shake It Off",'03:25','Taylor Swift','1989',1,'3');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3',"I Wish You Would",'03:25','Taylor Swift','1989',NULL,'3');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3',"Bad Blood",'03:25','Taylor Swift','1989',1,'3');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3',"Wildest Dreams",'03:25','Taylor Swift','1989',NULL,'3');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3',"How You Get The Girl",'03:25','Taylor Swift','1989',NULL,'3');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3',"This Love",'03:25','Taylor Swift','1989',NULL,'3');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3',"I Know Places",'03:25','Taylor Swift','1989',1,'3');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3',"Clean",'03:25','Taylor Swift','1989',1,'3');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3',"Wonderland",'03:25','Taylor Swift','1989',NULL,'3');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3',"You Are In Love",'03:25','Taylor Swift','1989',NULL,'3');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3',"New Romantics",'03:25','Taylor Swift','1989',1,'3');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','State Of Grace','03:25','Taylor Swift','Red',NULL,'4');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Red','03:25','Taylor Swift','Red',1,'4');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Treacherous','03:25','Taylor Swift','Red',NULL,'4');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','I Knew You Were Trouble','03:25','Taylor Swift','Red',1,'4');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','All Too Well','03:25','Taylor Swift','Red',1,'4');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','22','03:25','Taylor Swift','Red',1,'4');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','I Almost Do','03:25','Taylor Swift','Red',NULL,'4');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','We Are Never Ever Getting Back Together','03:25','Taylor Swift','Red',1,'4');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Stay Stay Stay','03:25','Taylor Swift','Red',NULL,'4');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','The Last Time','03:25','Taylor Swift','Red',1,'4');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Holy Ground','03:25','Taylor Swift','Red',NULL,'4');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Sad Beautiful Tragic','03:25','Taylor Swift','Red',NULL,'4');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','The Lucky One','03:25','Taylor Swift','Red',NULL,'4');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Everything Has Changed','03:25','Taylor Swift / Ed Sheeran','Red',1,'4');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Starlight','03:25','Taylor Swift','Red',NULL,'4');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Begin Again','03:25','Taylor Swift','Red',1,'4');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Mine','03:25','Taylor Swift','Speak Now',1,'5');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Sparks Fly','03:25','Taylor Swift','Speak Now',1,'5');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Back To December','03:25','Taylor Swift','Speak Now',1,'5');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Speak Now','03:25','Taylor Swift','Speak Now',1,'5');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Dear John','03:25','Taylor Swift','Speak Now',NULL,'5');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Mean','03:25','Taylor Swift','Speak Now',1,'5');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','The Story Of Us','03:25','Taylor Swift','Speak Now',NULL,'5');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Never Grow Up','03:25','Taylor Swift','Speak Now',NULL,'5');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Enchanted','03:25','Taylor Swift','Speak Now',1,'5');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Better Than Revenge','03:25','Taylor Swift','Speak Now',NULL,'5');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Innocent','03:25','Taylor Swift','Speak Now',NULL,'5');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Haunted','03:25','Taylor Swift','Speak Now',NULL,'5');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Last Kiss','03:25','Taylor Swift','Speak Now',1,'5');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Long Live','03:25','Taylor Swift','Speak Now',1,'5');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Ours','03:25','Taylor Swift','Speak Now',NULL,'5');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','If This Was a Movie','03:25','Taylor Swift','Speak Now',NULL,'5');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Superman','03:25','Taylor Swift','Speak Now',NULL,'5');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Fearless','03:25','Taylor Swift','Fearless',1,'6');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Fifteen','03:25','Taylor Swift','Fearless',NULL,'6');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Love Story','03:25','Taylor Swift','Fearless',1,'6');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Hey Stephen','03:25','Taylor Swift','Fearless',NULL,'6');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','White Horse','03:25','Taylor Swift','Fearless',NULL,'6');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','You Belong With Me','03:25','Taylor Swift','Fearless',1,'6');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Breathe','03:25','Taylor Swift','Fearless',NULL,'6');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Tell Me Why','03:25','Taylor Swift','Fearless',NULL,'6');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3',"You're Not Sorry",'03:25','Taylor Swift','Fearless',NULL,'6');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','The Way I Loved You','03:25','Taylor Swift','Fearless',NULL,'6');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Forever & Always','03:25','Taylor Swift','Fearless',NULL,'6');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','The Best Day','03:25','Taylor Swift','Fearless',1,'6');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Change','03:25','Taylor Swift','Fearless',NULL,'6');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Tim McGraw','03:25','Taylor Swift','Taylor Swift',1,'7');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Picture To Burn','03:25','Taylor Swift','Taylor Swift',NULL,'7');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Teardrops On My Guitar','03:25','Taylor Swift','Taylor Swift',1,'7');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','A Place In This World','03:25','Taylor Swift','Taylor Swift',NULL,'7');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Cold As You','03:25','Taylor Swift','Taylor Swift',NULL,'7');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','The Outside','03:25','Taylor Swift','Taylor Swift',NULL,'7');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Tied Together With A Smile','03:25','Taylor Swift','Taylor Swift',NULL,'7');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Stay Beautiful','03:25','Taylor Swift','Taylor Swift',NULL,'7');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3',"Should've Said No",'03:25','Taylor Swift','Taylor Swift',NULL,'7');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3',"Mary's Song (Oh My My My)",'03:25','Taylor Swift','Taylor Swift',NULL,'7');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Our Song','03:25','Taylor Swift','Taylor Swift',1,'7');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Invisible','03:25','Taylor Swift','Taylor Swift',1,'7');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','A Perfectly Good Heart','03:25','Taylor Swift','Taylor Swift',NULL,'7');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3','... Ready For It?','03:25','Taylor Swift','Reputation',NULL,'8');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3','End Game','03:25','Taylor Swift','Reputation',NULL,'8');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3','I Did Something Bad','03:25','Taylor Swift','Reputation',NULL,'8');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3',"Don't Blame Me",'03:25','Taylor Swift','Reputation',NULL,'8');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3','Delicate','03:25','Taylor Swift','Reputation',NULL,'8');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3','Look What You Made Me Do','03:25','Taylor Swift','Reputation',NULL,'8');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3','So It Goes...','03:25','Taylor Swift','Reputation',NULL,'8');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3','Gorgeous','03:25','Taylor Swift','Reputation',NULL,'8');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3','Getaway Car','03:25','Taylor Swift','Reputation',NULL,'8');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3','King of My Heart','03:25','Taylor Swift','Reputation',NULL,'8');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3','Dancing With Our Hands Tied','03:25','Taylor Swift','Reputation',NULL,'8');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3','Dress','03:25','Taylor Swift','Reputation',NULL,'8');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3',"This Is Why We Can't Have Nice Things",'03:25','Taylor Swift','Reputation',NULL,'8');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3','Call It What You Want','03:25','Taylor Swift','Reputation',NULL,'8');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - I Did Something Bad.mp3',"New Year's Day",'03:25','Taylor Swift','Reputation',NULL,'8');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','ME!','03:25','Taylor Swift / Brendon Urie','ME!',NULL,'9');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','You Need Calm Down','03:25','Taylor Swift','You Need Calm Down',NULL,'10');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','22','03:25','Taylor Swift','22',NULL,'11');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Sweeter Than Fiction','03:25','Taylor Swift','Sweeter Than Fiction',NULL,'12');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','We Are Never Ever Getting Back Together','03:25','Taylor Swift','We Are Never Ever Getting Back Together',NULL,'13');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Love Story','03:25','Taylor Swift','Love Story',NULL,'14');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Our Song','03:25','Taylor Swift','Our Song',NULL,'15');
INSERT INTO album_songs VALUES(NULL,'song/Taylor Swift - Delicate.mp3','Tim McGRAW','03:25','Taylor Swift','Tim McGRAW',NULL,'16');


/*插入轮播图数据*/
INSERT INTO carousel VALUES(NULL,'img/banner/banner1.jpg','首页轮播图1','album/songs.html?song_id=1');
INSERT INTO carousel VALUES(NULL,'img/banner/banner2.jpg','首页轮播图2','album/songs.html?song_id=2');
INSERT INTO carousel VALUES(NULL,'img/banner/banner3.jpg','首页轮播图3','album/songs.html?song_id=3');
INSERT INTO carousel VALUES(NULL,'img/banner/banner4.jpg','首页轮播图4','album/songs.html?song_id=4');
INSERT INTO carousel VALUES(NULL,'img/banner/banner5.jpg','首页轮播图5','album/songs.html?song_id=5');
INSERT INTO carousel VALUES(NULL,'img/banner/banner6.jpg','首页轮播图6','album/songs.html?song_id=6');

/*插入相关歌手数据*/
INSERT INTO related_singers VALUES(NULL,'Ed Sheeran','img/singers/related_singer1.jpg');
INSERT INTO related_singers VALUES(NULL,'Selena Gomez','img/singers/related_singer2.jpg');
INSERT INTO related_singers VALUES(NULL,'Shawn Mendes','img/singers/related_singer3.jpg');
INSERT INTO related_singers VALUES(NULL,'Halsey','img/singers/related_singer4.jpg');
INSERT INTO related_singers VALUES(NULL,'Troye Sivan','img/singers/related_singer5.jpg');
INSERT INTO related_singers VALUES(NULL,'Taylor Swift','img/singers/related_singer6.jpg');

/*插入周边商品数据*/
INSERT INTO product VALUES(NULL,'ALBUM TITLE PHONE CASE','$25','img/product/new01.png','product_detail.html?pid=1','Unisex long sleeve crop tee with YOU CAN’T SPELL AWESOME WITHOUT ME! floral photo design.','100% cotton','You will receive Taylor Swift’s forthcoming 7th studio LP digital album via e-mail on release date.','Please note, digital downloads are not available to customers outside the U.S.','Taylor Swift®','Photo by Valheria Rocha','©2019 TAS Rights Management, LLC Used By Permission. All Rights Reserved.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab consequatur cum, cupiditate dignissimos quod saepe sed soluta unde voluptatem. Ab amet illo sequi! Ad, debitis dolore libero necessitatibus sit veritatis');
INSERT INTO product VALUES(NULL,'YELLOW HEART-SHAPED SUNGLASSES','$35','img/product/new02.png','product_detail.html?pid=2','Unisex long sleeve crop tee with YOU CAN’T SPELL AWESOME WITHOUT ME! floral photo design.','100% cotton','You will receive Taylor Swift’s forthcoming 7th studio LP digital album via e-mail on release date.','Please note, digital downloads are not available to customers outside the U.S.','Taylor Swift®','Photo by Valheria Rocha','©2019 TAS Rights Management, LLC Used By Permission. All Rights Reserved.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab consequatur cum, cupiditate dignissimos quod saepe sed soluta unde voluptatem. Ab amet illo sequi! Ad, debitis dolore libero necessitatibus sit veritatis');
INSERT INTO product VALUES(NULL,'PINK SLEEP MASK WITH CALM DOWN','$45','img/product/new03.png','product_detail.html?pid=3','Unisex long sleeve crop tee with YOU CAN’T SPELL AWESOME WITHOUT ME! floral photo design.','100% cotton','You will receive Taylor Swift’s forthcoming 7th studio LP digital album via e-mail on release date.','Please note, digital downloads are not available to customers outside the U.S.','Taylor Swift®','Photo by Valheria Rocha','©2019 TAS Rights Management, LLC Used By Permission. All Rights Reserved.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab consequatur cum, cupiditate dignissimos quod saepe sed soluta unde voluptatem. Ab amet illo sequi! Ad, debitis dolore libero necessitatibus sit veritatis');
INSERT INTO product VALUES(NULL,'CAN YOU JUST NOT STEP ON OUR GOWNS','$43','img/product/new04.png','product_detail.html?pid=4','Unisex long sleeve crop tee with YOU CAN’T SPELL AWESOME WITHOUT ME! floral photo design.','100% cotton','You will receive Taylor Swift’s forthcoming 7th studio LP digital album via e-mail on release date.','Please note, digital downloads are not available to customers outside the U.S.','Taylor Swift®','Photo by Valheria Rocha','©2019 TAS Rights Management, LLC Used By Permission. All Rights Reserved.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab consequatur cum, cupiditate dignissimos quod saepe sed soluta unde voluptatem. Ab amet illo sequi! Ad, debitis dolore libero necessitatibus sit veritatis');
INSERT INTO product VALUES(NULL,'TAYLOR SWIFT® WRISTWATCH WITH CAT DESIGN','$25','img/product/new05.png','product_detail.html?pid=5','Unisex long sleeve crop tee with YOU CAN’T SPELL AWESOME WITHOUT ME! floral photo design.','100% cotton','You will receive Taylor Swift’s forthcoming 7th studio LP digital album via e-mail on release date.','Please note, digital downloads are not available to customers outside the U.S.','Taylor Swift®','Photo by Valheria Rocha','©2019 TAS Rights Management, LLC Used By Permission. All Rights Reserved.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab consequatur cum, cupiditate dignissimos quod saepe sed soluta unde voluptatem. Ab amet illo sequi! Ad, debitis dolore libero necessitatibus sit veritatis');
INSERT INTO product VALUES(NULL,'WHITE SOCKS WITH CALM DOWN LETTERING','$30','img/product/new06.png','product_detail.html?pid=6','Unisex long sleeve crop tee with YOU CAN’T SPELL AWESOME WITHOUT ME! floral photo design.','100% cotton','You will receive Taylor Swift’s forthcoming 7th studio LP digital album via e-mail on release date.','Please note, digital downloads are not available to customers outside the U.S.','Taylor Swift®','Photo by Valheria Rocha','©2019 TAS Rights Management, LLC Used By Permission. All Rights Reserved.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab consequatur cum, cupiditate dignissimos quod saepe sed soluta unde voluptatem. Ab amet illo sequi! Ad, debitis dolore libero necessitatibus sit veritatis');
INSERT INTO product VALUES(NULL,'TAYLOR SWIFT® ENAMEL PIN PACK','$50','img/product/new07.png','product_detail.html?pid=7','Unisex long sleeve crop tee with YOU CAN’T SPELL AWESOME WITHOUT ME! floral photo design.','100% cotton','You will receive Taylor Swift’s forthcoming 7th studio LP digital album via e-mail on release date.','Please note, digital downloads are not available to customers outside the U.S.','Taylor Swift®','Photo by Valheria Rocha','©2019 TAS Rights Management, LLC Used By Permission. All Rights Reserved.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab consequatur cum, cupiditate dignissimos quod saepe sed soluta unde voluptatem. Ab amet illo sequi! Ad, debitis dolore libero necessitatibus sit veritatis');
INSERT INTO product VALUES(NULL,'WHITE AND RED CALM DOWN TEE','$55','img/product/new08.png','product_detail.html?pid=8','Unisex long sleeve crop tee with YOU CAN’T SPELL AWESOME WITHOUT ME! floral photo design.','100% cotton','You will receive Taylor Swift’s forthcoming 7th studio LP digital album via e-mail on release date.','Please note, digital downloads are not available to customers outside the U.S.','Taylor Swift®','Photo by Valheria Rocha','©2019 TAS Rights Management, LLC Used By Permission. All Rights Reserved.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab consequatur cum, cupiditate dignissimos quod saepe sed soluta unde voluptatem. Ab amet illo sequi! Ad, debitis dolore libero necessitatibus sit veritatis');
INSERT INTO product VALUES(NULL,'WHITE TEE WITH MULTICOLOR LYRIC DESIGN','$60','img/product/new09.png','product_detail.html?pid=9','Unisex long sleeve crop tee with YOU CAN’T SPELL AWESOME WITHOUT ME! floral photo design.','100% cotton','You will receive Taylor Swift’s forthcoming 7th studio LP digital album via e-mail on release date.','Please note, digital downloads are not available to customers outside the U.S.','Taylor Swift®','Photo by Valheria Rocha','©2019 TAS Rights Management, LLC Used By Permission. All Rights Reserved.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab consequatur cum, cupiditate dignissimos quod saepe sed soluta unde voluptatem. Ab amet illo sequi! Ad, debitis dolore libero necessitatibus sit veritatis');
INSERT INTO product VALUES(NULL,'TIE DYE LONG SLEEVE WITH FLOWER HEART','$50','img/product/new10.png','product_detail.html?pid=10','Unisex long sleeve crop tee with YOU CAN’T SPELL AWESOME WITHOUT ME! floral photo design.','100% cotton','You will receive Taylor Swift’s forthcoming 7th studio LP digital album via e-mail on release date.','Please note, digital downloads are not available to customers outside the U.S.','Taylor Swift®','Photo by Valheria Rocha','©2019 TAS Rights Management, LLC Used By Permission. All Rights Reserved.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab consequatur cum, cupiditate dignissimos quod saepe sed soluta unde voluptatem. Ab amet illo sequi! Ad, debitis dolore libero necessitatibus sit veritatis');
INSERT INTO product VALUES(NULL,'CELADON LONG SLEEVE CROP TEE WITH FLORAL PHOTO DESIGN','$65','img/product/new11.png','product_detail.html?pid=11','Unisex long sleeve crop tee with YOU CAN’T SPELL AWESOME WITHOUT ME! floral photo design.','100% cotton','You will receive Taylor Swift’s forthcoming 7th studio LP digital album via e-mail on release date.','Please note, digital downloads are not available to customers outside the U.S.','Taylor Swift®','Photo by Valheria Rocha','©2019 TAS Rights Management, LLC Used By Permission. All Rights Reserved.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab consequatur cum, cupiditate dignissimos quod saepe sed soluta unde voluptatem. Ab amet illo sequi! Ad, debitis dolore libero necessitatibus sit veritatis');
INSERT INTO product VALUES(NULL,'FLORAL TAYLOR SWIFT PHONE STAND BY POPSOCKETS','$35','img/product/new12.png','product_detail.html?pid=12','Unisex long sleeve crop tee with YOU CAN’T SPELL AWESOME WITHOUT ME! floral photo design.','100% cotton','You will receive Taylor Swift’s forthcoming 7th studio LP digital album via e-mail on release date.','Please note, digital downloads are not available to customers outside the U.S.','Taylor Swift®','Photo by Valheria Rocha','©2019 TAS Rights Management, LLC Used By Permission. All Rights Reserved.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab consequatur cum, cupiditate dignissimos quod saepe sed soluta unde voluptatem. Ab amet illo sequi! Ad, debitis dolore libero necessitatibus sit veritatis');
INSERT INTO product VALUES(NULL,'ALBUM TITLE PHONE CASE','$35','img/product/new13.png','product_detail.html?pid=13','Unisex long sleeve crop tee with YOU CAN’T SPELL AWESOME WITHOUT ME! floral photo design.','100% cotton','You will receive Taylor Swift’s forthcoming 7th studio LP digital album via e-mail on release date.','Please note, digital downloads are not available to customers outside the U.S.','Taylor Swift®','Photo by Valheria Rocha','©2019 TAS Rights Management, LLC Used By Permission. All Rights Reserved.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab consequatur cum, cupiditate dignissimos quod saepe sed soluta unde voluptatem. Ab amet illo sequi! Ad, debitis dolore libero necessitatibus sit veritatis');
INSERT INTO product VALUES(NULL,'RAINBOW PHONE STAND BY POPSOCKETS® WITH PHOTO','$40','img/product/new14.png','product_detail.html?pid=14','Unisex long sleeve crop tee with YOU CAN’T SPELL AWESOME WITHOUT ME! floral photo design.','100% cotton','You will receive Taylor Swift’s forthcoming 7th studio LP digital album via e-mail on release date.','Please note, digital downloads are not available to customers outside the U.S.','Taylor Swift®','Photo by Valheria Rocha','©2019 TAS Rights Management, LLC Used By Permission. All Rights Reserved.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab consequatur cum, cupiditate dignissimos quod saepe sed soluta unde voluptatem. Ab amet illo sequi! Ad, debitis dolore libero necessitatibus sit veritatis');
INSERT INTO product VALUES(NULL,'ALBUM TITLE PHONE CASE','$40','img/product/new15.png','product_detail.html?pid=15','Unisex long sleeve crop tee with YOU CAN’T SPELL AWESOME WITHOUT ME! floral photo design.','100% cotton','You will receive Taylor Swift’s forthcoming 7th studio LP digital album via e-mail on release date.','Please note, digital downloads are not available to customers outside the U.S.','Taylor Swift®','Photo by Valheria Rocha','©2019 TAS Rights Management, LLC Used By Permission. All Rights Reserved.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab consequatur cum, cupiditate dignissimos quod saepe sed soluta unde voluptatem. Ab amet illo sequi! Ad, debitis dolore libero necessitatibus sit veritatis');
INSERT INTO product VALUES(NULL,'MULTICOLOR PHONE STAND BY POPSOCKETS® WITH GLITTER DESIGN','$45','img/product/product1.png','product_detail.html?pid=16','Unisex long sleeve crop tee with YOU CAN’T SPELL AWESOME WITHOUT ME! floral photo design.','100% cotton','You will receive Taylor Swift’s forthcoming 7th studio LP digital album via e-mail on release date.','Please note, digital downloads are not available to customers outside the U.S.','Taylor Swift®','Photo by Valheria Rocha','©2019 TAS Rights Management, LLC Used By Permission. All Rights Reserved.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab consequatur cum, cupiditate dignissimos quod saepe sed soluta unde voluptatem. Ab amet illo sequi! Ad, debitis dolore libero necessitatibus sit veritatis');
INSERT INTO product VALUES(NULL,'LAVENDER TOTE WITH MULTICOLOR TEXT DESIGN','$35','img/product/product2.png','product_detail.html?pid=17','Unisex long sleeve crop tee with YOU CAN’T SPELL AWESOME WITHOUT ME! floral photo design.','100% cotton','You will receive Taylor Swift’s forthcoming 7th studio LP digital album via e-mail on release date.','Please note, digital downloads are not available to customers outside the U.S.','Taylor Swift®','Photo by Valheria Rocha','©2019 TAS Rights Management, LLC Used By Permission. All Rights Reserved.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab consequatur cum, cupiditate dignissimos quod saepe sed soluta unde voluptatem. Ab amet illo sequi! Ad, debitis dolore libero necessitatibus sit veritatis');
INSERT INTO product VALUES(NULL,'BEIGE TOTE WITH FLORAL DESIGN','$25','img/product/product3.png','product_detail.html?pid=18','Unisex long sleeve crop tee with YOU CAN’T SPELL AWESOME WITHOUT ME! floral photo design.','100% cotton','You will receive Taylor Swift’s forthcoming 7th studio LP digital album via e-mail on release date.','Please note, digital downloads are not available to customers outside the U.S.','Taylor Swift®','Photo by Valheria Rocha','©2019 TAS Rights Management, LLC Used By Permission. All Rights Reserved.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab consequatur cum, cupiditate dignissimos quod saepe sed soluta unde voluptatem. Ab amet illo sequi! Ad, debitis dolore libero necessitatibus sit veritatis');
INSERT INTO product VALUES(NULL,'BEIGE TOTE WITH FLORAL DESIGN','$20','img/product/product4.png','product_detail.html?pid=19','Unisex long sleeve crop tee with YOU CAN’T SPELL AWESOME WITHOUT ME! floral photo design.','100% cotton','You will receive Taylor Swift’s forthcoming 7th studio LP digital album via e-mail on release date.','Please note, digital downloads are not available to customers outside the U.S.','Taylor Swift®','Photo by Valheria Rocha','©2019 TAS Rights Management, LLC Used By Permission. All Rights Reserved.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab consequatur cum, cupiditate dignissimos quod saepe sed soluta unde voluptatem. Ab amet illo sequi! Ad, debitis dolore libero necessitatibus sit veritatis');
INSERT INTO product VALUES(NULL,'BEIGE TOTE WITH FLORAL DESIGN','$35','img/product/product5.png','product_detail.html?pid=20','Unisex long sleeve crop tee with YOU CAN’T SPELL AWESOME WITHOUT ME! floral photo design.','100% cotton','You will receive Taylor Swift’s forthcoming 7th studio LP digital album via e-mail on release date.','Please note, digital downloads are not available to customers outside the U.S.','Taylor Swift®','Photo by Valheria Rocha','©2019 TAS Rights Management, LLC Used By Permission. All Rights Reserved.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab consequatur cum, cupiditate dignissimos quod saepe sed soluta unde voluptatem. Ab amet illo sequi! Ad, debitis dolore libero necessitatibus sit veritatis');
INSERT INTO product VALUES(NULL,'BEIGE TOTE WITH FLORAL DESIGN','$35','img/product/product6.png','product_detail.html?pid=21','Unisex long sleeve crop tee with YOU CAN’T SPELL AWESOME WITHOUT ME! floral photo design.','100% cotton','You will receive Taylor Swift’s forthcoming 7th studio LP digital album via e-mail on release date.','Please note, digital downloads are not available to customers outside the U.S.','Taylor Swift®','Photo by Valheria Rocha','©2019 TAS Rights Management, LLC Used By Permission. All Rights Reserved.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab consequatur cum, cupiditate dignissimos quod saepe sed soluta unde voluptatem. Ab amet illo sequi! Ad, debitis dolore libero necessitatibus sit veritatis');
INSERT INTO product VALUES(NULL,'BEIGE TOTE WITH FLORAL DESIGN','$45','img/product/product7.png','product_detail.html?pid=22','Unisex long sleeve crop tee with YOU CAN’T SPELL AWESOME WITHOUT ME! floral photo design.','100% cotton','You will receive Taylor Swift’s forthcoming 7th studio LP digital album via e-mail on release date.','Please note, digital downloads are not available to customers outside the U.S.','Taylor Swift®','Photo by Valheria Rocha','©2019 TAS Rights Management, LLC Used By Permission. All Rights Reserved.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab consequatur cum, cupiditate dignissimos quod saepe sed soluta unde voluptatem. Ab amet illo sequi! Ad, debitis dolore libero necessitatibus sit veritatis');
INSERT INTO product VALUES(NULL,'BEIGE TOTE WITH FLORAL DESIGN','$40','img/product/product8.png','product_detail.html?pid=23','Unisex long sleeve crop tee with YOU CAN’T SPELL AWESOME WITHOUT ME! floral photo design.','100% cotton','You will receive Taylor Swift’s forthcoming 7th studio LP digital album via e-mail on release date.','Please note, digital downloads are not available to customers outside the U.S.','Taylor Swift®','Photo by Valheria Rocha','©2019 TAS Rights Management, LLC Used By Permission. All Rights Reserved.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab consequatur cum, cupiditate dignissimos quod saepe sed soluta unde voluptatem. Ab amet illo sequi! Ad, debitis dolore libero necessitatibus sit veritatis');
INSERT INTO product VALUES(NULL,'BEIGE TOTE WITH FLORAL DESIGN','$55','img/product/product9.png','product_detail.html?pid=24','Unisex long sleeve crop tee with YOU CAN’T SPELL AWESOME WITHOUT ME! floral photo design.','100% cotton','You will receive Taylor Swift’s forthcoming 7th studio LP digital album via e-mail on release date.','Please note, digital downloads are not available to customers outside the U.S.','Taylor Swift®','Photo by Valheria Rocha','©2019 TAS Rights Management, LLC Used By Permission. All Rights Reserved.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab consequatur cum, cupiditate dignissimos quod saepe sed soluta unde voluptatem. Ab amet illo sequi! Ad, debitis dolore libero necessitatibus sit veritatis');



/*插入用户数据*/
INSERT INTO user VALUES(NULL,'dandan','123456',0,'13556789874','dandan@music.com','许丹丹','img/album/comment_fans.jpg');
INSERT INTO user VALUES(NULL,'junjun','123456',0,'13656789874','junjun@music.com','张君','img/album/fans2.jpg');
INSERT INTO user VALUES(NULL,'pengpeng','123456',1,'13756789874','pengpeng@music.com','李亚鹏','img/album/fans3.jpg');
INSERT INTO user VALUES(NULL,'tengteng','123456',0,'13856789874','tengteng@music.com','海腾','img/album/fans4.jpg');
INSERT INTO user VALUES(NULL,'leilei','123456',1,'13956789874','leilei@music.com','雷雷','img/album/fans.jpg');
INSERT INTO user VALUES(NULL,'yanyan','123456',0,'15856789874','yanyan@music.com','赵燕','img/album/fans6.jpg');
INSERT INTO user VALUES(NULL,'chaochao','123456',1,'15956789874','chaochao@music.com','王超','img/album/fans7.jpg');
