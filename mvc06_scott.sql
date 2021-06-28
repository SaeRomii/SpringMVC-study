SELECT USER
FROM DUAL;
--==>> SCOTT

--�� ���� ���̺� ����
DROP TABLE TBL_MEMBERLIST;
--==>> Table TBL_MEMBERLIST��(��) �����Ǿ����ϴ�.

--�� �ǽ� ���̺� �ٽ� ����
CREATE TABLE TBL_MEMBERLIST
( ID    VARCHAR2(30)
, PW    VARCHAR2(20)
, NAME  VARCHAR2(50)
, TEL   VARCHAR2(50)
, EMAIL VARCHAR2(100)
, CONSTRAINT MEMBERLIST_ID_PK PRIMARY KEY(ID)
);
--==>> Table TBL_MEMBERLIST��(��) �����Ǿ����ϴ�.


--�� ������ �Է�
INSERT INTO TBL_MEMBERLIST(ID, PW, NAME, TEL, EMAIL)
VALUES('admin', CRYPTPACK.ENCRYPT('java006$', 'java006$')
       , '������', '010-1111-1111', 'hhr@test.com');
--> �� �� ����
INSERT INTO TBL_MEMBERLIST(ID, PW, NAME, TEL, EMAIL) VALUES('admin', CRYPTPACK.ENCRYPT('java006$', 'java006$'), '������', '010-1111-1111', 'hhr@test.com')
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.


--�� Ȯ��
SELECT ID, NAME, TEL, EMAIL
FROM TBL_MEMBERLIST;
--> �� �� ����
SELECT ID, NAME, TEL, EMAIL FROM TBL_MEMBERLIST
;
--==>> admin	    ������	010-1111-1111	hhr@test.com


--�� Ŀ��
COMMIT;
--==>> Ŀ�Կ�.













