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
  * `npm init playwright@latest`
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
