﻿IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'movie_poster')
BEGIN
	CREATE DATABASE [movie_poster]
END
GO
USE [movie_poster]
GO
/****** Object:  Table [dbo].[user]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](20) NOT NULL,
	[email] [nvarchar](320) NOT NULL,
	[password] [nvarchar](30) NULL,
	[address_id] [int] NULL,
	[profile_id] [int] NULL,
	[status] [nvarchar](10) NULL,
	[role] [nvarchar](10) NULL,
	[password_reset_token] [nvarchar](320) NULL,
	[accout_activasion_status] [nvarchar](20) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_user_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[mov_user_info]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[mov_user_info]
AS
SELECT        email, password, adress_id, profile_id, status, role, created_at, updated_at, login, id
FROM            dbo.[user]
GO
/****** Object:  Table [dbo].[movie]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movie](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](200) NOT NULL,
	[original_title] [nvarchar](200) NULL,
	[status] [nvarchar](20) NULL,
	[original_language] [nvarchar](50) NULL,
	[runtime] [time](0) NULL,
	[budget] [decimal](19, 4) NULL,
	[revenue] [decimal](19, 4) NULL,
	[description] [nvarchar](500) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[in_theaters] [datetime] NULL,
	[on_discs] [datetime] NULL,
	[rating] [nvarchar](5) NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genre]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genre](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_genre] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[mov_movie_info_short]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[mov_movie_info_short]
AS
SELECT        dbo.genre.title, dbo.movie.title AS Expr1, dbo.movie.status, dbo.movie.in_theaters, dbo.movie.on_discs, dbo.movie.rating
FROM            dbo.movie INNER JOIN
                         dbo.genre ON dbo.movie.id = dbo.genre.id
GO
/****** Object:  View [dbo].[mov_movie_info_full]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[mov_movie_info_full]
AS
SELECT        dbo.genre.title, dbo.movie.rating, dbo.movie.on_discs, dbo.movie.in_theaters, dbo.movie.updated_at, dbo.movie.created_at, dbo.movie.description, dbo.movie.revenue, dbo.movie.runtime, dbo.movie.original_language, 
                         dbo.movie.status, dbo.movie.original_title, dbo.movie.title AS Expr1, dbo.movie.budget
FROM            dbo.movie INNER JOIN
                         dbo.genre ON dbo.movie.id = dbo.genre.id
GO
/****** Object:  Table [dbo].[address]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[country] [nvarchar](45) NOT NULL,
	[city] [nvarchar](45) NOT NULL,
	[postcode] [nvarchar](20) NOT NULL,
	[state] [nvarchar](45) NOT NULL,
	[street_name] [nvarchar](45) NOT NULL,
	[street_number] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_adress] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[mov_adress_info]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[mov_adress_info]
AS
SELECT        street_number, street_name, state, postcode, city, country
FROM            dbo.address
GO
/****** Object:  Table [dbo].[crew_member]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crew_member](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](20) NOT NULL,
	[role] [nvarchar](30) NOT NULL,
	[gender] [nvarchar](10) NULL,
	[place_of_birth] [nvarchar](150) NULL,
	[birthday] [date] NULL,
	[last_name] [nvarchar](20) NOT NULL,
	[patronimyc_name] [nvarchar](20) NULL,
	[biography] [nvarchar](500) NULL,
 CONSTRAINT [PK_crew_member] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[favorite_movies]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favorite_movies](
	[user_id] [int] NOT NULL,
	[movie_id] [int] NOT NULL,
 CONSTRAINT [PK_favorite_movies] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[movie_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movie_crew_member]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movie_crew_member](
	[movie_id] [int] NOT NULL,
	[crew_member_id] [int] NOT NULL,
 CONSTRAINT [PK_movie_crew_member] PRIMARY KEY CLUSTERED 
(
	[movie_id] ASC,
	[crew_member_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movie_genre]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movie_genre](
	[movie_id] [int] NOT NULL,
	[genre_id] [int] NOT NULL,
 CONSTRAINT [PK_movie_genre] PRIMARY KEY CLUSTERED 
(
	[movie_id] ASC,
	[genre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profile]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profile](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](20) NOT NULL,
	[last_name] [nvarchar](20) NOT NULL,
	[patronymic_name] [nvarchar](20) NULL,
	[birthday] [date] NOT NULL,
	[gender] [nvarchar](10) NOT NULL,
	[phone] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_profile] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[review]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[review](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[text] [nvarchar](1000) NULL,
	[reviewer_id] [int] NOT NULL,
	[mark] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NULL,
	[title] [nvarchar](200) NOT NULL,
	[movie_id] [int] NOT NULL,
 CONSTRAINT [PK_review] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[favorite_movies]  WITH CHECK ADD  CONSTRAINT [FK_favorite_movies_movie] FOREIGN KEY([movie_id])
REFERENCES [dbo].[movie] ([id])
GO
ALTER TABLE [dbo].[favorite_movies] CHECK CONSTRAINT [FK_favorite_movies_movie]
GO
ALTER TABLE [dbo].[movie_crew_member]  WITH CHECK ADD  CONSTRAINT [FK_movie_crew_member_crew_member] FOREIGN KEY([crew_member_id])
REFERENCES [dbo].[crew_member] ([id])
GO
ALTER TABLE [dbo].[movie_crew_member] CHECK CONSTRAINT [FK_movie_crew_member_crew_member]
GO
ALTER TABLE [dbo].[movie_crew_member]  WITH CHECK ADD  CONSTRAINT [FK_movie_crew_member_movie] FOREIGN KEY([movie_id])
REFERENCES [dbo].[movie] ([id])
GO
ALTER TABLE [dbo].[movie_crew_member] CHECK CONSTRAINT [FK_movie_crew_member_movie]
GO
ALTER TABLE [dbo].[movie_genre]  WITH CHECK ADD  CONSTRAINT [FK_movie_genre_genre] FOREIGN KEY([movie_id])
REFERENCES [dbo].[genre] ([id])
GO
ALTER TABLE [dbo].[movie_genre] CHECK CONSTRAINT [FK_movie_genre_genre]
GO
ALTER TABLE [dbo].[movie_genre]  WITH CHECK ADD  CONSTRAINT [FK_movie_genre_movie] FOREIGN KEY([movie_id])
REFERENCES [dbo].[movie] ([id])
GO
ALTER TABLE [dbo].[movie_genre] CHECK CONSTRAINT [FK_movie_genre_movie]
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD  CONSTRAINT [FK_review_movie] FOREIGN KEY([movie_id])
REFERENCES [dbo].[movie] ([id])
GO
ALTER TABLE [dbo].[review] CHECK CONSTRAINT [FK_review_movie]
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD  CONSTRAINT [FK_review_reviewer] FOREIGN KEY([reviewer_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[review] CHECK CONSTRAINT [FK_review_reviewer]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_adress] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_adress]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_profile] FOREIGN KEY([profile_id])
REFERENCES [dbo].[profile] ([id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_profile]
GO
/****** Object:  StoredProcedure [dbo].[mov_add_address]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_add_address]
	@user_id int,
	@country nvarchar(45),
	@city nvarchar(45),
	@postcode nvarchar(20),
	@state nvarchar(45),
	@street_name nvarchar(45),
	@street_number nvarchar(10)
AS
BEGIN
	if(not exists(select id from [user] where id = @user_id))
	print 'User with specified id does not exist.'
	else
	if((select role from [user] where id = @user_id)='reviewer')
	print 'Reviewer can not have an adress.'
	else
	if((select address_id from [user] where id = @user_id)is not null)
	print 'The address already exists.'
	else
	begin
	declare @address_id as table(id int);
		insert into [address] (country,city,postcode,[state],street_name,street_number)
		output inserted.id into @address_id
	values		(@country,
				 @city,
				 @postcode,
				 @state,
				 @street_name,
				 @street_number);
	update [user]
		set address_id = (select id from @address_id) where id=@user_id
	end

END;
GO
/****** Object:  StoredProcedure [dbo].[mov_add_admin]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_add_admin]
	@login nvarchar(20),
	@password nvarchar(30),
	@email nvarchar(320)
AS
BEGIN
	if(exists(select email from [user] where email = @email))
	print 'The email is already used.'
	else 
	insert into [user] (login,password,email,created_at,role)
	values		(@login,
				@password,
				@email,
				GETDATE(),
				'admin');
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_add_favorite_movie]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_add_favorite_movie]
	@user_id int,
	@movie_id int
AS
BEGIN
	if(not exists(select id from [user] where id = @user_id))
	print 'User with specified id does not exist.'
	else
	if(not exists(select id from movie where id = @movie_id))
	print 'Movie with specified id does not exist.'
	else
	if((select [role] from [user] where id = @user_id) = 'reviewer')
	print 'Reviewers can not have favorite movies.'
	else
	if(exists (select [user].id, [movie].id from [user], 
	movie where [user].id = @user_id and [movie].id = @movie_id))
	print 'This movie has been already added'
	else
	insert into [favorite_movies] 
	values		(@user_id,
				@movie_id);
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_add_genre]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_add_genre]
	@title nvarchar(200)
AS
BEGIN
	if(exists(select title from genre where title=@title))
	print 'This genre already exists'
	else
	insert into [genre] (title)
	values		(@title);
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_add_moderator]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_add_moderator]
	@login nvarchar(20),
	@password nvarchar(30),
	@email nvarchar(320)
AS
BEGIN
	if(exists(select email from [user] where email = @email))
	print 'The email is already used.'
	else 
	insert into [user] (login,password,email,created_at,role)
	values		(@login,
				@password,
				@email,
				GETDATE(),
				'moderator');
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_add_movie]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_add_movie]
	@title nvarchar(200),
	@original_title nvarchar(200) = null,
	@status nvarchar(20) = null,
	@original_language nvarchar(50) = null,
	@runtime time(0) = null,
	@budget decimal(19,4) = null,
	@revenue decimal(19,4) = null,
	@description nvarchar(500) = null,
	@in_theaters datetime = null,
	@on_discs datetime = null,
	@rating nvarchar(5) = null
AS
BEGIN
	if(exists(select id from movie where title=@title))
	print 'The title is already used.'
	else
	insert into [movie] (title,created_at,original_language,
	original_title, runtime, budget, revenue, [description],
	in_theaters,on_discs,rating)
	values		(@title,
				GETDATE(),
				@original_language,
				@original_title,
				@runtime,
				@budget,
				@revenue,
				@description,
				@in_theaters,
				@on_discs,
				@rating);
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_add_movie_genre]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_add_movie_genre]
	@movie_id int,
	@genre_id int
AS
BEGIN
	if(not exists(select id from movie where id = @movie_id))
	print 'Movie with specified id does not exist.'
	else
	if(not exists(select id from genre where id = @genre_id))
	print 'User with specified id does not exist.'
	else
	if(exists (select genre_id, movie_id 
	from movie_genre 
	where genre_id = @genre_id and movie_id = @movie_id))
	print 'This genre has been already added to the movie.'
	else
	insert into movie_genre(movie_id,genre_id) 
	values		(@movie_id,
				@genre_id);
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_add_profile]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_add_profile]
	@user_id int,
	@name nvarchar(20),
	@last_name nvarchar(20),
	@birthday date,
	@gender nvarchar(10),
	@phone nvarchar(20),
	@patronymic_name nvarchar(20) = null
AS
BEGIN
	if(not exists(select id from [user] where id = @user_id))
	print 'User with specified id does not exist.'
	else
	if((select role from [user] where id = @user_id)='reviewer')
	print 'Reviewer can not have a profile.'
	else
	if((select profile_id from [user] where id = @user_id)is not null)
	print 'The user already has profile.'
	else
	begin
	declare @formatted_phone nvarchar(20)
	if(len(@phone) = 12)
	set @formatted_phone = (select concat(left(@phone, 2),
	'(',substring(@phone,3,3),')-',	substring(@phone,6,3),'-',
	substring(@phone,9,2),'-',right(@phone,2)));
	declare @profile_id as table(id int);
		insert into [profile] ([name],last_name,patronymic_name,birthday,gender,phone)
		output inserted.id into @profile_id
	values		(@name,
				 @last_name,
				 @patronymic_name,
				 @birthday,
				 @gender,
				 @formatted_phone);
	update [user]
		set profile_id = (select id from @profile_id) where id=@user_id
	end

END;
GO
/****** Object:  StoredProcedure [dbo].[mov_add_review]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_add_review]
	@title nvarchar(200),
	@reviewer_id int,
	@movie_id int,
	@mark int,
	@text nvarchar(1000) = NULL
AS
BEGIN
	if(not exists(select id from [user] where id = @reviewer_id))
	print 'User with specified id does not exist.'
	else 
	if(not exists(select id from movie where id = @movie_id))
	print 'Movie with specified id does not exist.'
	else 
	if(@mark<0 or @mark>10)
	print 'Mark''s value is out of range.'
	else
	insert into [review] (title,created_at,reviewer_id,movie_id,mark,[text])
	values		(@title,
				GETDATE(),
				@reviewer_id,
				@movie_id,
				@mark,
				@text);
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_add_reviewer]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_add_reviewer]
	@login nvarchar(20),
	@email nvarchar(320)
AS
BEGIN
	if(exists(select email from [user] where email = @email))
	print 'The email is already used.'
	else 
	insert into [user] (login,email,created_at,role)
	values		(@login,
				@email,
				GETDATE(),
				'reviewer');
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_add_user]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_add_user]
	@login nvarchar(20),
	@email nvarchar(320),
	@password nvarchar(30) = NULL,
	@id int output 
AS
BEGIN
	if(exists(select email from [user] where email = @email))
	print 'The email is already used.'
	else
    if(exists(select [login] from [user] where [login] = @login))
	print 'The login is already used.'
	else
	if(@password is not null)
	insert into [user] (login,password,email,created_at,role)
	values		(@login,
				@password,
				@email,
				GETDATE(),
				'user');
	else 
	insert into [user] (login,email,created_at,role)
	values		(@login,
				@email,
				GETDATE(),
				'reviewer');
	select @id=id from [user] where [login] = @login
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_get_address_by_id]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_get_address_by_id]
	@address_id int = null,
	@user_id int = null
AS
BEGIN
	if(@user_id is null and @address_id is null)
	print 'At least one id must not be null.'
	else
	if(@user_id is not null)
	select [address].id,country,city,postcode,
	[state],street_name,street_number
	from [address]
	inner join [user] on  [user].id = @user_id
	where [address_id] = [address].id 
	else 
	select [address].id,country,city,postcode,
	[state],street_name,street_number
	from [address]
	where [id] = @address_id
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_get_all_genre]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_get_all_genre]
AS
BEGIN
	select id,title  
	from [genre]
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_get_all_movie]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_get_all_movie]
AS
BEGIN
	select id,title,original_title,
	original_language,[status],
	original_language,runtime,
	budget,revenue,[description],
	created_at,updated_at,in_theaters,
	on_discs,rating
	from [movie] 
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_get_all_user]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_get_all_user]
AS
BEGIN
	select id,[login],email,[password],address_id,
	profile_id,[status], [role], created_at, 
	updated_at from [user] 
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_get_genre_by_id]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_get_genre_by_id]
	@id int
AS
BEGIN
	if(@id is null or @id<1)  
	print 'id value must not be null or negative.'
	else
	select id,title 
	from [genre] where id = @id
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_get_movie_by_id]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_get_movie_by_id]
	@id int
AS
BEGIN
	if(@id is null or @id<1)  
	print 'id value must not be null or negative.'
	else
	select id,title,original_title,
	original_language,[status],
	original_language,runtime,
	budget,revenue,[description],
	created_at,updated_at,in_theaters,
	on_discs,rating
	from [movie] where id = @id
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_get_movie_genres]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_get_movie_genres]
	@movie_id int
AS
BEGIN
	if(not exists(select id from movie where id = @movie_id))
	print 'Movie with specified id does not exist.'
	else
	select [genre].id,[genre].title from movie_genre 
	inner join  genre on [genre].id = [movie_genre].genre_id
	where movie_id = @movie_id
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_get_multiple_movie]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_get_multiple_movie]
	@start int,
	@count int
AS
BEGIN
	select id from
		(select id 
		from movie 
		) as movie_id
	order by id asc
	OFFSET @start-1 rows -- skip @start rows
	FETCH NEXT @count rows only; -- take @count rows 
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_get_multiple_user]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_get_multiple_user]
	@start int,
	@count int
AS
BEGIN
	select id from
		(select id 
		from [user] 
		) as users_id
	order by id asc
	OFFSET @start-1 rows -- skip @start rows
	FETCH NEXT @count rows only; -- take @count rows 
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_get_profile_by_id]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_get_profile_by_id]
	@profile_id int = null,
	@user_id int = null
AS
BEGIN
	if(@user_id is null and @profile_id is null)
	print 'At least one id must not be null.'
	else
	if(@user_id is not null)
	select [profile].id,[name],last_name,patronymic_name,
	birthday,gender,phone
	from [profile]
	inner join [user] on  [user].id = @user_id
	where [profile_id] = [profile].id 
	else 
	select [profile].id,[name],last_name,patronymic_name,
	birthday,gender,phone
	from [profile]
	where [id] = @profile_id
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_get_user_by_id]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_get_user_by_id]
	@id int
AS
BEGIN
	if(@id is null or @id<1)  
	print 'id value must not be null or negative.'
	else
	select id,[login],email,[password],address_id,
	profile_id,[status], [role], created_at, 
	updated_at from [user] where id = @id
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_get_user_role]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_get_user_role]
	@login nvarchar(20) = null,
	@id int = null
AS
BEGIN
	if(@id is null and @login is null)
	print 'At least one parameter must not be null.' 
	else
	if(@login is not null)
	select [role] 
	from [user] 
	where [login] = @login
	else
	if(@id is null or @id<1)  
	print 'id value must not be null or negative.'
	else
	select [role] 
	from [user] 
	where id = @id
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_remove_address]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_remove_address]
	@id int
AS
BEGIN
	if(@id is null or @id<1)  
	print 'id value must not be null or negative.'
	else
	if(not exists(select id from [address] where id = @id))
	print 'Address with specified id does not exist.'
	else 
    delete from [address]
	where id = @id 
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_remove_genre]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_remove_genre]
	@id int
AS
BEGIN
	if(@id is null or @id<1)  
	print 'id value must not be null or negative.'
	else
	if(not exists(select id from genre where id = @id))
	print 'Genre with specified id does not exist.'
	else 
    delete from genre
	where id = @id 
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_remove_movie]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_remove_movie]
	@id int
AS
BEGIN
	if(@id is null or @id<1)  
	print 'id value must not be null or negative.'
	else
	if(not exists(select id from [movie] where id = @id))
	print 'Movie with specified id does not exist.'
	else 
    delete from [movie]
	where id = @id 
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_remove_profile]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_remove_profile]
	@id int
AS
BEGIN
	if(@id is null or @id<1)  
	print 'id value must not be null or negative.'
	else
	if(not exists(select id from [profile] where id = @id))
	print 'Profile with specified id does not exist.'
	else 
    delete from [profile]
	where id = @id 
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_remove_user]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_remove_user]
	@id int
AS
BEGIN
	if(@id is null or @id<1)  
	print 'id value must not be null or negative.'
	else
	if(not exists(select id from [user] where id = @id))
	print 'User with specified id does not exist.'
	else 
    delete from [user]
	where id = @id 
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_update_address]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--/****** Object:  StoredProcedure [dbo].[mov_add_address]    Script Date: 06.03.2020 22:13:53 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--ALTER
CREATE PROCEDURE [dbo].[mov_update_address]
	@address_id int,
	@country nvarchar(45) = null,
	@city nvarchar(45) = null,
	@postcode nvarchar(20) = null,
	@state nvarchar(45)  = null,
	@street_name nvarchar(45) = null,
	@street_number nvarchar(10) = null
AS
BEGIN
	if(not exists(select id from [address] where id = @address_id))
	print 'Address with specified id does not exist.'
	else
	if(@country is null and @city is null
	and @postcode is null and @state is null
	and @street_name is null and @street_number is null)
	print 'At least one value must be not null.'
	else
	begin
	if(@country is not null)
	update [address] set country = @country
	where id=@address_id
	if(@city is not null)
	update [address] set city = @city
	where id=@address_id
		if(@postcode is not null)
	update [address] set postcode = @postcode
	where id=@address_id
		if(@state is not null)
	update [address] set state = @state
	where id=@address_id
		if(@street_name is not null)
	update [address] set street_name = @street_name
	where id=@address_id
		if(@street_number is not null)
	update [address] set street_number = @street_number
	where id=@address_id
	end

END;
GO
/****** Object:  StoredProcedure [dbo].[mov_update_genre]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_update_genre]
	@id int,
	@title nvarchar(20)
AS
BEGIN
	if(@id is null or @id<1)  
	print 'id value must not be null or less than 1.'
	else
	if(not exists(select id from [genre] where id = @id))
	print 'Genre with specified id does not exist.'
	else
	if(exists(select id from [genre] where title = @title))
	begin
	declare @title_genre_id as int;
	select @title_genre_id = id from [genre] where title = @title 
	print 'Genre with specified title already exists. (id = '
	+  RTRIM(CAST(@title_genre_id AS int))
	+ ').'
	end
	else 
	begin
	if(@title is not null)
	update [genre] set [title] = @title
	where id=@id
	end
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_update_movie]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_update_movie]
	@id int,
	@title nvarchar(200) = null,
	@original_title nvarchar(200) = null,
	@status nvarchar(20) = null,
	@original_language nvarchar(50) = null,
	@runtime time(0) = null,
	@budget decimal(19,4) = null,
	@revenue decimal(19,4) = null,
	@description nvarchar(500) = null,
	@in_theaters datetime = null,
	@on_discs datetime = null,
	@rating nvarchar(5) = null
AS
BEGIN
	if(@id is null or @id<1)  
	print 'id value must not be null or negative.'
	else
	if(not exists(select id from [movie] where id = @id))
	print 'Movie with specified id does not exist.'
	else 
	begin
	if(@title is not null)
	update [movie] set [title] = @title
	where id=@id
	if(@original_title is not null)
	update [movie] set [original_title] = @original_title
	where id=@id
	if(@status is not null)
	update [movie] set [status] = @status
	where id=@id
	if(@original_language is not null)
	update [movie] set [original_language] = @original_language
	where id=@id
	if(@runtime is not null)
	update [movie] set [runtime] = @runtime
	where id=@id
	if(@budget is not null)
	update [movie] set [budget] = @budget
	where id=@id
	if(@revenue is not null)
	update [movie] set [revenue] = @revenue
	where id=@id
	if(@description is not null)
	update [movie] set [description] = @description
	where id=@id
	if(@in_theaters is not null)
	update [movie] set [in_theaters] = @in_theaters
	where id=@id
	if(@on_discs is not null)
	update [movie] set [on_discs] = @on_discs
	where id=@id
	if(@rating is not null)
	update [movie] set [rating] = @rating
	where id=@id
	if(@title is not null 
	or @original_title is not null 
	or @status is not null
	or @original_language is not null
	or @runtime is not null
	or @budget is not null
	or @revenue is not null
	or @description is not null
	or @in_theaters is not null
	or @on_discs is not null
	or @rating is not null)
	update [user] set [updated_at] = GETDATE()
	end
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_update_profile]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--/****** Object:  StoredProcedure [dbo].[mov_add_address]    Script Date: 06.03.2020 22:13:53 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--ALTER
create PROCEDURE [dbo].[mov_update_profile]
	@profile_id int,
	@name nvarchar(20) = null,
	@last_name nvarchar(20) = null,
	@birthday date = null,
	@gender nvarchar(10) = null,
	@phone nvarchar(20) = null,
	@patronymic_name nvarchar(20) = null
AS
BEGIN
	if(not exists(select id from [profile] where id = @profile_id))
	print 'Profile with specified id does not exist.'
	else
	if(@name is null and @last_name is null
	and @patronymic_name is null and @birthday is null
	and @gender is null and @phone is null)
	print 'At least one value must be not null.'
	else
	begin
	if(@name is not null)
	update [profile] set [name] = @name
	where id=@profile_id
	if(@last_name is not null)
	update [profile] set last_name = @last_name
	where id=@profile_id
	if(@patronymic_name is not null)
	update [profile] set patronymic_name = @patronymic_name
	where id=@profile_id
	if(@birthday is not null)
	update [profile] set birthday = @birthday
	where id=@profile_id
	if(@gender is not null)
	update [profile] set gender = @gender
	where id=@profile_id
	if(@phone is not null)
	update [profile] set phone = @phone
	where id=@profile_id
	end

END;
GO
/****** Object:  StoredProcedure [dbo].[mov_update_user]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_update_user]
	@id int,
	@login nvarchar(20) = NULL,
	@password nvarchar(30) = NULL,
	@email nvarchar(320) = NULL
AS
BEGIN
	if(@id is null or @id<1)  
	print 'id value must not be null or negative.'
	else
	if(not exists(select id from [user] where id = @id))
	print 'User with specified id does not exist.'
	else 
	begin
	if(@login is not null)
	update [user] set [login] = @login 
	where id=@id
	if(@password is not null)
	update [user] set [password] = @password
	where id=@id
	if(exists(select email from [user] where email = @email))
	print 'The email is already used.'
	else 
	if(@email is not null)
	update [user] set [email] = @email
	where id=@id
	if(@login is not null 
	or @password is not null 
	or @email is not null)
	update [user] set [updated_at] = GETDATE()
	end
END;
GO
/****** Object:  StoredProcedure [dbo].[mov_update_user_role]    Script Date: 09.03.2020 23:59:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mov_update_user_role]
	@id int,
	@role nvarchar(10)
AS
BEGIN
	if(@id is null or @id<1)  
	print 'id value must not be null or less than 1.'
	else
	if(not exists(select id from [user] where id = @id))
	print 'User with specified id does not exist.'
	else 
	begin
	if(@role != 'user' 
	and @role !='admin' 
	and @role != 'moderator')
	print 'Role name is incorrect.'
	else
	if((select [role] from [user] where id=@id) = 'reviewer')
	print 'Can not change reviewer''s role.'
	else
	if(@role is not null)
	update [user] set [role] = @role, 
	[updated_at] = GETDATE()
	where id=@id
	end
END;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "address"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 281
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'mov_adress_info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'mov_adress_info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "movie"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 310
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "genre"
            Begin Extent = 
               Top = 6
               Left = 259
               Bottom = 102
               Right = 429
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'mov_movie_info_full'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'mov_movie_info_full'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "movie"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 309
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "genre"
            Begin Extent = 
               Top = 6
               Left = 259
               Bottom = 102
               Right = 429
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'mov_movie_info_short'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'mov_movie_info_short'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "user"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 283
               Right = 400
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'mov_user_info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'mov_user_info'
GO
