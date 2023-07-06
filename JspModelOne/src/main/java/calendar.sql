
	create table calendar(
	seq int auto_increment primary key, -- decimal
	id varchar(50) not null,
	title varchar(200) not null,
	content varchar(4000),
	rdate varchar(12) not null, -- 202307041430
	wdate timestamp not null
	);
	
	alter table calendar
	add
	constraint fk_cal_id foreign key(id)
	references member(id);
	
select seq, id, title,content,rdate, wdate
from
(select row_number()over(partition by substr(rdate,1,8) order by rdate asc) as rnum,
	seq,id , title,content, rdate, wdate
	from calendar
	where id='abc' and substr(rdate , 1, 6)='202307231450') a
where rnum between 1 and 5;

select seq, id, title,content,rdate, wdate
from
(select row_number()over(partition by substr(rdate,1,8) order by rdate asc) as rnum,
	seq,id , title,content, rdate, wdate
	from calendar
	where id=? and substr(rdate , 1, 6)=?) a
where rnum between 1 and 5;