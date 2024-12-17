--교수 테이블
CREATE TABLE 교수 (
    교번 INT PRIMARY KEY,
    교수명 VARCHAR(50)
);

--강의실 테이블
CREATE TABLE 강의실 (
    강의실번호 INT PRIMARY KEY,
    좌석수 INT
);

--교과목 테이블
CREATE TABLE 교과목 (
    과목번호 INT PRIMARY KEY,
    과목명 VARCHAR(100)
);

--학생 테이블
CREATE TABLE 학생 (
    학번 INT PRIMARY KEY,
    학생명 VARCHAR(50)
);

--강의 테이블
CREATE TABLE 강의 (
    강의ID INT PRIMARY KEY AUTO_INCREMENT,
    교번 INT,
    강의실번호 INT,
    과목번호 INT,
    FOREIGN KEY (교번) REFERENCES 교수(교번),
    FOREIGN KEY (강의실번호) REFERENCES 강의실(강의실번호),
    FOREIGN KEY (과목번호) REFERENCES 교과목(과목번호)
);

--수강신청 테이블
CREATE TABLE 수강신청 (
    신청ID INT PRIMARY KEY AUTO_INCREMENT,
    학번 INT,
    과목번호 INT,
    신청날짜 DATE,
    FOREIGN KEY (학번) REFERENCES 학생(학번),
    FOREIGN KEY (과목번호) REFERENCES 교과목(과목번호)
);

--수강취소 테이블
CREATE TABLE 수강취소 (
    취소ID INT PRIMARY KEY AUTO_INCREMENT,
    학번 INT,
    과목번호 INT,
    취소날짜 DATE,
    FOREIGN KEY (학번) REFERENCES 학생(학번),
    FOREIGN KEY (과목번호) REFERENCES 교과목(과목번호)
);


--멘토링 테이블
CREATE TABLE 멘토링 (
    멘토링ID INT PRIMARY KEY AUTO_INCREMENT,
    멘토학번 INT,
    멘티학번 INT,
    FOREIGN KEY (멘토학번) REFERENCES 학생(학번),
    FOREIGN KEY (멘티학번) REFERENCES 학생(학번)
);
