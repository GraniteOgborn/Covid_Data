--Join the two tables, view new vaccinations and rolling total of vaccinations per day, grouped by location.  Create a CTE to calculate the percent of each location's population vaccinated.
WITH VaccinationRatio (Continent, Location, Date, Population, "New Vaccinations", "Total Vaccinations")
AS
(
SELECT 
	dea.continent,
	dea.location, 
	dea.date, 
	dea.population, 
	vac.new_vaccinations, 
	SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date)
FROM PortfolioCovid.dbo.CovidDeaths$ dea
JOIN PortfolioCovid.dbo.CovidVaccinations$ vac
	ON dea.location = vac.location
	AND dea.date = vac.date
)
SELECT *, ([Total Vaccinations]/Population)*100 AS 'Percent of Population Vaccinated'
FROM VaccinationRatio
GO

--Same output, instead using a temp table.
DROP TABLE IF EXISTS #VaccinationRatio
CREATE TABLE #VaccinationRatio
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
[New Vaccinations] numeric,
[Total Vaccinations] numeric
)
GO

INSERT INTO #VaccinationRatio
SELECT 
	dea.continent AS 'Continent',
	dea.location AS 'Location', 
	dea.date AS 'Date', 
	dea.population AS 'Population', 
	vac.new_vaccinations AS 'New Vaccinations', 
	SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS 'Total Vaccinations'
FROM PortfolioCovid.dbo.CovidDeaths$ dea
JOIN PortfolioCovid.dbo.CovidVaccinations$ vac
	ON dea.location = vac.location
	AND dea.date = vac.date
ORDER BY dea.location, dea.date
GO

SELECT *
FROM #VaccinationRatio
GO

--Making a view
USE [PortfolioCovid]
GO

CREATE VIEW [Vaccination Ratio View] AS
SELECT 
	dea.continent AS 'Continent',
	dea.location AS 'Location', 
	dea.date AS 'Date', 
	dea.population AS 'Population', 
	vac.new_vaccinations AS 'New Vaccinations', 
	SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS 'Total Vaccinations'
FROM PortfolioCovid.dbo.CovidDeaths$ dea
JOIN PortfolioCovid.dbo.CovidVaccinations$ vac
	ON dea.location = vac.location
	AND dea.date = vac.date
GO