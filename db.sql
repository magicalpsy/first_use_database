-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: newspaper
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES UTF8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cwaling_newspaper`
--

DROP TABLE IF EXISTS `cwaling_newspaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cwaling_newspaper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newspaper` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reportor` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `e-mail` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `headline` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cwaling_newspaper`
--

LOCK TABLES `cwaling_newspaper` WRITE;
/*!40000 ALTER TABLE `cwaling_newspaper` DISABLE KEYS */;
INSERT INTO `cwaling_newspaper` VALUES (1,'AI일보','박재상','','크롤링링을 이용한 검색 만들기'),(72,'뉴스1','김정률','jrkim@news1.kr','여야, 29일 본회의 개최 합의.. 재난지원금  추경안 처리(상보)'),(73,'뉴스1','구교운','kukoo@news1.kr','문대통령, 독자적 남북관계 개선 의지..코로나가 기회'),(74,'경향신문','박홍두','phd@kyunghyang.com','민주당,  성추행 파문  오거돈 부산시장 제명..청와대 사전 인지설 등엔 절대 아니다'),(75,'경향신문','김형규','fidelio@kyunghyang.com','오거돈 성추행, 청와대가 몰랐을리 없다 통합당·한국당, 진상조사단 구성'),(76,'국민일보','박세환','foryou@kmib.co.kr','문 대통령-정세균 총리 4월 중 재난지원금 추경 통과 지원'),(77,'서울신문','입력','kodefkim@naver.com','[김대영의 무기 인사이드] 경전차 부활의 신호탄 미 육군의  MPF '),(78,'프레시안','입력','None',' 전국-권역 병행 비례대표제도 로의 개혁을 상상한다'),(79,'동아일보','송홍근','carrot@donga.com','평양에 샤넬 매장이? 돈주들의  귀족 백화점  [송홍근 기자의 언박싱평양]'),(80,'YTN','백순영','None','[이슈인사이드] 열흘째 신규 환자 10명대..정부 등교 개학 여부 조만간 결정'),(81,'매경이코노미','입력','None','[신율의 정치 읽기] 대한민국 이념지형 변했다'),(82,'신동아','김우정','friend@donga.com','[사바나] 통합당은 전화도 없는데, 민주당이  미안하다  연락'),(83,'노컷뉴스','CBS노컷뉴스','kimdb@cbs.co.kr','문 대통령 K-방역 넘어 K-일상이 또 다른 세계 표준'),(84,'뉴스1','민선희','minssun@news1.kr','주한미군 근로자임금, 정부가 선지급..한미 방위비 장기전 수순'),(85,'뉴시스','박대로','daero@newsis.com','미국서 입국한 주한미군 가족 코로나19 양성..26번째 확진'),(86,'뉴시스','최서진','westjin@newsis.com','이준석,  투표함 증거보전 신청  민경욱에 유튜버에 영혼 위탁'),(87,'한국일보','안아람','oneshot@hankookilbo.com','공사 교수, 비행교육 중 생도들 폭행 정황.. 되살아난 구태'),(88,'이데일리','김미경','midory@edaily.co.kr','김정은, 잠행 16일째.. 신상  두고 여야 엇갈린 시각(종합)'),(89,'미디어오늘','금준경','None',' 김정은 사실상 사망  장성민 주장에 쏟아진 기사만 90개'),(90,'뉴시스','유자비','jabiu@newsis.com','돌아온다 약속지킨 안철수..다시 대구서 의료봉사 시작'),(91,'연합뉴스','이동환','ask@yna.co.kr','이준석, 민경욱 투표함 증거보전신청 비판..유튜버에 영혼위탁(종합)'),(92,'뉴시스','한주홍','hong@newsis.com','재난지원금 전국민 지급, 수령 75% vs 수령 거부 20%'),(93,'뉴스1','이균진','asd123@news1.kr','통합당, 오거돈 TF 구성..곽상도 김웅 검사출신 총출동(종합)');
/*!40000 ALTER TABLE `cwaling_newspaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_user`
--

DROP TABLE IF EXISTS `login_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_user`
--

LOCK TABLES `login_user` WRITE;
/*!40000 ALTER TABLE `login_user` DISABLE KEYS */;
INSERT INTO `login_user` VALUES (1,'jaesang','19d869167a25c806ab4981e0aa89000c95edb98d7f044c6079a24f750252144c'),(2,'111','d17f25ecfbcc7857f7bebea469308be0b2580943e96d13a3ad98a13675c4bfc2'),(3,'1111','bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a'),(4,'2','d4735e3a265e16eee03f59718b9b5d03019c07d8b6c51f90da3a666eec13ab35');
/*!40000 ALTER TABLE `login_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-27 17:12:56
