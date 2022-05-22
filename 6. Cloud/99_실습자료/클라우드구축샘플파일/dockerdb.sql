CREATE USER webmaster IDENTIFIED BY webmaster;
GRANT CONNECT, RESOURCE TO webmaster;

DROP TABLE member;

CREATE TABLE member (
    id VARCHAR2(100), 
	pw VARCHAR2(100) NOT NULL, 
	nick VARCHAR2(100) NOT NULL
);

ALTER TABLE member ADD CONSTRAINT member_pk PRIMARY KEY (id);

DELETE member;
INSERT INTO member ( id, pw, nick ) VALUES ( 'tester', '1234', 'testernick' );
INSERT INTO member ( id, pw, nick ) VALUES ( 'master', 'qwer1234', 'masternick' );
COMMIT;