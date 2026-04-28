### May 29, 2024
* Oracle VM VirtualBox is not officially supported on Apple Silicon chips i.e. M1/M2/M3, though it can be installed on Mac with Apple chips but it is not officially supported so you'd likely run into issues.
* Firefox now available for Linux ARM 64
  * https://blog.nightly.mozilla.org/2024/04/19/firefox-nightly-now-available-for-linux-on-arm64/
* Amazon Linux 2023 RPM packages
  * https://docs.aws.amazon.com/linux/al2023/release-notes/all-packages-AL2023.4.html
* `lscpu` command can be used on Linux to get details about the CPU architecture


### Steps to install browser on Amazon Linux 2023 MATE Cloud VM
* Apply latest updates to OS
  * `sudo yum update -y`
* Set password for the root user
  * `sudo passwd root`
* Download firefox
  * `wget -O- "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US" | tar -jx -C /usr/local/`
* Install node using nvm
  * `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash`
  * `nvm install lts/gallium` - This is node v16, couldn't install higher version due to dependencies issue
* Launch firefox browser
  * `/usr/local/firefox/firefox`

### Steps to setup Windows EC2 instance with Node
* Download nvm installer
  * `https://github.com/coreybutler/nvm-windows/releases`
* Install Node LTS version
  * `nvm install lts`
  * `nvm use lts`

### Playwright Setup
* Install playwright
  * To create a new project:
    * `npm init playwright@latest`
  * For existing project:
    * `npm install`
* Install Chromium browser for playwright
  * `npx playwright install chromium`
* Execute playwright tests using Chromium browser
  * `npx playwright test --project=chromium --headed`


### Jun 11, 2024
* cURL alternative for Windows is to use PowerShell and use
  * `Invoke-WebRequest -Uri https://google.com`
  * Refer for detailed documentation `https://www.pdq.com/powershell/invoke-webrequest/#`

### Jun 16, 2024
* You can create UML diagrams using [PlantUML](http://www.plantuml.com/plantuml)
* Basic example diagram definition:
  ```
  @startuml
  package authn.services {
    class IdentityService {
      identitySearch
    }
  }

  package authn.adapters {
    class IdentityAdapter {
      identitySearch
    }

    AdminUserAdapter o-- IdentityService
    CommonAdapter o-- IdentityService
    BaseUserAdapter o-- IdentityService
    IdentityService o-- IdentityAdapter
  }
  @enduml
  ```

### Jun 28, 2024
* To search for files 
  * `Get-Childitem -Recurse -Include *.config | Select ResolvedTarget`
* To search for files containing certain string using PowerShell:
  * `Get-ChildItem -Recurse | Select-String "dummy" -List | Select Path, LineNumber`

### Jul 8, 2024
#### Oracle DB
* List all tables
  * `select * from all_tables;`
* List all table columns
  * `select * from user_tab_cols;`

### Aug 15, 2024
#### dotnet CLI
* Create a new solution and a class library and unit test project to it using: `dotnet` CLI:
```bash
dotnet new sln -o poker
cd .\poker\
dotnet new classlib -o solution
dotnet new xunit -o tests
dotnet sln add .\solution\solution.csproj
dotnet sln add .\tests\tests.csproj
dotnet add .\tests\tests.csproj reference .\solution\solution.csproj
```
* Add FluentAssertions package dependency:
```bash
dotnet add package FluentAssertions
```
* Detailed logging for tests
```bash
dotnet watch test --logger:"console;verbosity=detailed"
```
* Check for code-coverage
```bash
.\build.ps1 UnitTestCoverage`
```
* Generate code-coverage report
```bash
dotnet $Env:UserProfile\.nuget\packages\reportgenerator\5.4.3\tools\net8.0\ReportGenerator.dll -reports:C:\repos\platform\sitar\code-coverage\Lyric.Platform.Sitar.Tests.xml -targetdir:coveragereport
```
  * The above command is for PowerShell and uses `$Env:UserProfile` to get current user profile directory, you can replace it with the actual path if you're using some other terminal
* dotnet isntallation info
```bash
  dotnet --info
```

### May 5, 2025
* Invoking Orcale stored procedure with `OUT` parameter values and printing the return values 
```sql
SET SERVEROUTPUT ON;
DECLARE
    v_out_value varchar2(50);
    v_out_inquiry varchar2(5000);
    v_out_response varchar2(5000);
    v_out_therefore varchar2(5000);
    v_out_source varchar2(5000);
    v_out_type varchar2(5000);
BEGIN
    CODEDESCRIPTION.GetClarificationProperties(
        in_client_name  => 'YOURCUSTOMERACRONYM',
        in_value => 'JUSTIFICATION_ID',
        out_value => v_out_value,
        out_inquiry => v_out_inquiry,
        out_response => v_out_response,
        out_therefore => v_out_therefore,
        out_source => v_out_source,
        out_type => v_out_type
    );

    DBMS_OUTPUT.PUT_LINE('OUT value is: ' || v_out_value);
    DBMS_OUTPUT.PUT_LINE('OUT inquiry is: ' || v_out_inquiry);
    DBMS_OUTPUT.PUT_LINE('OUT response is: ' || v_out_response);
    DBMS_OUTPUT.PUT_LINE('OUT therefore is: ' || v_out_therefore);
    DBMS_OUTPUT.PUT_LINE('OUT source is: ' || v_out_source);
    DBMS_OUTPUT.PUT_LINE('OUT type is: ' || v_out_type);
END;
/
```

### Apr 28, 2026
# Database Sharding in PostgreSQL

## What is sharding

* **Sharding** means splitting a large database into smaller pieces called **shards**.
* Each shard stores **only a subset of the total data**.
* This is a form of **horizontal partitioning**.

## Why sharding is used

* Improve scalability
* Reduce load on a single database server
* Support larger datasets and higher traffic
* Potentially improve read/write performance

## Common sharding strategies

* **Range-based sharding**
  Split data by ranges, such as user ID ranges
* **Hash-based sharding**
  Use a hash of a key to decide which shard stores a row
* **Geographic sharding**
  Split data by region, such as US vs EU customers

## Shard vs database instance

* Conceptually, a **shard is a portion of the dataset**
* Physically, a shard is **often** its own database instance or server
* But the core idea is the **data split**, not necessarily the exact infrastructure layout


## Does the DB consumer need to know which shard to use?

### In vanilla PostgreSQL

* **Yes, usually**
* PostgreSQL by itself does **not automatically route queries across multiple independent Postgres instances**

### Two common models

#### 1. Application-managed sharding

* The application decides which shard to use
* Example:

  * Compute shard from `user_id`
  * Send both reads and writes for that user to the same shard

#### 2. Middleware / extension-managed sharding

* A sharding layer routes queries on behalf of the application
* The app may connect to a single endpoint
* The router/coordinator decides which shard to access
