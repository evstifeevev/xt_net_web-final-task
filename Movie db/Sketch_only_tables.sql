USE [movie_poster]
GO
/****** Object:  Table [dbo].[adress]    Script Date: 28.02.2020 1:43:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adress](
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
/****** Object:  Table [dbo].[crew_member]    Script Date: 28.02.2020 1:43:44 ******/
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
/****** Object:  Table [dbo].[feature]    Script Date: 28.02.2020 1:43:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feature](
	[id] [int] NOT NULL,
	[title] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_feature] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genre]    Script Date: 28.02.2020 1:43:44 ******/
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
/****** Object:  Table [dbo].[movie]    Script Date: 28.02.2020 1:43:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movie](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](200) NOT NULL,
	[original_title] [nvarchar](200) NULL,
	[status] [nvarchar](20) NOT NULL,
	[original_language] [nvarchar](50) NULL,
	[runtime] [time](0) NULL,
	[budget] [decimal](19, 4) NULL,
	[revenue] [decimal](19, 4) NULL,
	[description] [nvarchar](500) NULL,
	[created_at] [datetime] NOT NULL,
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
/****** Object:  Table [dbo].[movie_crew_member]    Script Date: 28.02.2020 1:43:44 ******/
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
/****** Object:  Table [dbo].[movie_genre]    Script Date: 28.02.2020 1:43:44 ******/
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
/****** Object:  Table [dbo].[movie_review]    Script Date: 28.02.2020 1:43:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movie_review](
	[movie_id] [int] NOT NULL,
	[review_id] [int] NOT NULL,
	[avrg_mark] [int] NULL,
 CONSTRAINT [PK_movie_review] PRIMARY KEY CLUSTERED 
(
	[movie_id] ASC,
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profile]    Script Date: 28.02.2020 1:43:44 ******/
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
/****** Object:  Table [dbo].[review]    Script Date: 28.02.2020 1:43:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[review](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[text] [nvarchar](1000) NOT NULL,
	[reviewer_id] [int] NOT NULL,
	[mark] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_review] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reviewer]    Script Date: 28.02.2020 1:43:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reviewer](
	[id] [int] NOT NULL,
	[user_id] [int] NULL,
	[nickname] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_reviewer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 28.02.2020 1:43:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](20) NULL,
	[password] [nvarchar](30) NULL,
	[email] [nvarchar](320) NOT NULL,
	[adress_id] [int] NULL,
	[profile_id] [int] NULL,
	[status] [nvarchar](10) NOT NULL,
	[role] [nvarchar](10) NOT NULL,
	[password_reset_token] [nvarchar](320) NULL,
	[accout_activasion_status] [nvarchar](20) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
ALTER TABLE [dbo].[movie_review]  WITH CHECK ADD  CONSTRAINT [FK_movie_review_movie] FOREIGN KEY([movie_id])
REFERENCES [dbo].[movie] ([id])
GO
ALTER TABLE [dbo].[movie_review] CHECK CONSTRAINT [FK_movie_review_movie]
GO
ALTER TABLE [dbo].[movie_review]  WITH CHECK ADD  CONSTRAINT [FK_movie_review_review] FOREIGN KEY([movie_id])
REFERENCES [dbo].[review] ([id])
GO
ALTER TABLE [dbo].[movie_review] CHECK CONSTRAINT [FK_movie_review_review]
GO
ALTER TABLE [dbo].[reviewer]  WITH CHECK ADD  CONSTRAINT [FK_reviewer_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[reviewer] CHECK CONSTRAINT [FK_reviewer_user]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_adress] FOREIGN KEY([adress_id])
REFERENCES [dbo].[adress] ([id])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_adress]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_profile] FOREIGN KEY([profile_id])
REFERENCES [dbo].[profile] ([id])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_profile]
GO
