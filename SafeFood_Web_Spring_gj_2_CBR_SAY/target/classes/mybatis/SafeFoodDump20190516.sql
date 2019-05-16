-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: 121.147.32.117    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `food` (
  `code` int(11) NOT NULL,
  `supportpereat` decimal(5,2) DEFAULT NULL,
  `calory` decimal(5,2) DEFAULT NULL,
  `carbo` decimal(5,2) DEFAULT NULL,
  `protein` decimal(5,2) DEFAULT NULL,
  `fat` decimal(5,2) DEFAULT NULL,
  `sugar` decimal(5,2) DEFAULT NULL,
  `natrium` decimal(10,2) DEFAULT NULL,
  `chole` decimal(5,2) DEFAULT NULL,
  `fattyacid` decimal(5,2) DEFAULT NULL,
  `transfat` decimal(5,2) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `img` varchar(45) DEFAULT NULL,
  `material` varchar(1000) DEFAULT NULL,
  `maker` varchar(45) DEFAULT NULL,
  `eat_cnt` int(11) DEFAULT NULL,
  `search_cnt` int(11) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,80.00,347.37,54.74,5.61,11.93,2.81,1087.72,0.00,5.61,0.00,'신라면큰사발','img/신라면큰사발.jpg','육수맛조미베이스,소맥분(호주산,미국산),버섯풍미분말,감자전분(독일산),정백당,팜유(말레이시아산),변성전분,복합조미간장분말,난각칼슘,매운탕분말,정제염,정제염,비프조미페이스트,사골된장분말,비프조미분,이스트조미액,포도당,면류첨가알칼리제 ( 산도조절제 ),생고추조미분말,혼합제제 ( 산도조절제 ),칠리맛조미분,올리고녹차풍미액,양념구이조미분,비타민B₂,볶음양념분,수육조미분,호화감자전분,조미양념분,마늘추출물분말,후추가루,분말된장,5-리보뉴클레오티드이나트륨,양파풍미분,사골추출물분말,육수조미분말,양파조미베이스,호박산이나트륨,장국양념분말,다시마정미추출분말,매운맛조미분,고춧가루,분말카라멜 ( 카라멜색소 , 물엿분말 ),생강추출물분말,건표고버섯,건파,건청경채,조미건조홍고추','농심',19,272,'우리 입맛에 맞는 얼큰하고 매운맛 제품으로 농심의 정성과 앞선 기술 그리고 좋은 원료로 만들어 남녀노소 구분 없이 많은 사랑을 받는 제품입니다. 또한 세계 여러 나라에 수출하여 한국의 맛을 세계화 시키는데 앞장서고 있습니다.'),(2,80.00,275.20,42.24,5.76,8.96,3.20,1139.20,0.00,3.20,0.00,'진라면컵매운맛','img/진라면컵매운맛.jpg','참맛매운육수분말,소맥분(미국산,호주산),변성전분,포도당,발효복합분,팜유(말레이시아산),진한감칠맛분,글루텐,숙성마늘맛분,정제소금,마늘양념분말,유화유지,난각분말,볶음마늘분,치킨추출농축액,백설탕,마늘시즈닝,간장분말,야채추출물,식용유지가공품,면류첨가알칼리제 ( 산도조절제 ),정제소금,비타민 B₂,효모조미분,칠리맛분말,녹차풍미유,전분,쇠고기간장분말,쇠고기향미분말,후추분말,고춧가루,구아검,조미아미노산분말,향미증진제,칠리추출물,고추농축소스,산도조절제,건파,조미쇠고기맛후레이크,건당근,건표고버섯,건조채심,건고추입자,[ 소맥분 ( 밀 ), 탈지대두 ( 대두 ), 유당 ( 우유 ), 난각분말 ( 계란 ), 땅콩단백 ( 땅콩 ), 돈골 ( 돼지고기 )]','오뚜기',8,164,'진라면은 부드러우면서도 쫄깃한 면발, 진한 쇠고기 국물을 바탕으로 매운 맛과 순한 맛을 차별화해 소비자가 기호에 따라 선택할 수 있게 함으로써 높은 인기를 누리고 있다'),(3,80.00,272.70,42.88,4.99,8.90,2.24,940.54,0.00,4.48,0.00,'큰컵삼양라면','img/큰컵삼양라면.jpg','볶음면조미분말,소맥분(미국산,호주산),부대찌개베이스,전분(태국산),팜유,설탕,정제염,정제염,맛베이스에스,미감에스유,식물성간장분말,면류첨가알칼리제 ( 산도조절제 ),감자전분,양파엑기스,양념간장분,구아검,지미맛분말,비타민B₂,구연산,햄풍미분말,육수맛분말,녹차풍미유,김치조미분말,돈육풍미분말,볶음양념분말,혼합양념분말,진사골추출물분말,전지분유,팜유,부대찌개분말,쇠고기양념분말,저염풍미분에스,후추분,향미증진제,매운조미고추맛분,김치찌개풍미분말,베이컨향분말,햄베이스시즈닝,파프리카추출색소,마늘맛오일,조미콩단백,실당근,건청파,청경채,고단백건조유부,{ 소맥분 ( 밀 ), 탈지대두 ( 대두 ), 돼지고기 , 전지분유 ( 우유 ), 계란 , 땅콩 }','삼양식품',5,24,'라면이 생각날 때! 라면의 원조, 기본에 충실한 삼양의 대표 브랜드 삼양라면'),(4,80.00,372.00,48.16,7.68,15.76,0.00,1876.00,0.00,0.00,0.00,'새우탕큰사발','img/새우탕큰사발.jpg','소맥분(호주산,미국산),감자전분(독일산),팜유,변성전분,식물성풍미유,난각칼슘,정제염,야채조미추출물,면류첨가알칼리제 ( 산도조절제 ),혼합제제 ( 산도조절제 ),올리고녹차풍미액,비타민B₂,새우베이스분말,정제염,정백당,육수베이스분말,매운맛분말,조미양념분,매운탕조미분말,호화옥수수분,육수맛조미베이스,오징어조미분말,오징어풍미분말,양념구이조미분,5-리보뉴클레오티드이나트륨,분말고추장,이스트풍미분,호박산이나트륨,복합조미간장분말,분말카라멜 ( 카라멜색소 , 물엿분말 ),다시마정미추출분말,혼합해물베이스분말,멸치조미분,향신조미분,후추가루,다시마표고조미분,수화검 ( 구아검 , 산탄검 ),후추추출물분말,어포,새우맛볼,건미역,건당근,건새우,새우 ( 중국산 58.1% , 캐나다산 41.0% , 국내산 0.9% )','농심',3,6,'시원하고 개운한 맛! 새우탕'),(5,80.00,273.45,42.47,5.24,9.31,1.75,936.73,0.00,4.65,0.00,'육개장큰사발면','img/육개장큰사발면.jpg','육개장조미료,소맥분(호주산,미국산),팜유(말레이시아산),정제염,양념간장베이스,감자전분,변성전분,조미아미노산간장분말,정백당,식물성풍미유,물엿분말,난각칼슘,양념풍미분,정제염,볶음양념분,면류첨가알칼리제 ( 산도조절제 ),육수조미분말,비프양념분말,혼합제제 ( 산도조절제 ),간장조미액,마늘추출물분말,복합양념분말,구아검,올리고녹차풍미액,팜유조미분말,이스트풍미분,비타민B₂,후추가루,매운맛조미분,5-리보뉴클레오티드이나트륨,분말고추장,양파풍미분,수육조미분,호박산이나트륨,칠리풍미분말,복합조미간장분말,건파,계란스크램블,건조맛살어묵,소용돌이맛살','농심',0,1,'출시부터 현재까지 변치않는 용기 디자인[2]과 맛으로 컵라면계의 본좌 자리를 유지하고 있다. 특히, 일본의 ‘컵면’ 형태로 최초 출시했던 삼양식품의 컵라면과 차별화를 두기 위해, 한국인에게 친숙한 ‘국사발’ 모양을 그대로 본 떠 ‘사발면’이라는 컨셉으로 한국적인 식사 문화를 살린 고유의 매력이 오랫동안 장수하는 비결로 꼽힌다.'),(6,100.00,156.25,25.00,1.25,6.25,20.00,68.75,18.75,4.75,0.63,'메로나','img/메로나.jpg','정제수,백설탕,데어리스프레드 (외국산:뉴질랜드,독일,호주),프락토올리고당,물엿,혼합탈지분유 ( 외국산 :네덜란드,아일랜드,독일),말티톨시럽,메론시럽 0.15% ( 메론 70% : 국산 ),정제염,로커스트콩검,셀룰로오스검,혼합제제 ( 구아검 , 로커스트콩검 , 카라기난 , 셀룰로오스검 , 유화제 ),치자청색소,심황색소,합성착향료 ( 메론향 )','빙그레',5,0,'우리나라 아이스크림 업계의 살아있는 전설, 메로나! 고급과일인 멜론의 부드럽고 풍부한 맛을 그대로 담은 메로나는 유지방을 6%이상 함유해 부드러우면서도, 멜론 특유의 향과 쫀득함이 혀를 자극해 풍부한 맛을 즐길수 있습니다.'),(7,100.00,274.00,25.00,3.00,18.30,17.33,65.00,0.00,0.00,0.00,'누크바','img/N45누크바.jpg','정제수,기타코코아가공품[야자유(수입산),백설탕,채종유(호주산),땅콩버터,혼합분유,코코아매스],백설탕,혼합분유(수입산;탈지분유,유청분말),기타올리고당 ( 물엿 , 이소말토올리고당 , 액상과당 ),땅콩(중국산),가공버터 ( 유크림 , 야자유 ),아이스혼합유 ( 야자유 80% , 팜유 20% ),혼합제제Ⅰ ( 구아검 , 로커스트콩검 , 카라기난 , 타마린드검 ),천연착향료 ( 바닐라향 ),유화제,합성착향료 ( 바닐라향 ),혼합제제Ⅱ ( 치자황색소 , 덱스트린 , 비트레드 )','롯데제과',2,1,'누가바의 사촌 씹히는 식감이 두배~!'),(8,100.00,186.67,40.00,3.33,1.60,21.25,106.67,6.67,1.07,0.00,'비비빅','img/비비빅.jpg','정제수,당통팥22%(중국산: 백설탕 , 팥 ),백설탕,물엿,팥분말(중국산),혼합탈지분유,데어리스프레드,액상과당,찰옥수수알파전분,유청분말,정제염,구아검,락색소,카라멜색소,합성착향료 ( 팥향 ),치자청색소','빙그레',6,8,'빙그레에서 만드는 아이스크림, 팥 아이스크림의 대표 주자. 엄마한테 맛있는 아이스크림 사오라고 했을 때 엄마가 많이 선택하는, 보는 순간 절망하는 아이스크림'),(9,100.00,110.93,24.67,0.33,2.24,18.67,25.83,0.09,1.11,0.17,'수박바','img/수박바.jpg','정제수,백설탕,프락토올리고당,초코땅콩 ( 땅콩 ),폴리덱스트로스,말티톨시럽,아이스혼합유,유화제,혼합제제 ( 구아검 ( 대두 ), 카라기난 , 산도조절제 , 로커스트콩검 , 타마린드검 ),수박농축액 0.1% ( 고형분 65% ),합성착향료 ( 딸기향 , 멜론향 ),정제소금,혼합제제II ( 비트레드 , 덱스트린 , 치자황색소 ),비타민C,구연산,혼합제제III ( 치자청색소 , 치자황색소 , 덱스트린 )','롯데제과',2,0,'롯데제과의 수박 모양의 아이스크림. 1986년에 출시되었으며 출시 당시 이름은 수박맛바였다. 그래서 몇몇 나이 드신 분들이 수박바를 수박맛바라고 부르신다.'),(10,100.00,113.33,28.40,0.04,0.09,20.00,0.68,0.00,0.00,0.17,'죠스바','img/죠스바.jpg','정제수,프락토올리고당,백설탕,기타올리고당 ( 물엿 , 이소말토올리고당 , 액상과당 ),딸기쨈3%(딸기;국산),구연산,오렌지농축액0.14%(고형분65%),합성착향료 ( 딸기향 , 오렌지향 ),혼합제제Ⅰ ( 카라기난 , 구아검 ( 대두 ), 산도조절제 , 로커스트콩검 , 타마린드검 ),혼합제제Ⅱ ( 구아검 , 카라기난 , 산도조절제 , 로커스트콩검 , 타마린드검 ),혼합제제Ⅲ ( 유화제 , 탄산칼슘 , 규소수지 ),비타민C,혼합제제Ⅳ ( 덱스트린 , 치자청색소 , 홍국적색소 , 치자황색소 ),혼합제제Ⅴ ( 비트레드 , 덱스트린 , 치자황색소 )','롯데제과',0,0,'우리 입맛에 맞는 얼큰하고 매운맛 제품으로 농심의 정성과 앞선 기술 그리고 좋은 원료로 만들어 남녀노소 구분 없이 많은 사랑을 받는 제품입니다. 또한 세계 여러 나라에 수출하여 한국의 맛을 세계화 시키는데 앞장서고 있습니다.'),(11,200.00,340.00,44.00,10.00,14.00,40.44,170.00,40.00,8.00,0.00,'서울우유바나나','img/서울우유바나나.jpg','원유 60.12%(국산),정제수,액상과당,정백당,유크림 2.93%(국산),탈지분유 2.143%,바나나농축과즙(바나나과즙 1%,이스라엘산),올리고당,합성착향료 ( 바나나향 )','서울우유',0,0,'그래서 나 100% 체세포수 1등급 세균수 1A 서울우유~'),(12,200.00,280.00,20.00,12.00,16.00,18.00,200.00,60.00,9.60,0.00,'맛있는우유GT','img/맛있는우유GT.jpg','1A등급 원유 ( 국산 ) 100% ( 세균수기준 )','남양유업',0,0,'그래서 나 100% 체세포수 1등급 세균수 1A 서울우유~'),(13,200.00,168.42,42.11,0.00,0.00,33.60,10.53,0.00,0.00,0.00,'칠성사이다','img/칠성사이다.jpg','정제수,액상과당,백설탕,탄산가스,구연산,레몬라임향','롯데칠성음료',0,0,'롯데칠성음료의 사이다. 대한민국에서 가장 많이 팔리는 탄산음료 중 하나이자 사이다이다. 단일 품종으로 많은 매출을 올리고 있는 파워 브랜드 중의 하나라고 할 수 있다.'),(14,200.00,172.90,43.00,0.09,0.06,44.00,143.84,0.00,0.00,0.00,'비타500칼슘','img/비타500칼슘.jpg','정제수,액상과당,농축사과과즙 ( 당도 72Brix이상 , 뉴질랜드산 ),비타민C 0.5% ( 900% ),퓨라칼 (칼슘12%이상)0.05%,합성착향료 ( 드링크향 ),구연산,케이디비타 2800,구연산삼나트륨,펙틴,타우린,DL-사과산,오렌지추출물','광동제약',0,0,'모두가 힘들고 바빠요 카페인 필요한 걸까요 얘는요 그런거 없어요 참 착하네요 착한드링크 비타500'),(15,200.00,100.00,24.00,0.00,0.00,12.55,60.00,0.00,0.00,0.00,'비타파워','img/비타파워.jpg','정제수,액상과당,비타민C,구연산,합성착향료 ( 드링크향 , 혼합과일향 ),구연산삼나트륨,효소처리스테비아,타우린,수크랄로스 ( 합성감미료 ),비타민B2인산에스테르나트륨','롯데제과',0,0,'롯데칠성음료기 비타파워의 제품 경쟁력 강화를 위해 제품패키지 디자인을 리뉴얼했지만 비차500의 독주는 막을 수 없지'),(16,200.00,80.00,18.29,0.00,0.00,13.72,125.71,0.00,0.00,0.00,'칸타타아메리카노','img/칸타타아메리카노.jpg','칸타타원두커피추출액30%(에티오피아50%,콜롬비아30%,브라질20%),정제수,백설탕,합성착향료 ( 커피향 ),탄산수소나트륨,L-아스코르빈산나트륨','롯데제과',0,0,'오리지널 원두커피의 맛을 느낄 수 있는 \"블랙\" 커피'),(17,200.00,182.86,36.57,4.57,2.06,36.56,228.57,11.43,1.37,0.00,'칸타타프리미엄라떼','img/칸타타프리미엄라떼.jpg','칸타타원두커피추출액42%(에티오피아50%,콜롬비아30%,브라질20%),정제수,우유15%(국내산),백설탕,혼합분유 ( 탈지분유 , 유청분말 ),탄산수소나트륨,합성착향료 ( 커피향 , 우유향 ),유화제,L-아스코르빈산나트륨','롯데제과',0,0,'우유와 설탕을 넣은 \"프리미엄 블렌드\" 커피'),(18,200.00,70.40,17.60,0.00,0.00,16.00,52.00,0.00,0.00,0.00,'맥심티오피스위트아메리카노','img/맥심티오피스위트아메리카노.jpg','맥심 에스프레소 커피추출액 ( 고형분 5.0%이상 ,커피원두:콜롬비아산60%,브라질산21%)12.6%,정제수,백설탕,탄산칼륨,합성착향료 ( 커피향 ),비타민C,자당지방산에스테르','동서식품',0,0,'칸타타가 그냥 커피라면, 이건 TOP야. 에스프레소의 진한 커피의 맛과 달콤한 감미를 느낄 수 있는 산뜻한 아메리카노'),(19,200.00,156.40,26.00,3.20,4.40,26.20,72.73,16.00,3.20,0.00,'맥심티오피마스터라떼','img/맥심티오피마스터라떼.jpg','정제수,우유 (국내산)15%,맥심 에스프레소 커피추출액 ( 고형분 5.0%이상 ,커피원두:콜롬비아산60%,브라질산21%)12.6%,백설탕,유크림,탈지분유,탄산칼륨,자당지방산에스테르,비타민C','동서식품',1,0,'칸타타가 그냥 커피라면, 이건 TOP야. 부드러운 우유의 맛과 진하게 올라오는 에스프레소의 향미, 달콤하게 즐기는 라떼 커피음료'),(20,200.00,58.33,13.33,0.83,0.00,11.68,91.67,0.00,0.00,0.00,'아카페라아메리카노','img/아카페라아메리카노.jpg','정제수,콜드브루커피추출액7%(고형분3%이상/커피원두:에티오피아40%,콜롬비아30%,브라질30%),백설탕,에스프레소커피추출액 1.54% ( 고형분 34%이상 /커피원두:브라질),탄산수소나트륨,아스코르빈산나트륨,천연커피향','빙그레',1,0,'아카페라 2007년 첫 출시 후 작년 약 400억원 매출, RTD커피 대표 브랜드로 자리 잡아');
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likefood`
--

DROP TABLE IF EXISTS `likefood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `likefood` (
  `likefood_idx` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) NOT NULL,
  `food_code` int(11) NOT NULL,
  PRIMARY KEY (`likefood_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likefood`
--

LOCK TABLES `likefood` WRITE;
/*!40000 ALTER TABLE `likefood` DISABLE KEYS */;
INSERT INTO `likefood` VALUES (1,'say',1),(3,'say',1),(4,'say',5),(7,'say',1),(9,'say',1),(10,'say',1),(11,'bora',1),(12,'bora',2),(13,'bora',5);
/*!40000 ALTER TABLE `likefood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `notice` (
  `notice_idx` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `hit_cnt` int(11) DEFAULT '0',
  PRIMARY KEY (`notice_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'cbr','공지사항1','내용1','2019-05-13 10:04:16',0),(2,'cbr','공지사항1','내용1','2019-05-13 11:46:41',0),(3,'cbr','공지사항1','내용1','2019-05-13 11:46:42',0),(4,'cbr','공지사항1','내용1','2019-05-13 11:46:42',0),(5,'cbr','공지사항1','내용1','2019-05-13 11:46:42',0),(6,'cbr','공지사항1','내용1','2019-05-13 11:46:43',0),(7,'cbr','공지사항1','내용1','2019-05-13 11:46:43',0),(8,'cbr','공지사항1','내용1','2019-05-13 11:46:43',0),(9,'cbr','공지사항1','내용1','2019-05-13 11:46:43',0),(10,'cbr','공지사항1','내용1','2019-05-13 11:46:43',0),(11,'cbr','공지사항1','내용1','2019-05-13 11:46:44',0),(12,'cbr','공지사항1','내용1','2019-05-13 11:46:44',0),(13,'cbr','공지사항1','내용1','2019-05-13 11:46:44',0),(14,'cbr','공지사항1','내용1','2019-05-13 11:46:44',0),(15,'cbr','공지사항1','내용1','2019-05-13 11:46:44',0),(16,'cbr','공지사항1','내용1','2019-05-13 11:46:44',0),(17,'cbr','공지사항1','내용1','2019-05-13 11:46:44',0),(18,'cbr','공지사항1','내용1','2019-05-13 11:46:45',0),(19,'cbr','공지사항1','내용1','2019-05-13 11:46:45',0),(20,'cbr','공지사항1','내용1','2019-05-13 11:46:45',0),(21,'cbr','공지사항1','내용1','2019-05-13 11:46:45',0),(22,'cbr','공지사항1','내용1','2019-05-13 11:46:45',0),(23,NULL,'공지공지','공지공지','2019-05-13 14:09:38',0),(24,'관리자','게시판글제목','ㅇㅇㅇ','2019-05-13 14:11:10',0);
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qna`
--

DROP TABLE IF EXISTS `qna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `qna` (
  `qna_idx` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(5) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(10000) DEFAULT NULL,
  `user_id` varchar(45) DEFAULT NULL,
  `answer` varchar(1000) DEFAULT NULL,
  `qna_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `views` int(20) DEFAULT NULL,
  PRIMARY KEY (`qna_idx`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `qna_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qna`
--

LOCK TABLES `qna` WRITE;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
INSERT INTO `qna` VALUES (1,NULL,'고속도로 휴게소 저염메뉴로 건강 챙기세요','□ 식품의약품안전처(처장 이의경)는 5월 14일부터 17일까지 24개 고속도로 휴게소에서 ‘찾아가는 <덜 단짠> 체험 행사’를 실시한다고 밝혔습니다.\n\n ○ 이번 행사는 덜(Low) 단짠 홍보단*, 한국도로공사(충북본부)와 함께  나트륨·당류를 줄인 음식을 선택할 수 있는 환경을 조성하고 생활 속 건강한 식생활 실천을 유도하기 위해 마련하였습니다. \n\n    * 덜(Low) 단짠 홍보단: 덜 달게, 덜 짜게 먹는 식습관 실천의 붐업을 위해 체험행사, 영양상담, 홍보 등을 수행하는 프로그램 운영단\n\n□ 행사의 주요 내용은 ▲염도를 낮춘 메뉴 제공 및 신규 저염메뉴 출시 ▲내가 먹는 음식 염도 확인 등 현장 체험 ▲나트륨‧당류 저감 홍보 등입니다. \n\n ○ 오창휴게소 등 5개소에서는 컨설팅을 통해 기존 메뉴의 염도를 낮추거나 새로운 저염 메뉴를 선보입니다.\n   - 오창휴게소(통영방향)와 화서휴게소(상주방향)의 ‘해물순두부찌개’, 속리산휴게소(청주방향)의 ‘우거지국밥’은 염도를 낮추어 제공하고, 충주휴게소(양평방향)와 천등산휴게소(평택방향)에서는 ‘충주사과카레덮밥’과 ‘천등산 고구마밥 정식’을 새롭게 출시합니다. \n\n ○ 한국도로공사 충북본부 관할 24개소 휴게소에서는 현장 체험과 나트륨·당류 저감 홍보를 진행합니다. \n   - 휴게소 매장 내에 염도계를 비치하여 이용객 누구나 판매하는 음식의 염도를 확인할 수 있도록 하고, 커피 주문시에 ‘시럽은 한번만’ 등을 통해 나트륨‧당류 저감 캠페인 동참을 유도합니다.\n\n ○ 특히, `덜(low) 단짠 홍보단`에서는 충주휴게소(양평방향, 5.14)와 오창휴게소(통영방향, 5.15)를 찾는 이용객들을 대상으로 짠맛·단맛 미각체험, 건강간식 시식, 건강 식생활안전 공모전 수상작 전시 등 다양한 국민 참여 캠페인도 병행할 예정입니다.   \n\n□ 앞으로도 식약처는 고속도로 휴게소 등 다중이용시설에서 나트륨과 당류를 줄여가는 식문화 개선을 위해 컨설팅을 확대하고 다양한 참여 행사를 실시하여 건강한 식습관이 형성되도록 최선을 다하겠다고 밝혔습니다.\n\n ○ 아울러, 이번 행사의 내용은 식약처 페이스북(www.facebook.com/mfds), 나트륨·당류 줄이기 페이스북(www.facebook.com/mfdsna) 등을 통해서도 확인할 수 있습니다.','admin',NULL,'2019-05-16 15:19:42',3),(2,NULL,'식약처, 식품 표시 규정 및 식품공전 설명회 개최','□ 식품의약품안전처(처장 이의경)는 식품 생산‧제조‧수입‧유통 영업자와 담당 공무원을 대상으로 ‘식품등의 표시 규정 및 기준·규격 설명회’를 오는 5월 17일부터 5월 31일까지 전국 6개 지역(서울, 부산, 대전, 광주, 대구, 제주)에서 개최한다고 밝혔습니다.\n\n ○ 이번 설명회에서는 최근 시행된(’19.3.14.)「식품 등의 표시‧광고에 관한 법률」의 법령 체계와 법에 따라 금지되는 표시·광고 행위 유형 등을 소개하고, 「식품등의 표시기준」, 「식품의 기준 및 규격」주요 개정 내용도 함께 설명할 예정입니다.\n\n ○ 설명회는 참석자 접근 편의를 고려하여 지역별로 개최하며, 5월 17일 부산(상공회의소), 21일 대전(통계교육원), 22일 서울(마포구청), 24일 제주(제주도청 제2청사), 31일 대구(상공회의소)와 광주(김대중컨벤션센터) 순으로 진행합니다.\n\n□ 식약처는 이번 설명회가 식품 관련 영업자와 공무원에게 도움이 될 것으로 기대하며, 앞으로도 식품 등의 표시 규정과 식품공전 관련 정보를 지속적으로 제공하겠다고 밝혔습니다.\n\n ○ 참고로 설명회에 참석을 희망할 경우 편리한 시간과 장소에서 사전등록 없이 누구나 참여할 수 있습니다.','admin',NULL,'2019-05-16 15:20:27',0),(3,NULL,'식약처, 식품 표시 규정 및 식품공전 설명회 개최','□ 식품의약품안전처(처장 이의경)는 식품 생산‧제조‧수입‧유통 영업자와 담당 공무원을 대상으로 ‘식품등의 표시 규정 및 기준·규격 설명회’를 오는 5월 17일부터 5월 31일까지 전국 6개 지역(서울, 부산, 대전, 광주, 대구, 제주)에서 개최한다고 밝혔습니다.\n\n ○ 이번 설명회에서는 최근 시행된(’19.3.14.)「식품 등의 표시‧광고에 관한 법률」의 법령 체계와 법에 따라 금지되는 표시·광고 행위 유형 등을 소개하고, 「식품등의 표시기준」, 「식품의 기준 및 규격」주요 개정 내용도 함께 설명할 예정입니다.\n\n ○ 설명회는 참석자 접근 편의를 고려하여 지역별로 개최하며, 5월 17일 부산(상공회의소), 21일 대전(통계교육원), 22일 서울(마포구청), 24일 제주(제주도청 제2청사), 31일 대구(상공회의소)와 광주(김대중컨벤션센터) 순으로 진행합니다.\n\n□ 식약처는 이번 설명회가 식품 관련 영업자와 공무원에게 도움이 될 것으로 기대하며, 앞으로도 식품 등의 표시 규정과 식품공전 관련 정보를 지속적으로 제공하겠다고 밝혔습니다.\n\n ○ 참고로 설명회에 참석을 희망할 경우 편리한 시간과 장소에서 사전등록 없이 누구나 참여할 수 있습니다.','admin',NULL,'2019-05-16 15:20:29',0),(4,NULL,'식약처, 식품 표시 규정 및 식품공전 설명회 개최','□ 식품의약품안전처(처장 이의경)는 식품 생산‧제조‧수입‧유통 영업자와 담당 공무원을 대상으로 ‘식품등의 표시 규정 및 기준·규격 설명회’를 오는 5월 17일부터 5월 31일까지 전국 6개 지역(서울, 부산, 대전, 광주, 대구, 제주)에서 개최한다고 밝혔습니다.\n\n ○ 이번 설명회에서는 최근 시행된(’19.3.14.)「식품 등의 표시‧광고에 관한 법률」의 법령 체계와 법에 따라 금지되는 표시·광고 행위 유형 등을 소개하고, 「식품등의 표시기준」, 「식품의 기준 및 규격」주요 개정 내용도 함께 설명할 예정입니다.\n\n ○ 설명회는 참석자 접근 편의를 고려하여 지역별로 개최하며, 5월 17일 부산(상공회의소), 21일 대전(통계교육원), 22일 서울(마포구청), 24일 제주(제주도청 제2청사), 31일 대구(상공회의소)와 광주(김대중컨벤션센터) 순으로 진행합니다.\n\n□ 식약처는 이번 설명회가 식품 관련 영업자와 공무원에게 도움이 될 것으로 기대하며, 앞으로도 식품 등의 표시 규정과 식품공전 관련 정보를 지속적으로 제공하겠다고 밝혔습니다.\n\n ○ 참고로 설명회에 참석을 희망할 경우 편리한 시간과 장소에서 사전등록 없이 누구나 참여할 수 있습니다.','admin',NULL,'2019-05-16 15:20:30',0),(5,NULL,'식약처, 식품 표시 규정 및 식품공전 설명회 개최','□ 식품의약품안전처(처장 이의경)는 식품 생산‧제조‧수입‧유통 영업자와 담당 공무원을 대상으로 ‘식품등의 표시 규정 및 기준·규격 설명회’를 오는 5월 17일부터 5월 31일까지 전국 6개 지역(서울, 부산, 대전, 광주, 대구, 제주)에서 개최한다고 밝혔습니다.\n\n ○ 이번 설명회에서는 최근 시행된(’19.3.14.)「식품 등의 표시‧광고에 관한 법률」의 법령 체계와 법에 따라 금지되는 표시·광고 행위 유형 등을 소개하고, 「식품등의 표시기준」, 「식품의 기준 및 규격」주요 개정 내용도 함께 설명할 예정입니다.\n\n ○ 설명회는 참석자 접근 편의를 고려하여 지역별로 개최하며, 5월 17일 부산(상공회의소), 21일 대전(통계교육원), 22일 서울(마포구청), 24일 제주(제주도청 제2청사), 31일 대구(상공회의소)와 광주(김대중컨벤션센터) 순으로 진행합니다.\n\n□ 식약처는 이번 설명회가 식품 관련 영업자와 공무원에게 도움이 될 것으로 기대하며, 앞으로도 식품 등의 표시 규정과 식품공전 관련 정보를 지속적으로 제공하겠다고 밝혔습니다.\n\n ○ 참고로 설명회에 참석을 희망할 경우 편리한 시간과 장소에서 사전등록 없이 누구나 참여할 수 있습니다.','admin',NULL,'2019-05-16 15:20:30',0),(6,NULL,'식약처, 식품 표시 규정 및 식품공전 설명회 개최','□ 식품의약품안전처(처장 이의경)는 식품 생산‧제조‧수입‧유통 영업자와 담당 공무원을 대상으로 ‘식품등의 표시 규정 및 기준·규격 설명회’를 오는 5월 17일부터 5월 31일까지 전국 6개 지역(서울, 부산, 대전, 광주, 대구, 제주)에서 개최한다고 밝혔습니다.\n\n ○ 이번 설명회에서는 최근 시행된(’19.3.14.)「식품 등의 표시‧광고에 관한 법률」의 법령 체계와 법에 따라 금지되는 표시·광고 행위 유형 등을 소개하고, 「식품등의 표시기준」, 「식품의 기준 및 규격」주요 개정 내용도 함께 설명할 예정입니다.\n\n ○ 설명회는 참석자 접근 편의를 고려하여 지역별로 개최하며, 5월 17일 부산(상공회의소), 21일 대전(통계교육원), 22일 서울(마포구청), 24일 제주(제주도청 제2청사), 31일 대구(상공회의소)와 광주(김대중컨벤션센터) 순으로 진행합니다.\n\n□ 식약처는 이번 설명회가 식품 관련 영업자와 공무원에게 도움이 될 것으로 기대하며, 앞으로도 식품 등의 표시 규정과 식품공전 관련 정보를 지속적으로 제공하겠다고 밝혔습니다.\n\n ○ 참고로 설명회에 참석을 희망할 경우 편리한 시간과 장소에서 사전등록 없이 누구나 참여할 수 있습니다.','admin',NULL,'2019-05-16 15:20:30',2),(7,NULL,'식약처, 식품 표시 규정 및 식품공전 설명회 개최','□ 식품의약품안전처(처장 이의경)는 식품 생산‧제조‧수입‧유통 영업자와 담당 공무원을 대상으로 ‘식품등의 표시 규정 및 기준·규격 설명회’를 오는 5월 17일부터 5월 31일까지 전국 6개 지역(서울, 부산, 대전, 광주, 대구, 제주)에서 개최한다고 밝혔습니다.\n\n ○ 이번 설명회에서는 최근 시행된(’19.3.14.)「식품 등의 표시‧광고에 관한 법률」의 법령 체계와 법에 따라 금지되는 표시·광고 행위 유형 등을 소개하고, 「식품등의 표시기준」, 「식품의 기준 및 규격」주요 개정 내용도 함께 설명할 예정입니다.\n\n ○ 설명회는 참석자 접근 편의를 고려하여 지역별로 개최하며, 5월 17일 부산(상공회의소), 21일 대전(통계교육원), 22일 서울(마포구청), 24일 제주(제주도청 제2청사), 31일 대구(상공회의소)와 광주(김대중컨벤션센터) 순으로 진행합니다.\n\n□ 식약처는 이번 설명회가 식품 관련 영업자와 공무원에게 도움이 될 것으로 기대하며, 앞으로도 식품 등의 표시 규정과 식품공전 관련 정보를 지속적으로 제공하겠다고 밝혔습니다.\n\n ○ 참고로 설명회에 참석을 희망할 경우 편리한 시간과 장소에서 사전등록 없이 누구나 참여할 수 있습니다.','admin',NULL,'2019-05-16 15:20:30',1),(8,NULL,'식약처, 식품 표시 규정 및 식품공전 설명회 개최','□ 식품의약품안전처(처장 이의경)는 식품 생산‧제조‧수입‧유통 영업자와 담당 공무원을 대상으로 ‘식품등의 표시 규정 및 기준·규격 설명회’를 오는 5월 17일부터 5월 31일까지 전국 6개 지역(서울, 부산, 대전, 광주, 대구, 제주)에서 개최한다고 밝혔습니다.\n\n ○ 이번 설명회에서는 최근 시행된(’19.3.14.)「식품 등의 표시‧광고에 관한 법률」의 법령 체계와 법에 따라 금지되는 표시·광고 행위 유형 등을 소개하고, 「식품등의 표시기준」, 「식품의 기준 및 규격」주요 개정 내용도 함께 설명할 예정입니다.\n\n ○ 설명회는 참석자 접근 편의를 고려하여 지역별로 개최하며, 5월 17일 부산(상공회의소), 21일 대전(통계교육원), 22일 서울(마포구청), 24일 제주(제주도청 제2청사), 31일 대구(상공회의소)와 광주(김대중컨벤션센터) 순으로 진행합니다.\n\n□ 식약처는 이번 설명회가 식품 관련 영업자와 공무원에게 도움이 될 것으로 기대하며, 앞으로도 식품 등의 표시 규정과 식품공전 관련 정보를 지속적으로 제공하겠다고 밝혔습니다.\n\n ○ 참고로 설명회에 참석을 희망할 경우 편리한 시간과 장소에서 사전등록 없이 누구나 참여할 수 있습니다.','admin',NULL,'2019-05-16 15:20:30',0),(9,NULL,'식약처, 식품 표시 규정 및 식품공전 설명회 개최','□ 식품의약품안전처(처장 이의경)는 식품 생산‧제조‧수입‧유통 영업자와 담당 공무원을 대상으로 ‘식품등의 표시 규정 및 기준·규격 설명회’를 오는 5월 17일부터 5월 31일까지 전국 6개 지역(서울, 부산, 대전, 광주, 대구, 제주)에서 개최한다고 밝혔습니다.\n\n ○ 이번 설명회에서는 최근 시행된(’19.3.14.)「식품 등의 표시‧광고에 관한 법률」의 법령 체계와 법에 따라 금지되는 표시·광고 행위 유형 등을 소개하고, 「식품등의 표시기준」, 「식품의 기준 및 규격」주요 개정 내용도 함께 설명할 예정입니다.\n\n ○ 설명회는 참석자 접근 편의를 고려하여 지역별로 개최하며, 5월 17일 부산(상공회의소), 21일 대전(통계교육원), 22일 서울(마포구청), 24일 제주(제주도청 제2청사), 31일 대구(상공회의소)와 광주(김대중컨벤션센터) 순으로 진행합니다.\n\n□ 식약처는 이번 설명회가 식품 관련 영업자와 공무원에게 도움이 될 것으로 기대하며, 앞으로도 식품 등의 표시 규정과 식품공전 관련 정보를 지속적으로 제공하겠다고 밝혔습니다.\n\n ○ 참고로 설명회에 참석을 희망할 경우 편리한 시간과 장소에서 사전등록 없이 누구나 참여할 수 있습니다.','admin',NULL,'2019-05-16 15:20:30',1),(10,NULL,'식약처, 식품 표시 규정 및 식품공전 설명회 개최','□ 식품의약품안전처(처장 이의경)는 식품 생산‧제조‧수입‧유통 영업자와 담당 공무원을 대상으로 ‘식품등의 표시 규정 및 기준·규격 설명회’를 오는 5월 17일부터 5월 31일까지 전국 6개 지역(서울, 부산, 대전, 광주, 대구, 제주)에서 개최한다고 밝혔습니다.\n\n ○ 이번 설명회에서는 최근 시행된(’19.3.14.)「식품 등의 표시‧광고에 관한 법률」의 법령 체계와 법에 따라 금지되는 표시·광고 행위 유형 등을 소개하고, 「식품등의 표시기준」, 「식품의 기준 및 규격」주요 개정 내용도 함께 설명할 예정입니다.\n\n ○ 설명회는 참석자 접근 편의를 고려하여 지역별로 개최하며, 5월 17일 부산(상공회의소), 21일 대전(통계교육원), 22일 서울(마포구청), 24일 제주(제주도청 제2청사), 31일 대구(상공회의소)와 광주(김대중컨벤션센터) 순으로 진행합니다.\n\n□ 식약처는 이번 설명회가 식품 관련 영업자와 공무원에게 도움이 될 것으로 기대하며, 앞으로도 식품 등의 표시 규정과 식품공전 관련 정보를 지속적으로 제공하겠다고 밝혔습니다.\n\n ○ 참고로 설명회에 참석을 희망할 경우 편리한 시간과 장소에서 사전등록 없이 누구나 참여할 수 있습니다.','admin',NULL,'2019-05-16 15:20:31',0);
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reviews` (
  `reviews_idx` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) NOT NULL,
  `food_code` int(11) NOT NULL,
  `reviews_content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`reviews_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` varchar(45) NOT NULL,
  `pw` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `addr` varchar(45) NOT NULL,
  `tel` varchar(45) DEFAULT NULL,
  `allergy` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin','admin','admin','admin','admin','땅콩,참치','admin'),('bora','bora','bora','bora','bora','우유,연어','bora'),('cbr','1234','천보라_update','cbr_update','010-2222-3333_update','대두,우유',''),('id','dd','안녕','ddd','tel','참치,닭고기','capsulejay963@naver.com'),('id1','pw2','name2','addr2','tel2',NULL,''),('id3','u_pw2','u_name2','u_addr2','u_tel2','u_all1,u_all2,u_all3,u_all1,u_all2,u_all3,',''),('new','new','new','new','new','땅콩,참치',''),('newenw','newenw','newenw','newenw','newenwdd','대두,땅콩,새우,참치','newenwddd'),('say','92130315','say','1111','1111','대두,참치,닭고기,복숭아','gkfkdgo3@naver.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usereat`
--

DROP TABLE IF EXISTS `usereat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usereat` (
  `eat_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `userEat_idx` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) NOT NULL,
  `food_code` int(11) NOT NULL,
  PRIMARY KEY (`userEat_idx`),
  KEY `user_id` (`user_id`),
  KEY `usereat_ibfk_2` (`food_code`),
  CONSTRAINT `usereat_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `usereat_ibfk_2` FOREIGN KEY (`food_code`) REFERENCES `food` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usereat`
--

LOCK TABLES `usereat` WRITE;
/*!40000 ALTER TABLE `usereat` DISABLE KEYS */;
INSERT INTO `usereat` VALUES ('2019-04-19 06:10:27',3,'say',3),('2019-04-19 06:47:05',6,'cbr',1),('2019-04-19 06:52:50',7,'cbr',1),('2019-04-19 06:53:47',8,'cbr',1),('2019-04-19 06:55:13',9,'cbr',2),('2019-04-19 07:38:42',15,'say',1),('2019-04-19 07:48:35',19,'say',3),('2019-04-19 07:48:49',20,'say',3),('2019-04-19 07:48:50',21,'say',3),('2019-05-10 07:59:55',22,'say',1),('2019-05-10 08:00:06',24,'say',1),('2019-05-10 08:01:36',25,'say',2),('2019-05-10 08:01:45',26,'say',2),('2019-05-10 08:04:28',27,'say',1),('2019-05-10 08:04:35',28,'say',2),('2019-05-10 08:51:04',29,'cbr',1),('2019-05-14 00:45:54',30,'cbr',1),('2019-05-14 00:45:57',31,'cbr',6),('2019-05-14 01:03:52',32,'cbr',1),('2019-05-14 01:04:08',33,'cbr',6),('2019-05-14 01:07:25',34,'cbr',4),('2019-05-14 01:12:30',35,'cbr',2),('2019-05-14 01:13:06',36,'cbr',2),('2019-05-14 01:14:37',37,'cbr',2),('2019-05-14 01:15:13',38,'cbr',2),('2019-05-14 01:16:07',39,'cbr',2),('2019-05-14 01:16:26',40,'cbr',2),('2019-05-14 01:22:47',41,'cbr',2),('2019-05-14 01:23:24',42,'cbr',6),('2019-05-14 01:24:46',43,'cbr',6),('2019-05-14 01:55:59',44,'cbr',3),('2019-05-14 01:57:45',45,'cbr',3),('2019-05-14 01:59:13',46,'cbr',3),('2019-05-14 02:01:56',47,'cbr',7),('2019-05-14 02:02:16',48,'cbr',7),('2019-05-16 01:34:18',71,'bora',1),('2019-05-16 01:34:19',72,'bora',3),('2019-05-31 02:07:49',75,'bora',1),('2019-06-16 02:07:51',76,'bora',9),('2019-07-19 02:07:55',77,'bora',20),('2019-08-15 02:07:59',78,'bora',19),('2019-09-14 02:08:02',79,'bora',6),('2019-05-16 07:13:37',82,'say',1),('2019-05-16 07:14:00',83,'say',2);
/*!40000 ALTER TABLE `usereat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-16 17:00:51
