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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cwaling_newspaper`
--

LOCK TABLES `cwaling_newspaper` WRITE;
/*!40000 ALTER TABLE `cwaling_newspaper` DISABLE KEYS */;
INSERT INTO `cwaling_newspaper` VALUES (1,'AI일보','박재상','','크롤링링을 이용한 검색 만들기'),(28,'뉴스1','박주평','jupy@news1.kr','진짜 불륜 아니에요? 질문에 송윤아 나쁜일 안했다 댓글'),(29,'국민일보','문동성','theMoon@kmib.co.kr','확진 간호사는 책임감에 펑펑 울었다 명지병원 이사장의 글'),(30,'연합뉴스','이동환','ask@yna.co.kr','MBC 기자,  박사방  송금 정황…취재 목적'),(31,'뉴시스','박준호','pjh@newsis.com','섹시팬티 빨기 미녀 많다 초등교사 발언 논란'),(32,'연합뉴스','손상원','pch80@yna.co.kr','MBC 기자,  박사방  송금 정황…취재 목적'),(33,'서울신문','입력','kodefkim@naver.com','귀여운 토끼를 통째로 삼키는 거대 갈매기 포착'),(34,'프레시안','입력','None','한국 과학정책, 무궁화꽃이 피었습니까?'),(35,'동아일보','송홍근','carrot@donga.com','오늘부터 공적 마스크 3장씩 구매 가능..대리구매 기준도 완화'),(36,'YTN','백순영','None','신천지 31번 환자 퇴원..치료비 국가·지자체 부담'),(37,'매경이코노미','입력','None','[외환·금융위기와 코로나19 파장 비교] 외환위기 땐 코스피 7개월새 56% 폭락 - 코로나, 두달새 35% 뚝..바닥 장담 못해'),(38,'경향신문','이주영','young78@kyunghyang.com','[단독]우리 조직에서 임신하면 죄인…경찰 상사  폭언  들은 여경 유산'),(39,'머니투데이','김지영','kjyou@mt.co.kr','개인회생 포기합니다 50대 가장 김씨는 결국 파산했다'),(40,'뉴스1','민선희','minssun@news1.kr','진짜 불륜 아니에요? 질문에 송윤아 나쁜일 안했다 댓글'),(41,'뉴스1','최은지','silverpaper@news1.kr','진짜 불륜 아니에요? 질문에 송윤아 나쁜일 안했다 댓글'),(42,'뉴시스','김형섭','bright@newsis.com','섹시팬티 빨기 미녀 많다 초등교사 발언 논란'),(43,'뉴스1','이균진','asd123@news1.kr','진짜 불륜 아니에요? 질문에 송윤아 나쁜일 안했다 댓글'),(44,'연합뉴스','차지연','charge@yna.co.kr','MBC 기자,  박사방  송금 정황…취재 목적'),(45,'미디어오늘','금준경','None','난장판된 선거부정 음모론 토론회에 할말 잃은 이준석'),(46,'파이낸셜뉴스','장민권','mkchang@fnnews.com','나경원,  국민 밉상  소리에 날린 한 방 혹시..'),(47,'뉴시스','유자비','jabiu@newsis.com','섹시팬티 빨기 미녀 많다 초등교사 발언 논란'),(48,'뉴시스','최서진','westjin@newsis.com','섹시팬티 빨기 미녀 많다 초등교사 발언 논란'),(49,'연합뉴스','이동환','ask@yna.co.kr','MBC 기자,  박사방  송금 정황…취재 목적');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_user`
--

LOCK TABLES `login_user` WRITE;
/*!40000 ALTER TABLE `login_user` DISABLE KEYS */;
INSERT INTO `login_user` VALUES (1,'jaesang','19d869167a25c806ab4981e0aa89000c95edb98d7f044c6079a24f750252144c'),(2,'111','d17f25ecfbcc7857f7bebea469308be0b2580943e96d13a3ad98a13675c4bfc2'),(3,'1111','bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a');
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

-- Dump completed on 2020-04-27 16:04:26
