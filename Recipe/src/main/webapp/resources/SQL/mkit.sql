create table mkit_menu(
    mk_id varchar2(50) primary key --ǰ�� ��ȣ
    ,mk_name varchar2(200) not null --ǰ���
    ,mk_price number(38) not null --����
    ,mk_images varchar2(200) --���� �̹���
    ,mk_info varchar2(4000) --��ǰ ������
    ,mk_sell number(38) default 0 --�Ǹŷ�
    ,mk_date date --��� ��¥
);
select * from mkit_menu order by to_number(mk_id) desc;
select * from (select rowNum rNum,mk_id, mk_name, mk_price, mk_images
		from (select * from mkit_menu 
		order by mk_id desc)) where rNum >= 1 and rNum <= 6;

select * from (select rowNum rNum,mk_id, mk_name, mk_price, mk_images
		from (select * from mkit_menu order by to_number(mk_sell) desc)) where rNum >=1 and rNum <= 4;
update mkit_menu set mk_sell=15 where mk_id=14;
update mkit_menu set mk_sell=5 where mk_id=12;
update mkit_menu set mk_sell=19 where mk_id=15;
update mkit_menu set mk_sell=11 where mk_id=5;


--m_member
create table mkit_member(
    mkit_name varchar2(50) not null --ȸ���̸�
    ,mkit_id varchar2(50) primary key --ȸ�����̵�
    ,mkit_password varchar2(50) not null --ȸ����й�ȣ
    ,mkit_mail varchar2(100) not null --�̸���
    ,mkit_phone varchar2(100) not null --��
    ,grante number(38) default 0 --���� 0�̸� �Ϲ�ȸ�� 1�̸� ������
    ,mkit_state number(38) --�����̸� 1 Ż��� 2�� ����
    ,mkit_date date
)
select grante from mkit_member where mkit_id = 'a';

select * from mkit_member;

insert into mkit_member values ('������', 'admin', 'admin', 'admin@naver.com', '1111-1111', 1, 1, SYSDATE);

create table mkit_gongji(
    gongji_no number(38) primary key
    ,gongji_title varchar2(100) not null
    ,gongji_writer varchar2(50) not null
    ,gongji_cont varchar2(3000) not null
    ,gongji_hit number(38) default 0
    ,gongji_date date
)

select count(gongji_no) from mkit_gongji where gongji_title like '����';

create table mkit_custom(
    custom_no number(38) primary key
    ,custom_title varchar2(100) not null
    ,custom_writer varchar2(50) not null
    ,custom_cont varchar2(3000) not null
    ,custom_hit number(38) default 0
    ,custom_date date
)
insert into mkit_gongji values(mk_gong_seq.nextval, '����', '�ۼ���1', 'sossssssssssssssssssss\nsssss\nssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss', 0, SYSDATE);
insert into mkit_custom values(mk_cus_seq.nextval, '����', '�ۼ���1', 'sossssssssssssssssssssss', 0, SYSDATE);


--�������װԽ��� ������
create sequence mk_gong_seq
start with 1
increment by 1 --1�� ����
nocache;

--����ڰԽ��� ������
create sequence mk_cus_seq
start with 1
increment by 1 --1�� ����
nocache;

--mk_seq
create sequence mk_seq
start with 1 --1����
increment by 1 --1�� ����
nocache;

commit;

delete from mkit_custom;
commit;
 
        