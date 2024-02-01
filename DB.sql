DROP DATABASE IF EXISTS `Spring_AM_01`;
CREATE DATABASE `Spring_AM_01`;
USE `Spring_AM_01`;

# article 테이블 생성
CREATE TABLE article(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    title CHAR(100) NOT NULL,
    `body` TEXT NOT NULL
);

ALTER TABLE article ADD COLUMN memberId INT(10) UNSIGNED NOT NULL AFTER `body`;

# member 테이블 생성
CREATE TABLE `member`(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    loginId CHAR(20) NOT NULL,
    loginPw CHAR(80) NOT NULL,
    `authlevel` SMALLINT(2) UNSIGNED DEFAULT 3 COMMENT '권한 레벨  (3=일반,7=관리자)',
    `name` CHAR(20) NOT NULL,
    nickname CHAR(20) NOT NULL,
    cellphoneNum CHAR(20),
    email CHAR(50),
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '탈퇴 여부 (0=탈퇴 전, 1=탈퇴 후)',
    delDate DATETIME COMMENT '탈퇴 날짜'
);



# article TD 생성
INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
title = '제목1',
`body` = '내용1';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
title = '제목2',
`body` = '내용2';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
title = '제목3',
`body` = '내용3';


# member TD 생성
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'admin',
loginPw = 'admin',
`authlevel`  = 7,
`name` = '관리자',
nickname = '관리자',
cellphoneNum = '01012341234',
email = 'test1@test.com';

INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'test1',
loginPw = 'test1',
`name` = 'testName1',
nickname = 'testNickname1',
cellphoneNum = '01023451234',
email = 'test2@test.com';

INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'test2',
loginPw = 'test2',
`name` = 'testName2',
nickname = 'testNickname2',
cellphoneNum = '01034561234',
email = 'test3@test.com';

############################################
SELECT *
FROM article
order by id desc;

select *
from `member`
order by id desc;

select last_insert_id();

show full columns from `member`; 

SELECT a.*, m.name
FROM article a
JOIN `member` m
ON a.memberId = m.id;
