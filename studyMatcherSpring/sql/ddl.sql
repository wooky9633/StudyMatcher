create sequence hibernate_sequence start with 1 increment by 1;
create table category (category_id bigint not null, name varchar(255), parent_id bigint, primary key (category_id));
create table chat_message (message_id bigint not null, message varchar(255), time timestamp, chat_room_id bigint, member_id bigint, primary key (message_id));
create table chat_room (chat_room_id bigint not null, primary key (chat_room_id));
create table chat_room_join (chat_room_join_id bigint not null, chat_room_id bigint, member_id bigint, primary key (chat_room_join_id));
create table member (member_id bigint not null, level varchar(255), city varchar(255), gu varchar(255), name varchar(255), nickname varchar(255), password varchar(255), test_date date, primary key (member_id));
create table study (study_id bigint not null, level varchar(255), city varchar(255), gu varchar(255), name varchar(255), status varchar(255), type varchar(255), leader_id bigint, study_page_id bigint, primary key (study_id));
create table study_category (study_category_id bigint not null, category_id bigint, study_id bigint, primary key (study_category_id));
create table study_join (study_join_id bigint not null, member_id bigint, study_id bigint, primary key (study_join_id));
create table study_page (study_page_id bigint not null, path varchar(255), primary key (study_page_id));
create table time_table (time_table_id bigint not null, date date, end_time time, start_time time, member_id bigint, primary key (time_table_id));

alter table category add foreign key (parent_id) references category (category_id);
alter table chat_message add foreign key (chat_room_id) references chat_room (chat_room_id);
alter table chat_message add foreign key (member_id) references member (member_id);
alter table chat_room_join add foreign key (chat_room_id) references chat_room (chat_room_id);
alter table chat_room_join add foreign key (member_id) references member (member_id);
alter table study add foreign key (leader_id) references member (member_id);
alter table study add foreign key (study_page_id) references study_page (study_page_id);
alter table study_category add foreign key (category_id) references category (category_id);
alter table study_category add foreign key (study_id) references study (study_id);
alter table study_join add foreign key (member_id) references member (member_id);
alter table study_join add foreign key (study_id) references study (study_id);
alter table time_table add foreign key (member_id) references member (member_id);