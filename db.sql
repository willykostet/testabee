create table if not exists apps
(
	idx serial not null
		constraint apps_pk
			primary key,
	app text,
	land text,
	version text,
	views integer default 0
);

comment on table apps is 'Apps';

comment on column apps.app is 'app name (domain)';

comment on column apps.land is 'JSON config';

comment on column apps.version is 'Name for content version';

comment on column apps.views is 'Count of views';

alter table apps owner to postgres;

create unique index if not exists apps_idx_uindex
	on apps (idx);

create table if not exists users
(
	idx serial not null
		constraint users_pk
			primary key,
	uid text,
	app text,
	version text
);

comment on table users is 'users';

comment on column users.uid is 'unique user id';

comment on column users.app is 'app name';

comment on column users.version is 'app version';

alter table users owner to postgres;

create unique index if not exists users_idx_uindex
	on users (idx);

create unique index if not exists users_uid_uindex
	on users (uid);


