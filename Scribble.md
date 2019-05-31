## Scribble

### Docker
| Command | Description |
| --- | --- |
| `docker images` | List available images |
| `docker pull <url>` | Pull image from a repository. You may need to login using `docker login <repo_url>` before you pull an image |
| `docker ps` | List of running docker containers |
| `docker --version` | Display docker version |
| `docker version` | Display docker version and info |
| `docker info` | Display docker version and info |
| `docker run -it <image_id>` | Runs a container using given image and allocates a pseudo-TTY connected to container's STDIN; creating an interactive bash shell in the container |
| `docker exec -it <container name> /bin/bash` | SSH into a running docker container (get container name by executing `docker ps`) |


### NodeJS on Debian
* To uninstall currently installed version of NodeJS: `sudo apt-get remove nodejs`
* Refer following page to install NodeJS: https://github.com/nodesource/distributions#debinstall
    * Remeber to execute commands referenced in above link as root (or prefix commands with sudo)

### Postgres
* To start Postgres DB Server - `postgres -D /usr/local/var/postgres`
* Use below script to setup a local DB and user login
```
    CREATE ROLE heimdalluser WITH LOGIN;
    ALTER ROLE heimdalluser WITH PASSWORD 'password';
    ALTER ROLE heimdalluser WITH SUPERUSER CREATEROLE CREATEDB;
    CREATE DATABASE heimdall;
    GRANT ALL PRIVILEGES ON DATABASE heimdall TO heimdalluser;
```
* To connect to Postgres DB using terminal - `psql -h <host_name> -U <user_name> -d <db_name> -W`, for e.g. `psql -h localhost -U heimdalluser -d heimdall -W`


### Python
* Statement grouping is done by indentation instead of beginning and ending brackets
* No variable or argument declarations are necessary


#### OAuth 2.0
* Grant Types
  * Client Credentials Grant
    * Direct Access by the **client** application
    * Access token obtained using client credentials
  * Authorization Code Grant (Most secured)
    * Delegated access to a **backend** application
    * Access token obtained by exchanging code with client credentials
    * Refresh token can be used with client credentials
  * Implicit Grant
    * Delegeated access to a **frontend** application
    * Access token directly obtained through the redirect
    * Not supposed to have access to refresh tokens
* Token 
  * Reference Token or self ontained token


#### OpenID Connect
* Identity layer that sits on top of OAuth 2.0
* Relying Party (RP) is an OAuth 2.0 client that relies on Identity Provider to authenticate user and request claims about that user
* Identity Provider (IdP) is OAuth 2.0 authorization server which offers authentication as a service
* Identity Token contains number of claims (or attributes) about identity of Resource Owner (end user). For example, 
  * Subject - A unique identifier issued to user by IdP
  * Audience - Identifies relying party
* Scopes are used to request specific sets of information, that's made available as claim values, OIDC defines standard scopes. For example, 
  * openid - mandatory scope, identifies request as OpenId Connect request
  * profile - requests access to end user's default profile claims
  * email
  * address
  * phone
* OIDC Endpoints
  * Authorization 
  * Token
  * User Info
* Use cases
  * OAuth (for Authorization)
    * Delegated Authorization (Granting access to your API - user's permission to external system to allow access through API) 
  * OpenId Connect (for Authentication)
    * Logging the user in (Simple Login/SSO)
    * Making your accounts available in other systems
* Tokens
  * Access Token - Opaque to RP (client), to be understood by Resource Server
  * ID Token - Encodes user info, intended to be understood by RP (client)
  * OpenId Connect Grant Types
    * Implicit 
      * Intended for **frontend** application only
      * Allows establishing user's identity
    * Authorization Code
      * Intended for **backend** application
      * Allows connecting identity of the user to an internal user concept
    * Hybrid
      * Identity token is intended for backend application
      * Allows connecting identity of the user to an internal user concept
      * Backend must check if the audience of the token matches its client Id
