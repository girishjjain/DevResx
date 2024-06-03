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
* Install playwright
  * `npm init playwright@latest`
  * `npx playwright test`

