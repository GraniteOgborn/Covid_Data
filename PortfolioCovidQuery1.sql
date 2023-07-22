--View all fields, first 100 rows
SELECT TOP 100 *
FROM PortfolioCovid.dbo.CovidDeaths$
ORDER BY location, date
GO

--View incidence of infection, deaths, etc and rates by date for specified country (United States)
SELECT 
	location AS 'Location', 
	population AS 'Population', 
	date AS 'Date', 
	total_cases AS 'Total Cases', 
	total_deaths AS 'Total Deaths', 
	(total_deaths/total_cases)*100 AS 'Death Rate', 
	(total_cases/population)*100 AS 'Infection Rate'
FROM PortfolioCovid.dbo.CovidDeaths$
WHERE location = 'United States'
ORDER BY location, date
GO

--View summary information for each country
SELECT 
	location AS 'Location', 
	population AS 'Population', 
	MAX(total_cases) AS 'Infection Count', 
	MAX(total_cases/population)*100 AS 'Highest Infection Rate', 
	MAX(total_deaths) AS 'Death Count', 
	MAX(total_deaths/total_cases)*100 AS 'Highest Death Rate'
FROM PortfolioCovid.dbo.CovidDeaths$
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY [Death Count] DESC
GO

--View summary information by continent.  
--Note that European Union and Europe are included so totals don't add up.
SELECT 
	location AS 'Continent', 
	population AS 'Population', 
	MAX(total_cases) AS 'Infection Count', 
	MAX(total_cases/population)*100 AS 'Highest Infection Rate', 
	MAX(total_deaths) AS 'Death Count', 
	MAX(total_deaths/total_cases)*100 AS 'Highest Death Rate'
FROM PortfolioCovid.dbo.CovidDeaths$
WHERE continent IS NULL AND location NOT IN ('High income', 'Upper middle income', 'Lower middle income', 'Low income')
GROUP BY location, population
ORDER BY [Death Count] DESC
GO

--View summary information by income bracket
SELECT 
	location AS 'Income Bracket', 
	population AS 'Population', 
	MAX(total_cases) AS 'Infection Count', 
	MAX(total_cases/population)*100 AS 'Highest Infection Rate', 
	MAX(total_deaths) AS 'Death Count', 
	MAX(total_deaths/total_cases)*100 AS 'Highest Death Rate'
FROM PortfolioCovid.dbo.CovidDeaths$
WHERE location IN ('High income', 'Upper middle income', 'Lower middle income', 'Low income')
GROUP BY location, population
ORDER BY [Death Count] DESC
GO
