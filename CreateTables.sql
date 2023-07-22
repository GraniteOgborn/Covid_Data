USE [PortfolioCovid]
GO

--delete current file
DROP TABLE IF EXISTS [dbo].[CovidDeaths$]
GO

--create table and format field types
CREATE TABLE [dbo].[CovidDeaths$](
	[iso_code] [nvarchar](255) NULL,
	[continent] [nvarchar](255) NULL,
	[location] [nvarchar](255) NULL,
	[date] [date] NULL,
	[population] [float] NULL,
	[total_cases] [float] NULL,
	[new_cases] [float] NULL,
	[new_cases_smoothed] [float] NULL,
	[total_deaths] [float] NULL,
	[new_deaths] [float] NULL,
	[new_deaths_smoothed] [float] NULL,
	[total_cases_per_million] [float] NULL,
	[new_cases_per_million] [float] NULL,
	[new_cases_smoothed_per_million] [float] NULL,
	[total_deaths_per_million] [float] NULL,
	[new_deaths_per_million] [float] NULL,
	[new_deaths_smoothed_per_million] [float] NULL,
	[reproduction_rate] [float] NULL,
	[icu_patients] [float] NULL,
	[icu_patients_per_million] [float] NULL,
	[hosp_patients] [float] NULL,
	[hosp_patients_per_million] [float] NULL,
	[weekly_icu_admissions] [float] NULL,
	[weekly_icu_admissions_per_million] [float] NULL,
	[weekly_hosp_admissions] [float] NULL,
	[weekly_hosp_admissions_per_million] [float] NULL
)
GO

--insert data
BULK INSERT dbo.CovidDeaths$
FROM 'C:\Users\gmand\Downloads\CovidDeaths.csv'
WITH
	(
	FORMAT='CSV',
	FIRSTROW=2
	)
GO

--delete current file
DROP TABLE IF EXISTS [dbo].[CovidVaccinations$]
GO

--create table and format field types
CREATE TABLE [dbo].[CovidVaccinations$](
	[iso_code] [nvarchar](255) NULL,
	[continent] [nvarchar](255) NULL,
	[location] [nvarchar](255) NULL,
	[date] [date] NULL,
	[total_tests] [float] NULL,
	[new_tests] [float] NULL,
	[total_tests_per_thousand] [float] NULL,
	[new_tests_per_thousand] [float] NULL,
	[new_tests_smoothed] [float] NULL,
	[new_tests_smoothed_per_thousand] [float] NULL,
	[positive_rate] [float] NULL,
	[tests_per_case] [float] NULL,
	[tests_units] [nvarchar](255) NULL,
	[total_vaccinations] [float] NULL,
	[people_vaccinated] [float] NULL,
	[people_fully_vaccinated] [float] NULL,
	[total_boosters] [float] NULL,
	[new_vaccinations] [float] NULL,
	[new_vaccinations_smoothed] [float] NULL,
	[total_vaccinations_per_hundred] [float] NULL,
	[people_vaccinated_per_hundred] [float] NULL,
	[people_fully_vaccinated_per_hundred] [float] NULL,
	[total_boosters_per_hundred] [float] NULL,
	[new_vaccinations_smoothed_per_million] [float] NULL,
	[new_people_vaccinated_smoothed] [float] NULL,
	[new_people_vaccinated_smoothed_per_hundred] [float] NULL,
	[stringency_index] [float] NULL,
	[population_density] [float] NULL,
	[median_age] [float] NULL,
	[aged_65_older] [float] NULL,
	[aged_70_older] [float] NULL,
	[gdp_per_capita] [float] NULL,
	[extreme_poverty] [float] NULL,
	[cardiovasc_death_rate] [float] NULL,
	[diabetes_prevalence] [float] NULL,
	[female_smokers] [float] NULL,
	[male_smokers] [float] NULL,
	[handwashing_facilities] [float] NULL,
	[hospital_beds_per_thousand] [float] NULL,
	[life_expectancy] [float] NULL,
	[human_development_index] [float] NULL,
	[excess_mortality_cumulative_absolute] [float] NULL,
	[excess_mortality_cumulative] [float] NULL,
	[excess_mortality] [float] NULL,
	[excess_mortality_cumulative_per_million] [float] NULL
)
GO

--insert data
BULK INSERT dbo.CovidVaccinations$
FROM 'C:\Users\gmand\Downloads\CovidVaccinations.csv'
WITH
	(
	FORMAT='CSV',
	FIRSTROW=2
	)
GO

