/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.15 : Database - cms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cms` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `cms`;

/*Table structure for table `assignpatientreportstodoctor` */

DROP TABLE IF EXISTS `assignpatientreportstodoctor`;

CREATE TABLE `assignpatientreportstodoctor` (
  `patientreportstodrid` int(11) NOT NULL AUTO_INCREMENT,
  `patientreportid` int(11) DEFAULT NULL,
  `doctorid` int(11) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fromdate` varchar(250) DEFAULT NULL,
  `todate` varchar(250) DEFAULT NULL,
  `isactive` int(11) DEFAULT NULL,
  PRIMARY KEY (`patientreportstodrid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `assignpatientreportstodoctor` */

insert  into `assignpatientreportstodoctor`(`patientreportstodrid`,`patientreportid`,`doctorid`,`createdby`,`createddate`,`fromdate`,`todate`,`isactive`) values 
(1,1,24,26,'2021-04-04 15:35:32','2021-04-04','2021-04-10',1),
(2,4,23,26,'2021-04-04 19:13:07','2021-04-04','2021-04-06',1),
(3,1,23,26,'2021-04-04 19:21:18','2021-04-04','2021-04-06',1),
(4,3,23,26,'2021-04-04 19:22:16','2021-04-05','2021-04-08',1),
(5,3,32,26,'2021-04-04 19:28:50','2021-04-05','2021-04-06',1),
(6,4,32,26,'2021-04-04 19:29:20','2021-04-06','2021-04-10',1),
(7,5,36,39,'2021-04-08 05:27:23','2021-04-09','2021-04-10',0),
(8,5,32,39,'2021-04-09 19:15:44','2021-04-09','2021-04-10',1),
(9,6,36,39,'2021-04-11 13:17:18','2021-04-11','2021-04-13',1);

/*Table structure for table `clinic` */

DROP TABLE IF EXISTS `clinic`;

CREATE TABLE `clinic` (
  `ClinicId` int(100) NOT NULL AUTO_INCREMENT,
  `ClinicName` varchar(100) NOT NULL,
  `Contact` varchar(100) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Latitude` varchar(100) NOT NULL,
  `Longitude` varchar(100) NOT NULL,
  `IsActive` varchar(100) NOT NULL,
  `createddate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` int(11) DEFAULT NULL,
  `updatedby` int(11) DEFAULT NULL,
  `updateddate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ClinicId`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;

/*Data for the table `clinic` */

insert  into `clinic`(`ClinicId`,`ClinicName`,`Contact`,`Address`,`Latitude`,`Longitude`,`IsActive`,`createddate`,`createdby`,`updatedby`,`updateddate`) values 
(2,'asimclinic','03113758181','hyderabad','25.3875998','68.363693','0','2021-01-02 14:48:06',3,3,'2021-01-02 14:48:06'),
(3,'areeshaclinic','02638293749','sadar town hyderabad','25.3875998','68.363693','0','2021-01-15 22:11:54',3,3,'2021-01-15 22:11:54'),
(4,'kajalclinic','02638293749','sadar town hyderabad','25.3875998','68.363693','0','2021-01-16 02:05:38',3,3,'2021-01-16 02:05:38'),
(5,'agha clinic','02638293778','sadar town hyderabad','25.3875998','68.363693','1','2021-01-16 08:49:18',3,NULL,'2021-01-16 08:49:18'),
(17,'areesha shaikh','03330291119','karachi','25.3875998','68.363693','1','2021-02-20 15:34:48',3,NULL,'2021-02-20 15:34:48'),
(18,'abc clinic','03330291119','karachi','25.3875998','68.363693','1','2021-03-05 23:18:36',3,NULL,'2021-03-05 23:18:36'),
(19,'moro clinic','03330291119','balouch electronics','25.3943092','68.3691037','1','2021-03-26 22:31:13',3,3,'2021-03-26 22:31:13'),
(20,'rajputana','03355676545','citizen hyderabad','25.3875998','68.363693','1','2021-04-07 23:59:51',3,3,'2021-04-07 23:59:51'),
(68,'national medical','03330292119','karachi','25.3875998','68.363693','0','2021-01-02 13:35:38',3,3,NULL),
(69,'Dental Clinic','02638293749','doctors colony','25.392985','68.366244','1','2021-04-11 13:02:41',3,NULL,'2021-04-11 13:02:41'),
(70,'Isra clinic','+923459374839','isra hyderabad','25.3857998','68.363693','1','2021-06-18 15:52:42',3,3,'2021-06-18 15:52:42'),
(71,'clinic','+923459374839',' main wadhu wah road  hyderabad','25.6475839','68.7849983','0','2021-06-18 19:09:34',3,NULL,'2021-06-18 19:09:34');

/*Table structure for table `clinicservice` */

DROP TABLE IF EXISTS `clinicservice`;

CREATE TABLE `clinicservice` (
  `ClinicServiceId` int(100) NOT NULL AUTO_INCREMENT,
  `ClinicId` int(100) NOT NULL,
  `ClinicTypeId` int(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ModifiedDate` date NOT NULL,
  `ModifiedBy` varchar(100) NOT NULL,
  `IsActive` varchar(100) NOT NULL,
  PRIMARY KEY (`ClinicServiceId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `clinicservice` */

insert  into `clinicservice`(`ClinicServiceId`,`ClinicId`,`ClinicTypeId`,`description`,`CreatedDate`,`ModifiedDate`,`ModifiedBy`,`IsActive`) values 
(1,1,1,'ABC','2021-01-03 12:17:00','0000-00-00','','1'),
(2,1,2,'ABC','2021-01-03 12:17:14','0000-00-00','','1');

/*Table structure for table `clinictype` */

DROP TABLE IF EXISTS `clinictype`;

CREATE TABLE `clinictype` (
  `ClinicTypeId` int(100) NOT NULL AUTO_INCREMENT,
  `ClinicType` varchar(100) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `IsActive` varchar(100) NOT NULL,
  `createddate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `modifieddate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ClinicTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `clinictype` */

insert  into `clinictype`(`ClinicTypeId`,`ClinicType`,`Description`,`IsActive`,`createddate`,`createdby`,`modifiedby`,`modifieddate`) values 
(1,'Cardio','abc','1','2021-01-03 12:15:35',4,4,'2021-01-03 12:20:04'),
(2,'Gyne','abc','1','2021-01-03 12:15:43',4,4,'2021-01-03 12:20:04'),
(3,'TB','ABC','1','2021-01-03 12:16:03',4,4,'2021-01-03 12:20:04'),
(4,'Eye','Eye clinic','1','2021-01-03 13:34:24',4,4,'2021-01-03 13:34:24'),
(5,'Hypatistus','Hypatistus service','1','2021-01-03 13:39:45',4,4,'2021-01-03 13:39:45'),
(6,'Mental health clinic','health caree','1','2021-01-16 02:33:25',4,4,'2021-01-16 02:33:25'),
(7,'sexual heath','treatment for sexually transmitted infections STIs','1','2021-01-16 09:01:51',4,4,'2021-01-16 09:01:51'),
(8,'Eye','Eye clinic','1','2021-03-18 18:28:16',28,28,'2021-03-18 18:28:16'),
(9,'Eye','Eye service','1','2021-04-03 13:32:31',31,NULL,'2021-04-03 13:32:31'),
(10,'TB SERVICE','TB SERVICE','1','2021-04-03 13:33:55',31,NULL,'2021-04-03 13:33:55'),
(11,'skin','Skin is the outer layer of something.','1','2021-04-08 01:34:27',34,34,'2021-04-08 01:34:27'),
(12,'dentist','make teeth strong','1','2021-06-18 16:50:39',40,40,'2021-06-18 16:50:39'),
(13,'Eye','eye diseases','1','2021-06-18 19:12:08',40,40,'2021-06-18 19:12:08');

/*Table structure for table `doctorservices` */

DROP TABLE IF EXISTS `doctorservices`;

CREATE TABLE `doctorservices` (
  `doctorserviceid` int(11) NOT NULL AUTO_INCREMENT,
  `clinictypeid` int(11) DEFAULT NULL,
  `doctorid` int(11) DEFAULT NULL,
  `clinicid` int(11) DEFAULT NULL,
  `isactive` int(11) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedby` int(11) DEFAULT NULL,
  `modifieddate` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`doctorserviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `doctorservices` */

insert  into `doctorservices`(`doctorserviceid`,`clinictypeid`,`doctorid`,`clinicid`,`isactive`,`createdby`,`createddate`,`modifiedby`,`modifieddate`) values 
(6,9,32,19,1,31,'2021-04-03 14:54:52',31,'2021-04-03 14:54:52'),
(7,10,32,19,1,31,'2021-04-03 14:54:52',31,'2021-04-03 14:54:52'),
(12,11,36,20,1,35,'2021-04-10 15:45:54',35,'2021-04-10 15:45:54'),
(13,13,43,70,1,40,'2021-06-18 19:36:07',40,'2021-06-18 19:36:07');

/*Table structure for table `patientappointment` */

DROP TABLE IF EXISTS `patientappointment`;

CREATE TABLE `patientappointment` (
  `PatientAppointmentId` int(100) NOT NULL AUTO_INCREMENT,
  `PatientId` int(100) NOT NULL,
  `TimeTableId` int(100) NOT NULL,
  `RequestedDateTime` datetime NOT NULL,
  `PatientStatus` varchar(100) NOT NULL,
  `ApprovedBy` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ApprovedDateTime` datetime DEFAULT NULL,
  `Comments` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Fees` int(100) DEFAULT NULL,
  `IsActive` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modifieddate` varchar(250) DEFAULT NULL,
  `doctorid` int(11) DEFAULT NULL,
  PRIMARY KEY (`PatientAppointmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `patientappointment` */

insert  into `patientappointment`(`PatientAppointmentId`,`PatientId`,`TimeTableId`,`RequestedDateTime`,`PatientStatus`,`ApprovedBy`,`ApprovedDateTime`,`Comments`,`Fees`,`IsActive`,`createddate`,`modifieddate`,`doctorid`) values 
(1,26,3,'0000-00-00 00:00:00','Inproccess','','0000-00-00 00:00:00','',0,'','2021-03-01 22:31:43',NULL,NULL),
(2,26,2,'2021-03-09 22:04:22','Done','23','2021-03-20 14:29:40','Done',500,'1','2021-03-02 22:45:31',NULL,NULL),
(3,26,2,'0000-00-00 00:00:00','Done','23','2021-03-20 13:49:24','Done',0,'','2021-03-02 23:13:26',NULL,NULL),
(4,26,2,'0000-00-00 00:00:00','Cancelled','29','2021-03-27 22:10:55','Cancelled',0,'1','2021-03-18 18:44:10',NULL,NULL),
(5,26,2,'2021-03-27 22:12:34','Accepted','29','2021-03-27 22:12:34','Accepted',500,'1','2021-03-18 18:44:51',NULL,NULL),
(6,26,2,'2021-03-25 22:42:12','Accepted','22','2021-03-25 22:42:12','Accepted',2000,'1','2021-03-20 16:30:00',NULL,NULL),
(7,26,5,'2021-03-21 12:10:55','Cancelled','22','2021-03-25 22:37:28','Cancelled',2000,'1','2021-03-21 12:09:19',NULL,NULL),
(10,26,4,'2021-03-23 00:00:00','Cancelled','22','2021-03-25 22:33:30','Cancelled',0,'1','2021-03-21 13:27:06',NULL,NULL),
(11,26,4,'2021-03-30 00:00:00','Accepted','29','2021-03-27 22:22:28','Accepted',3000,'1','2021-03-25 22:28:31','2021-03-27 22:22:28',NULL),
(12,26,13,'2021-04-06 00:00:00','Accepted','31','2021-04-04 19:32:45','Accepted',0,'1','2021-04-04 19:31:57','2021-04-04 19:32:45',NULL),
(13,39,14,'2021-04-13 00:00:00','Cancelled','','0000-00-00 00:00:00','',0,'0','2021-04-08 04:43:18',NULL,NULL),
(14,39,14,'2021-04-14 00:00:00','Cancelled','','0000-00-00 00:00:00','',0,'0','2021-04-08 04:43:57',NULL,NULL),
(15,39,15,'2021-04-21 00:00:00','Cancelled','','0000-00-00 00:00:00','',0,'0','2021-04-08 04:45:04',NULL,NULL),
(16,39,14,'2021-04-12 00:00:00','Done','36','2021-04-08 05:19:18','Done',2000,'1','2021-04-08 04:46:20','2021-04-08 04:57:30',NULL),
(17,35,15,'2021-04-21 00:00:00','Inproccess','','0000-00-00 00:00:00','',0,'','2021-04-08 04:48:52',NULL,NULL),
(18,35,14,'2021-04-21 00:00:00','Inproccess','','0000-00-00 00:00:00','',0,'','2021-04-08 04:50:18',NULL,NULL),
(19,35,14,'2021-04-20 00:00:00','Inproccess','','0000-00-00 00:00:00','',0,'','2021-04-08 04:51:30',NULL,NULL),
(20,39,15,'2021-04-20 00:00:00','Cancelled','35','0000-00-00 00:00:00','Cancelled',0,'1','2021-04-08 04:54:58','2021-04-08 04:56:50',NULL),
(21,39,13,'2021-04-13 00:00:00','Inproccess',NULL,NULL,NULL,NULL,NULL,'2021-04-09 20:17:11',NULL,NULL),
(22,39,14,'2021-04-19 00:00:00','Accepted','35','2021-04-10 15:59:55','Accepted',200,'1','2021-04-10 15:58:46','2021-04-10 15:59:55',NULL),
(23,39,15,'2021-04-27 00:00:00','Done','36','2021-04-11 13:19:11','Done',NULL,'1','2021-04-11 13:07:54','2021-04-11 13:18:26',NULL),
(24,44,16,'2021-06-23 00:00:00','Cancelled','40',NULL,'Cancelled',NULL,'1','2021-06-18 20:12:59','2021-06-18 20:32:13',NULL),
(25,44,16,'2021-06-23 00:00:00','Inproccess',NULL,NULL,NULL,NULL,NULL,'2021-06-18 20:36:19',NULL,NULL),
(26,44,16,'2021-06-30 00:00:00','Done','43','2021-06-18 20:54:46','Done',100,'1','2021-06-18 20:37:32','2021-06-18 20:40:56',NULL);

/*Table structure for table `patientappointmentpresciption` */

DROP TABLE IF EXISTS `patientappointmentpresciption`;

CREATE TABLE `patientappointmentpresciption` (
  `paappointmentprescid` int(11) NOT NULL AUTO_INCREMENT,
  `appointmentid` int(11) DEFAULT NULL,
  `prescription` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `doctorid` int(11) DEFAULT NULL,
  `clinicid` int(11) DEFAULT NULL,
  `createddatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isactive` int(11) DEFAULT NULL,
  PRIMARY KEY (`paappointmentprescid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `patientappointmentpresciption` */

insert  into `patientappointmentpresciption`(`paappointmentprescid`,`appointmentid`,`prescription`,`description`,`doctorid`,`clinicid`,`createddatetime`,`isactive`) values 
(1,3,'abc','abc',23,17,'2021-03-20 13:39:58',1),
(2,3,'abc','xyz',23,17,'2021-03-20 13:46:48',1),
(3,3,'abc','xyz',23,17,'2021-03-20 13:48:36',1),
(4,3,'abc','xyz',23,17,'2021-03-20 13:49:22',1),
(5,2,'appointment 2 medicine','appointment 2 medicine',23,17,'2021-03-20 14:26:40',1),
(6,2,'appointment 2 medicine','appointment 2 medicine',23,17,'2021-03-20 14:27:08',1),
(7,2,'appointment 2 medicine','appointment 2 medicine',23,17,'2021-03-20 14:28:49',1),
(8,2,'appointment 2 medicine','appointment 2 medicine',23,17,'2021-03-20 14:29:34',1),
(9,16,'ance cream','skin problem accure',36,20,'2021-04-08 05:19:17',1),
(10,23,'acyne cream','skin care',36,20,'2021-04-11 13:19:11',1),
(11,26,'eye tube','eye pain release',43,70,'2021-06-18 20:54:45',1);

/*Table structure for table `patientreports` */

DROP TABLE IF EXISTS `patientreports`;

CREATE TABLE `patientreports` (
  `patientreportid` int(11) NOT NULL AUTO_INCREMENT,
  `PatientAppointmentId` int(11) DEFAULT NULL,
  `report` varchar(250) DEFAULT NULL,
  `file` varchar(250) DEFAULT NULL,
  `isactive` int(11) DEFAULT NULL,
  `createddatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`patientreportid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `patientreports` */

insert  into `patientreports`(`patientreportid`,`PatientAppointmentId`,`report`,`file`,`isactive`,`createddatetime`) values 
(1,3,'doctor reports','files//canceltwo.png',1,'2021-03-08 19:39:51'),
(3,3,'reprot-1','files//sba-Mushtaque.png',1,'2021-03-08 19:55:11'),
(4,7,'first post','files//FIRST POST.png',1,'2021-03-21 14:58:01'),
(5,16,'reports','files//literature review.docx',1,'2021-04-08 05:22:25'),
(6,22,'skin care','files//srs_template.doc',1,'2021-04-11 13:16:25'),
(7,26,'eye infection','files//Department table.PNG',1,'2021-06-18 20:44:59');

/*Table structure for table `patientsreening` */

DROP TABLE IF EXISTS `patientsreening`;

CREATE TABLE `patientsreening` (
  `PatientScreeningId` int(100) NOT NULL AUTO_INCREMENT,
  `PatientId` int(100) NOT NULL,
  `PatientAppointmentId` int(100) NOT NULL,
  `ScreeningHeading` varchar(100) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `FilePath` varchar(100) NOT NULL,
  `UploadedDateTime` datetime(6) NOT NULL,
  `IsActive` varchar(100) NOT NULL,
  `createddate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PatientScreeningId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `patientsreening` */

/*Table structure for table `profile` */

DROP TABLE IF EXISTS `profile`;

CREATE TABLE `profile` (
  `ProfileId` int(100) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Cnic` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Gender` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Contact` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Address` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `UserName` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Password` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `UserType` int(11) DEFAULT NULL COMMENT '1=admin,2=doctor,3=receptionis,4=patient',
  `CreateDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Qualification` varchar(100) DEFAULT NULL,
  `Specialization` varchar(100) DEFAULT NULL,
  `IsActive` int(11) DEFAULT NULL,
  `ClinicId` int(100) DEFAULT NULL,
  `imgsource` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ProfileId`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

/*Data for the table `profile` */

insert  into `profile`(`ProfileId`,`FirstName`,`LastName`,`Cnic`,`Gender`,`Contact`,`Email`,`Address`,`UserName`,`Password`,`UserType`,`CreateDate`,`Qualification`,`Specialization`,`IsActive`,`ClinicId`,`imgsource`) values 
(1,'zain ul abdin','chandio','234324','Male','34435','zain@gmail.com','karachi','zainchandio','zainchandio',4,'2020-12-28 21:24:35','',NULL,0,0,NULL),
(2,'Kajal','Lohana','43345','Female','11111','kajal@gmail.com','hyderabad','kajallohana','kajallohana',4,'2020-12-28 21:28:15','',NULL,0,0,NULL),
(3,'kajal','lohana','12345-1234567-2','Gender','03234564322','admin@gmail.com','hyderabad sindh','admin','admin',1,'2021-01-02 12:30:10','',NULL,1,0,NULL),
(4,'receptionist','receptionist','12345-1234567-2','Male','02345678987','receptionist@gmail.com','karachi','receptionist','receptionist',3,'2021-01-02 16:09:06','intermediate','computer',0,1,NULL),
(5,'dr.samreen','memon','11111-1111111-1','Female','03330291119','samreen@gmail.com','hyderabd','samreen','samreen',2,'2021-01-02 17:28:08','MBBS','FCPS',0,1,NULL),
(7,'jiya','lohana','23453-4567894-3','Female','02638293749','jiya@gmail.com','sadar town hyderabad','jiya','jiya1',4,'2021-01-16 01:57:23',NULL,NULL,0,NULL,NULL),
(8,'areesha','shaikh','23453-4567894-3','Female','02638293749','areeshashaikh@gmail.com','hyderabad qasimabad','areesha','areesha1',4,'2021-01-16 02:02:47',NULL,NULL,0,NULL,NULL),
(9,'unsa','shaikh','23453-4567894-4','Female','02638293749','unsa@gmail.com','hyderabad sindh','unsa','unsa1',4,'2021-01-16 02:15:58',NULL,NULL,0,NULL,NULL),
(10,'dr.kajal','lohana','23453-4567894-3','Female','02638293749','kajallohana@gmail.com','hyderabad sindh','kajal','kajal1',2,'2021-01-16 02:27:04','MBBS','eye specialized',0,1,'images//d1.jpg'),
(22,'areesha shaikh','areesha shaikh','','','03330291119','memonareesha61@gmail.com','karachi','memonareesha61@gmail.com','11111',5,'2021-02-20 15:34:49',NULL,NULL,0,17,NULL),
(23,'dr zain ul abdin','zain','11111-1111111-1','Male','03330291119','kajubhotrani@gmail.com','karachi','kajubhotrani@gmail.com','zain940',2,'2021-02-20 16:17:57','MBBS','FCPS',0,17,''),
(24,'dr saeed ahmed','saeed','11111-1111111-1','Male','03330291119','kajubhotrani@gmail.com','karachi','kajubhotrani@gmail.com','zain9400',2,'2021-02-20 16:21:43','MBBS','FCPS',0,17,''),
(25,'areeesha shaikh','shaikh','11111-1111111-1','Female','03330291119','areeshashaikh98@gmail.com','karachi','areeshashaikh98@gmail.com','22222',2,'2021-02-20 16:26:44','MBBS','FCPS',0,17,''),
(26,'patient one','fpatient','11111-1111111-1','Male','03330291119','zain.tahiri940@gmail.com','karachi','zain.tahiri940@gmail.com','zain123',4,'2021-03-01 21:44:06',NULL,NULL,1,NULL,NULL),
(27,'abc clinic','abc clinic','','','03330291119','zain.tahiri940@gmail.com','karachi','zain.tahiri940@gmail.com','clinic1',5,'2021-03-05 23:18:57',NULL,NULL,0,18,NULL),
(28,'areeshaReceptionist','receptionist','11111-1111111-1','Male','03330291119','areeshashaikh98@gmail.com','karachi','abc@gmail.com','receptionist',3,'2021-03-09 21:22:35','Graduate','data entery',0,17,NULL),
(29,'receptionist','memon','11111-1111111-1','Female','03330291119','areeshashaikh98@gmail.com','karachi','areeshashaikh98@gmail.com','areesha98',3,'2021-03-16 00:04:19','intermediate','data entry operator',1,17,''),
(30,'dr sumbal','kamboh','11111-1111111-1','Female','03330291119','kajallohana123@gmail.com','karachi','kajallohana123@gmail.com','kajal123',2,'2021-03-25 23:04:37','MBBS','FCPS',0,17,''),
(31,'moro clinic','moro clinic','','','03330291119','jiyacms2021@gmail.com','balouch electronics','jiyacms2021@gmail.com','clinic123',5,'2021-03-26 22:31:13',NULL,NULL,1,19,NULL),
(32,'Dr Hamid','Khan','11111-1111111-1','Male','03330291119','kajallohana123@gmail.com','hyderabd','kajallohana123@gmail.com','doctor123',2,'2021-03-26 22:35:35','MBBS','FCPS',1,19,''),
(33,'rajputana','rajputana','','','03355676545','unaizacms2021@gmail.com','citizen hyderabad','unaizacms2021@gmail.com','unaiza2021',5,'2021-04-07 23:59:51',NULL,NULL,1,20,NULL),
(34,'munaiza','shaikh','12345-9876545-5','Female','03355676546','munaizacms2021@gmail.com','main highway','munaizacms2021@gmail.com','munaiza2021',3,'2021-04-08 00:42:45','bachelors degree','nursing',1,20,''),
(35,'iqra','shaikhh','12345-9876545-3','Female','03355676544','iqracms2021@gmail.com','main highway','iqracms2021@gmail.com','iqra2021',3,'2021-04-08 00:56:38','bachelors degree','nursing',1,20,''),
(36,'jote','lohana','12345-9876545-1','Female','03355676545','jotecms2021@gmail.com','citizen hyderabad','jotecms2021@gmail.com','jote2021',2,'2021-04-08 01:09:28','mbbs','skin',1,20,'images//doc1.jpg'),
(39,'kajal','bhutrani','12345-9876545-1','Female','03355676546','kajalbhutrani@gmail.com','main highway','kajalbhutrani@gmail.com','kaju1234',4,'2021-04-08 04:29:22',NULL,NULL,1,NULL,NULL),
(40,'Isra clinic','Isra clinic','',NULL,'+923459374844','hudacms2021@gmail.com','isra hyderabad','hudacms2021@gmail.com','huda2021',5,'2021-06-18 15:52:42','','',1,70,NULL),
(41,'anita','recep','23453-4567894-4','Female','03234564321','anitacms2021@gmail.com','Qasimabad hyderabad','anitacms2021@gmail.com','anita2021',3,'2021-06-18 16:47:40','bachelors','medical',1,70,''),
(42,'clinic','clinic',NULL,NULL,'+923459374839','clinic@gmail.com',' main wadhu wah road  hyderabad','clinic@gmail.com','clinic12345',5,'2021-06-18 19:09:34',NULL,NULL,1,71,NULL),
(43,'Dr.Maryam','Jawed','23453-4567894-7','Female','02638293749','aimancms2021@gmail.com','Ali Palace','aimancms2021@gmail.com','aiman@2021',2,'2021-06-18 19:20:56','MBBS','eye',1,70,'images//maryam.jpg'),
(44,'areezee','shaikh','23453-4567894-4','Female','+926574839245','areezee24@gmail.com','Qasim chok','areezee24@gmail.com','areezee@2021',4,'2021-06-18 19:41:14',NULL,NULL,1,NULL,NULL);

/*Table structure for table `symptoms` */

DROP TABLE IF EXISTS `symptoms`;

CREATE TABLE `symptoms` (
  `symptomid` int(11) NOT NULL AUTO_INCREMENT,
  `symptom` varchar(250) DEFAULT NULL,
  `diseaseid` int(11) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedby` int(11) DEFAULT NULL,
  `modifieddate` varchar(250) DEFAULT NULL,
  `isactive` int(11) DEFAULT NULL,
  PRIMARY KEY (`symptomid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `symptoms` */

insert  into `symptoms`(`symptomid`,`symptom`,`diseaseid`,`description`,`createdby`,`createddate`,`modifiedby`,`modifieddate`,`isactive`) values 
(1,'abc symptoms',4,'abc symptoms UPDATED',29,'2021-03-28 16:34:56',29,'2021-03-28 17:01:07',1),
(2,'New Symptoms',4,'new Symptoms',29,'2021-03-28 17:02:07',29,'2021-03-28 17:02:07',1),
(3,'dropping water from eye',5,'dropping ',31,'2021-04-03 15:37:27',31,'2021-04-03 15:37:27',1),
(4,'pimples',6,'Skin is the outer layer of something.',35,'2021-04-08 03:18:26',35,'2021-04-08 03:18:44',1),
(5,'darken skin',6,'black spots',35,'2021-04-08 03:19:36',35,'2021-04-08 03:19:36',1),
(6,'teeth pain',7,'due to sweets',40,'2021-06-18 17:11:26',40,'2021-06-18 17:12:34',1),
(7,'yellow teeth',7,'become yellow in color',40,'2021-06-18 17:53:53',40,'2021-06-18 17:54:32',1),
(8,'blindness',8,'no view',40,'2021-06-18 19:15:36',40,'2021-06-18 19:15:48',1);

/*Table structure for table `tbldisease` */

DROP TABLE IF EXISTS `tbldisease`;

CREATE TABLE `tbldisease` (
  `diseaseid` int(11) NOT NULL AUTO_INCREMENT,
  `disease` varchar(250) DEFAULT NULL,
  `clinicserviceid` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `isactive` int(11) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedby` int(11) DEFAULT NULL,
  `modifieddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`diseaseid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `tbldisease` */

insert  into `tbldisease`(`diseaseid`,`disease`,`clinicserviceid`,`description`,`isactive`,`createdby`,`createddate`,`modifiedby`,`modifieddate`) values 
(1,'Abc disease',5,'abce disease desc',1,4,'2021-01-03 15:43:54',4,'2021-01-03 15:43:54'),
(2,'Anxiety disorders',6,'headache',1,4,'2021-01-16 02:37:29',4,'2021-01-16 02:37:29'),
(3,'infertilityy',7,'treatment for sexually transmitted infections STIs',1,4,'2021-01-16 09:05:26',4,'2021-01-16 09:05:26'),
(4,'Abc disease',8,'abce disease desc',1,28,'2021-03-18 18:29:08',28,'2021-03-18 18:29:08'),
(5,'eye infection',9,'eye infection',1,31,'2021-04-03 15:36:04',31,'2021-04-03 15:36:04'),
(6,'Acnye',11,'Skin is the outer layer of something.',1,34,'2021-04-08 01:35:51',35,'2021-04-08 01:35:51'),
(7,'Gum disease',12,'Gum disease (gingivitis) Gum disease also called gingivitis',1,40,'2021-06-18 16:53:50',40,'2021-06-18 16:53:50'),
(8,'Cataract',13,'Cataract is a clouding of the eyes lens and is the leading cause of blindness worldwide, and the leading cause of vision loss',1,40,'2021-06-18 19:14:44',40,'2021-06-18 19:14:44');

/*Table structure for table `time` */

DROP TABLE IF EXISTS `time`;

CREATE TABLE `time` (
  `timeid` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(250) NOT NULL,
  `createdby` int(11) DEFAULT NULL,
  `createddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedby` int(11) DEFAULT NULL,
  `modifieddate` varchar(250) DEFAULT NULL,
  `isactive` int(11) DEFAULT NULL,
  `clinicid` int(11) DEFAULT NULL,
  PRIMARY KEY (`timeid`,`time`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

/*Data for the table `time` */

insert  into `time`(`timeid`,`time`,`createdby`,`createddate`,`modifiedby`,`modifieddate`,`isactive`,`clinicid`) values 
(1,'9:00',22,'2021-02-21 10:47:16',29,'2021-03-28 17:28:55',1,17),
(2,'9:30',22,'2021-02-21 10:52:36',29,'2021-03-28 17:27:03',1,17),
(3,'10:30',22,'2021-02-21 11:45:01',NULL,NULL,1,17),
(4,'10:00',22,'2021-02-21 12:18:38',NULL,NULL,1,17),
(7,'12:00',22,'2021-03-25 23:26:33',NULL,NULL,1,17),
(8,'12:30',22,'2021-03-25 23:26:41',NULL,NULL,1,17),
(9,'12:45',22,'2021-03-25 23:26:47',NULL,NULL,1,17),
(10,'10:00am',31,'2021-03-26 22:36:41',NULL,NULL,1,19),
(11,'10:30am',31,'2021-03-26 22:36:55',NULL,NULL,1,19),
(12,'11:00',31,'2021-03-26 22:37:25',NULL,NULL,1,19),
(13,'12:00',31,'2021-03-26 22:37:38',NULL,NULL,1,19),
(14,'09:00',33,'2021-04-08 01:19:52',NULL,NULL,1,20),
(15,'10:00',33,'2021-04-08 01:20:23',NULL,NULL,1,20),
(16,'11:00',33,'2021-04-08 01:20:40',NULL,NULL,1,20),
(17,'12:00',33,'2021-04-08 01:20:54',NULL,NULL,1,20),
(18,'13:00',33,'2021-04-08 01:21:06',NULL,NULL,1,20),
(19,'9:00',40,'2021-06-18 17:31:16',40,'2021-06-18 17:44:32',1,70),
(20,'11 : 00',40,'2021-06-18 17:35:07',NULL,NULL,1,70),
(21,'12:00',40,'2021-06-18 17:45:04',NULL,NULL,1,70),
(22,'13:00',40,'2021-06-18 17:48:36',NULL,NULL,1,70),
(23,'14:00',40,'2021-06-18 17:55:48',NULL,NULL,1,70),
(24,'15:00',40,'2021-06-18 18:01:58',NULL,NULL,1,70),
(25,'16:00',40,'2021-06-18 18:13:22',NULL,NULL,1,70),
(26,'17:00',40,'2021-06-18 18:17:58',NULL,NULL,1,70),
(27,'7:00',40,'2021-06-18 19:03:21',NULL,NULL,1,70),
(28,'8:00',40,'2021-06-18 19:05:15',NULL,NULL,1,70),
(29,'6:00',40,'2021-06-18 21:23:52',NULL,NULL,1,70),
(30,'6:00',40,'2021-06-18 21:33:42',NULL,NULL,1,70);

/*Table structure for table `timetable` */

DROP TABLE IF EXISTS `timetable`;

CREATE TABLE `timetable` (
  `TimeTableId` int(100) NOT NULL AUTO_INCREMENT,
  `ClinicId` int(100) NOT NULL,
  `DoctorId` int(100) NOT NULL,
  `FromTime` int(11) NOT NULL,
  `ToTime` int(11) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` int(11) NOT NULL,
  `ModifiedDate` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `IsActive` varchar(100) NOT NULL,
  `day` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`TimeTableId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `timetable` */

insert  into `timetable`(`TimeTableId`,`ClinicId`,`DoctorId`,`FromTime`,`ToTime`,`Description`,`CreatedDate`,`CreatedBy`,`ModifiedDate`,`IsActive`,`day`) values 
(1,17,24,2,3,'Tuesday','2021-02-21 13:30:11',22,'now()','0','Tuesday'),
(2,17,23,1,2,'Monday','2021-02-21 13:55:17',22,'now()','1','Tuesday'),
(3,17,23,2,3,'abce disease desc','2021-02-21 15:22:40',22,'','0','Friday'),
(4,17,25,1,2,'Tuesday','2021-03-18 17:44:10',28,'now()','1','Tuesday'),
(5,17,25,4,3,'thursday timing','2021-03-18 17:49:27',28,'','1','Thursday'),
(6,17,23,1,2,'monday','2021-03-25 23:05:19',29,'','1','Monday'),
(7,17,0,1,2,'monday','2021-03-25 23:06:49',29,'','0','Monday'),
(11,17,30,1,2,'abce disease desc','2021-03-25 23:55:57',29,'','1','Friday'),
(12,17,30,1,2,'Eye clinic','2021-03-26 00:01:31',29,'','1','Monday'),
(13,19,32,12,13,'Tuesday','2021-03-26 22:38:45',31,'','1','Tuesday'),
(14,20,36,14,17,'Skin is the outer layer of something.','2021-04-08 01:23:44',33,'now()','1','Monday'),
(15,20,36,16,17,'Skin is the outer layer of something.','2021-04-08 01:27:01',33,'','1','Tuesday'),
(16,70,43,20,22,'eye care','2021-06-18 19:35:34',40,'now()','1','Wednesday');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
