@echo off
REM ======================================================
REM  Initialize folder structure for AI Agent Starter Kit
REM  Run from root: ai-agent-starter-kit>
REM ======================================================

echo [SRC] Creating src structure...

mkdir src
mkdir src\Agents
mkdir src\Services
mkdir src\Plugins
mkdir src\API
mkdir src\Domain
mkdir src\Infrastructure

REM Optional subfolders for better organization
mkdir src\Agents\Base
mkdir src\Agents\Samples
mkdir src\Services\OpenAI
mkdir src\Services\Memory
mkdir src\Services\Files
mkdir src\Plugins\Database
mkdir src\Plugins\Http
mkdir src\Plugins\Email
mkdir src\Infrastructure\Logging
mkdir src\Infrastructure\Config
mkdir src\Infrastructure\Extensions

echo [TESTS] Creating tests structure...

mkdir tests
mkdir tests\AgentTests

echo [DOCS] Creating docs structure...

mkdir docs
mkdir docs\architecture
mkdir docs\prompts
mkdir docs\api

echo [GITHUB] Creating GitHub workflows folder...

mkdir .github
mkdir .github\workflows

echo [SCRIPTS] Ensuring scripts folder exists...

mkdir scripts

echo [ROOT] Creating root files if missing...

IF NOT EXIST docker-compose.yml (
    echo # Docker Compose for AI Agent Starter Kit>docker-compose.yml
)

IF NOT EXIST README.md (
    echo # AI Agent Starter Kit>README.md
)

echo [GITKEEP] Adding .gitkeep files so folders are visible on GitHub...

for /r src %%f in (.) do (
    if not exist "%%f\.gitkeep" (
        echo.> "%%f\.gitkeep"
    )
)

for /r tests %%f in (.) do (
    if not exist "%%f\.gitkeep" (
        echo.> "%%f\.gitkeep"
    )
)

for /r docs %%f in (.) do (
    if not exist "%%f\.gitkeep" (
        echo.> "%%f\.gitkeep"
    )
)

if not exist ".github\.gitkeep" echo.> ".github\.gitkeep"
if not exist ".github\workflows\.gitkeep" echo.> ".github\workflows\.gitkeep"

echo.
echo Done. Folder structure for AI Agent Starter Kit has been created and .gitkeep files added.
echo.
pause
