---

### SUMMARY

- GO 👇
    1. 프로젝트 구현에 필요한 모든 파일은 `srcs` 폴더에 제출
    2. 클러스터 환경에 적합하게 작성 
    3. `docker-compose` 를 실행하는 `Makefile` 작성
    4. `docker-compose.yml` 으로 각 컨테이너 빌드
    5. 각 서비스 도커 이미지는 해당 서비스명과 일치해야함
    6. stable version `Alpine Linux` or `Debain:buster` 사용
    7. 각 서비스를 위한 `dockerfile` 작성 → `docker-compose.yml` 에서 호출
    8. `DockerHub`에서 기작성된 이미지 다운로드 금지
    9. 기본 파트
        1. `TLSv1.2` or `TLSv1.3` 프로토콜 `NGINX` 컨테이너 작성
        2. `워드프레스` + `php-fpm` 컨테이너 작성
        3. `MariaDB` 컨테이너 작성
        4. 워드프레스 데이터베이스 볼륨 
        5. 워드프레스 사이트 파일 볼륨
        6. 각 서비스 연결하는 도커 네트워크
    10. `tail -f` , `host` , `—link` 사용금지
    11. 워드프레스 데이터베이스 `유저` → 2명 생성
    12. 유저 1명은 관리자 → `admin`, `adminstrator`등의 단어 포함 금지
    13. `(intraID).42.fr` 도메인 사용 → 해당 도메인은 로컬 ip 리다이렉션
    14. 보너스 파트
        1. 캐쉬 관리 → `redis cache`
        2. 워드프레스 사이트 볼륨을 가리키는 `FTP 서버 컨테이너` 작성
        3. `PHP`를 제외한 언어로 웹사이트 작성
        4. `adminer` 설정
        5. 이외 추가적인 서비스 작성

---

# Inception

> Summary: This document is a System Administration related exercise.

- 요약 : 이 문서는 시스템 관리에 관한 실습입니다.

---

## Contents

1. Preamble
2. Instroduction
3. General guidelines
4. Mandatory part
5. Bonus Part
6. Submission and peer-evalution

---

### Chapter 1

### Preamble

![https://user-images.githubusercontent.com/59547427/118120206-7a650900-b42a-11eb-8b24-58d619a53a60.png](https://user-images.githubusercontent.com/59547427/118120206-7a650900-b42a-11eb-8b24-58d619a53a60.png)

---

### Chapter 2

### Instroduction

> This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine.

- 이번 프로젝트 목표는 **도커**를 사용해 시스템을 관리하는 부분의 지식을 넓히는 것입니다.
- 우리는 여러 도커 이미지를 가상화하고, 이를 개인의 가상 머신에서 작동시킬 것입니다.

---

### Chapter 3

### General guidelines

> All the files required for the configuration of your project must be placed in a srcs folder.

- 프로젝트를 구성하는데 필요한 모든 파일들은 **srcs** 폴더에 저장해야 합니다.

> A Makefile is also required and must be located at the root of your directory. It must set up your entire application (i.e., it has to build the Docker images using docker-compose).

- **Makefile**은 프로젝트 루트 디렉토리에 존재해야하고, 모든 어플리케이션에 대한 설정을 진행해야합니다.
(즉, **Docker-Compose**로 도커 이미지를 빌드해야합니다.)

> This subject requires putting into practice concepts that, depending on your background, you may not have learned yet. Therefore, we advise you not to hesitate to read a lot of documentation related to Docker usage, as well as anything else you will find helpful in order to complete this assignment.

- 이번 프로젝트를 완성하기 위해서는 개인에 따라 아직 배우지 못한 새로운 개념을 배워야 합니다. 따라서 도커 사용법과 관련된 다양한 자료들을 찾고 익히는데 주저함이 없어야 합니다.

---

### Chapter 4

### Mandatory part

> This project consists in having you set up a small infrastructure composed of different services under specific rules. The whole project has to be done in a virtual machine. You have to use docker-compose.

- 이 프로젝트는 특정한 규칙에 따라 서로 다른 서비스로 구성된 소규모 인프라를 구축하는 과제입니다. 프로젝트의 모든 과정은 가상 머신에서 수행되야 하고, **docker-compose**를 사용해야 합니다.

> Each Docker image must have the same name as its corresponding service.

- 각 도커 이미지의 이름은 해당하는 서비스 명과 동일해야 합니다.

> Each service has to run in a dedicated container.

- 각 서비스는 전용 컨테이너 내에서 작동해야 합니다.

> For performance matters, the containers must be built either from the penultimate stable version of Alpine Linux, or from Debian Buster. The choice is yours.

- 성능 문제를 위해, 컨테이너는 **stable version**의 **Alpine Linux** 혹은 **deban:buster** OS에서 작동해야합니다.

> You also have to write your own Dockerfiles, one per service. The Dockerfiles must be called in your docker-compose.yaml by your Makefile.

- 또한 각 서비스당 고유한 **Dockerfile**을 작성해야 합니다. 이 때 도커파일은 `Makefile`을 통해 `docker-compse.yml`로 부터 호출되어야 합니다.

> It means you have to build yourself the Docker images of your project. It is then forbidden to pull ready-made Docker images, as well as using services such as DockerHub(Alpine/Debian being excluded from this rule).

- 즉, 프로젝트에 필요한 도커 이미지를 우리 스스로 만들어야합니다. 도커허브와 같은 서비스를 이용해 사전에 완성된 도커 이미지를 받는 것은 엄격하게 금지됩니다.(Alpine Linux / Debian Buster 제외)

> You then have to set up:

- 프로젝트를 완성하기 위해 아래의 요소들이 필요합니다.

> • A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
• A Docker container that contains WordPress + php-fpm (it must be installed and configured).
• A Docker container that contains MariaDB.
• A volume that contains your WordPress database.
• A second volume that contains your WordPress website files.
• A docker-network that establishes the connection between your containers.

- TLSv1.2 혹은 TLSv1.3 프로토콜이 적용된 NGINX 컨테이너
- 워드프레스 + php-fpm 컨테이너
- MariaDB 데이터베이스 컨테이너
- 워드프레스 데이터베이스 볼륨
- 워드프레스 웹사이트 파일 볼륨
- 컨테이너를 연결해주는 도커 네트워크 설정

> Your containers have to restart in case of a crash.

- 충돌 발생시 컨테이너는 재시작 되어야 합니다.

- INFORMATION ❗

    > A Docker container is not a virtual machine. Thus, it is not recommended to use any hacky patch based on ’tail -f’ and so forth when trying to run it. Read about how daemons work and whether it's a good idea to use them or not.

    도커 컨테이너는 가상 머신이 아닙니다.  따라서 컨테이너를 구동할 때 `tail-f` 등과 같은 진부 명렁을 사용하는 것은 추천하지 않습니다. 

    도커 데몬이 어떻게 작동하는지 알아보고, 데몬을 사용하는 것이 좋은지 아닌지 읽어보시기 바랍니다.

- CAUTION ‼️

    > Of course, using network: host or --link is forbidden.

    `network: host` , `--link` 같은 명령을 사용 할 수 없습니다.

> In your WordPress database, there must be two users, one of them being the ad- ministrator. The administrator’s username can’t contain admin/Admin or admin- istrator/Administrator (e.g., admin, administrator, Administrator, admin-123, and so forth).

- 워드프레스 데이터베이스에는 두 명의 유저가 있어야합니다. 이 중 한명은 **관리자**입니다. 관리자의 **Username**에는 **admin/Admin** 혹은 **administrator/Adminstrator**와 같은 내용이 포함 될 수 없습니다. (예 : admin, adminstrator, Adminstrator, admin123 등)

- INFORMATION ❗️
    > Your volumes will be available in the /home/login/data folder of the host machine using Docker. Of course, you have to replace the login with yours.
    +   볼륨들은 도커를 사용해 호스트 시스템의 `/home/login/data` 폴더에서 사용하능합니다. 물론 `login` 은 우리의 아이디로 대체됩니다. `(/home/intraID/data)`

> To make things simpler, you have to configure your domain name so it points to your local IP address. This domain name must be [login.42.fr](http://login.42.fr/). Again, you have to use your own login. For example, if your login is wil, [wil.42.fr](http://wil.42.fr/) will redirect to the IP address pointing to wil’s website.

- 쉽게 설명해, 우리는 도메인 이름이 로컬 IP를 리다이렉션 하도록 구성해야합니다. 이 때 도메인 이름은 `[login.42.fr](http://login.42.fr)` 이어야 합니다. 예를 들어 로그인 ID가 `wil`인 경우 `[wil.42.fr](http://wil.42.fr)` 이 해당 웹사이트의 IP 주소로 리다이렉션 되어야 합니다.

- CAUTION ‼️
    > The latest tag is prohibited.
No password must be present in your Dockerfile.
It is mandatory to use environment variables.
Also, it is strongly recommended to use a `.env`file to store environment variables.
The .env file should be located at the root of the srcs directory.
Your NGINX container must be the only entrypoint into your
infrastrucYour NGINX container must be the only entrypoint into your infrastructure via the port 443 only, using the TLSv1.2 or TLSv1.3 protocol.
    +   최신 태그는 금지됩니다.
    +   도커파일에는 암호가 없어야합니다.
    +   환경 변수를 사용해야합니다.
    +   이 환경 변수들은 `.env` 파일을 사용해 저장하는 것이 좋습니다.
    +   `.env` 파일은 루트 디렉토리의 srcs폴더에 만들어야합니다.
    +   NGINX 컨테이너는 TLSv1.2 또는 TLSv1.3 프로토콜을 사용하는 443 포트를 통해서만 우리가 만든 인트라로 진입할 수 있습니다.

> Here is an example diagram of the expected result

- 이 프로젝트는 아래 다이어그램처럼 구성 될 것입니다.

![https://user-images.githubusercontent.com/59547427/118393975-dfb03880-b67c-11eb-8b93-ae1770ae1541.png](https://user-images.githubusercontent.com/59547427/118393975-dfb03880-b67c-11eb-8b93-ae1770ae1541.png)

> Below is an example of the expected directory structure

- 루트 디렉토리의 구성 예시는 아래와 같습니다.

![https://user-images.githubusercontent.com/59547427/118394066-66fdac00-b67d-11eb-9f26-3ff9ea6bb67d.png](https://user-images.githubusercontent.com/59547427/118394066-66fdac00-b67d-11eb-9f26-3ff9ea6bb67d.png)

---

### Chapter 5

### Bonus part

> For this projects, the bonus part is aimed to be simple.

- 이번 프로젝트의 보너스 파트는 단순화가 목표입니다.

> A Dockerfile must be written for each extra service. Thus, each one of them will run inside its own container and will have, if necessary, its dedicated volume.

- 각 서비스에 대해 도커파일을 작성해야합니다. 따라서 각 서비스는 자체 컨테이너 내부에서 실행되며, 필요한 경우 전용 볼륨을 갖습니다.

> Bonus list:

• Set up redis cache for your WordPress website in order to properly manage the cache.
• Set up a FTP server container pointing to the volume of your WordPress website.
• Create a simple static website in the language of your choice except PHP (Yes, PHP is excluded!). For example, a showcase site or a site for presenting your resume.
• Set up Adminer.
• Set up a service of your choice that you think is useful. During the defense, you will have to justify your choice.

- 캐시를 적절히 관리하기 위해 워드프레스 웹 사이트에 대한 `redis cache`를 설정합니다.
- 워드프레스 웹사이트 볼륨을 가리키는 FTP 서버 컨테이너를 설정합니다.
- PHP를 제외한 언어로 쇼케이스 혹은 이력 소개를 위한 간단한 정적 웹사이트를 작성합니다.
- adminer 를 설정합니다.
- 이 외에 유용하다고 생각되는 서비스를 설정합니다. 물론 동료 평가동안 이 서비스가 왜 필요한지 설명해야 할 것입니다.

- INFORMATION ❗️
    > To complete the bonus part, you have the possibility to set up extra services. In this case, you may open more ports to suit your needs.

    +   보너스 파트를 위한 추가적인 서비스를 설정할 수 있습니다. 이 경우 필요에 따라 추가적인 포트를 사용할 수 있습니다.


- CAUTION  ‼️
    > The bonus part will only be assessed if the mandatory part is PERFECT. Perfect means the mandatory part has been integrally done and works without malfunctioning. If you have not passed ALL the mandatory requirements, your bonus part will not be evaluated at all.

    +   보너스 파트는 필수 파트가 완벽하게 구현된 경우에만 평가받을 수 있습니다. 완벽하다는 의미는 필수 파트가 통합적으로 수행되고, 오작동이 없다는 것을 의미합니다. 필수 파트를 통과하지 못한 경우 보너스 파트는 평가되지 않습니다.


---
