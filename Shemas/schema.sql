CREATE TABLE users (
 iduser BIGSERIAL NOT NULL/* Идентификатор пользователя */,
 login VARCHAR(150)/* Логин пользователя */,
 hash VARCHAR(2500)/* Пароль пользователя */,
 salt VARCHAR(1500),
 email VARCHAR/* Адрес электронной почты */
);


ALTER TABLE users ADD CONSTRAINT users_pkey PRIMARY KEY (iduser);
COMMENT ON TABLE "users" IS 'Пользователи';
COMMENT ON COLUMN "users"."iduser" IS 'Идентификатор пользователя';
COMMENT ON COLUMN "users"."login" IS 'Логин пользователя';
COMMENT ON COLUMN "users"."hash" IS 'Пароль пользователя';
COMMENT ON COLUMN "users"."email" IS 'Адрес электронной почты';

CREATE TABLE groups (
 idgroup BIGSERIAL/* Идентификатор группы */,
 namegroup VARCHAR(250)/* наименование группы */
);


ALTER TABLE groups ADD CONSTRAINT groups_pkey PRIMARY KEY (idgroup);
COMMENT ON TABLE "groups" IS 'Группы ссылок';
COMMENT ON COLUMN "groups"."idgroup" IS 'Идентификатор группы';
COMMENT ON COLUMN "groups"."namegroup" IS 'наименование группы';

CREATE TABLE links (
 idlink BIGSERIAL/* идентификатор ссылки */,
 namelink VARCHAR(250)/* наименование ссылки */,
 link VARCHAR(500)/* Ссылка на нужный портал */
);


ALTER TABLE links ADD CONSTRAINT links_pkey PRIMARY KEY (idlink);
COMMENT ON TABLE "links" IS 'Список ссылок';
COMMENT ON COLUMN "links"."idlink" IS 'идентификатор ссылки';
COMMENT ON COLUMN "links"."namelink" IS 'наименование ссылки';
COMMENT ON COLUMN "links"."link" IS 'Ссылка на нужный портал';

CREATE TABLE grouplinks (
 iduser INTEGER NOT NULL/* Идентификатор пользователя */,
 idlink INTEGER/* идентификатор ссылки */,
 idgroup INTEGER/* Идентификатор группы */,
 idgrouplinks BIGSERIAL
);


ALTER TABLE grouplinks ADD CONSTRAINT grouplinks_pkey PRIMARY KEY ();
COMMENT ON TABLE "grouplinks" IS 'Группировка ссылок';
COMMENT ON COLUMN "grouplinks"."iduser" IS 'Идентификатор пользователя';
COMMENT ON COLUMN "grouplinks"."idlink" IS 'идентификатор ссылки';
COMMENT ON COLUMN "grouplinks"."idgroup" IS 'Идентификатор группы';

ALTER TABLE grouplinks ADD CONSTRAINT grouplinks_iduser_fkey FOREIGN KEY (iduser) REFERENCES users(iduser);
ALTER TABLE grouplinks ADD CONSTRAINT grouplinks_idlink_fkey FOREIGN KEY (idlink) REFERENCES links(idlink);
ALTER TABLE grouplinks ADD CONSTRAINT grouplinks_idgroup_fkey FOREIGN KEY (idgroup) REFERENCES groups(idgroup);
