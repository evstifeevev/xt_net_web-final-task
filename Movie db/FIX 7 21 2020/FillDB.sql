USE [movie_poster]
GO
[dbo].[mov_add_movie] @title = 'Night movie'
GO
[dbo].[mov_add_movie] @title = 'Summer movie'
GO
[dbo].[mov_add_movie] @title = 'Russian movie'
GO
[dbo].[mov_add_movie] @title = 'Military movie'
GO
[dbo].[mov_add_movie] @title = 'Big movie'
GO
[dbo].[mov_add_movie] @title = 'Red movie'
GO
[dbo].[mov_add_admin] @login = 'admin',	
	@password = 'password',
	@email = 'email@gmail.com'
GO
[dbo].[mov_add_genre] @title = 'triller'
GO
[dbo].[mov_add_genre] @title = 'action'
GO
[dbo].[mov_add_profile]	@user_id = 1, @name = 'name',
	@last_name = 'Last name',
	@birthday = '07-07-2020',
	@gender = 'M',
	@phone = '7 9999999999',
	@patronymic_name  = null
GO
[dbo].[mov_add_address]	@user_id = 1,
	@country = 'Russian Federation',
	@city = 'Saratov',
	@postcode = '410000',
	@state = 'Saratovskaya Oblast',
	@street_name = 'Street name',
	@street_number = '1'