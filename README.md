# Inception
> Summary	: 	This document is a System Administration related exercise.
+ 요약 : 이 문서는 시스템 관리에 관한 실습입니다.
---
## Contents
1.	Preamble
1.	Instroduction
1.	General guidelines
1.	Mandatory part
1.	Bonus Part
1.	Submission and peer-evalution
---

### Chapter 1
#### Preamble
![inception](https://user-images.githubusercontent.com/59547427/118120206-7a650900-b42a-11eb-8b24-58d619a53a60.png)

---
### Chapter 2
#### Instroduction

> This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine.

+ 이번 프로젝트 목표는 **도커**를 사용해 시스템을 관리하는 부분의 지식을 넓히는 것입니다.
+ 우리는 여러 도커 이미지를 가상화하고, 이를 개인의 가상 머신에서 작동시킬 것입니다.
---
### Chapter 3
#### General guidelines

> + All the files required for the configuration of your project must be placed in a srcs folder.
+	프로젝트를 구성하는데 필요한 모든 파일들은 **srcs** 폴더에 저장해야 합니다.
> + A Makefile is also required and must be located at the root of your directory. It must set up your entire application (i.e., it has to build the Docker images using docker-compose).
+	**Makefile**은 프로젝트 루트 디렉토리에 존재해야하고, 모든 어플리케이션에 대한 설정을 진행해야합니다.
(즉, **Docker-Compose**로 도커 이미지를 빌드해야합니다.) 

> + This subject requires putting into practice concepts that, depending on your background, you may not have learned yet. Therefore, we advise you not to hesitate to read a lot of documentation related to Docker usage, as well as anything else you will find helpful in order to complete this assignment.

+	이번 프로젝트를 완성하기 위해서는 개인의 배경에 따라 아직 배우지 못한 새로운 개념을 배워야 합니다. 따라서 도커 사용법과 관련된 다양한 자료들을 찾고 익히는데 주저함이 없어야 합니다.
---
### Chapter 4
#### Mandatory part
>This project consists in having you set up a small infrastructure composed of different services under specific rules. The whole project has to be done in a virtual machine. You have to use docker-compose.

+	이 프로젝트는 특정한 규칙에 따라 서로 다른 서비스로 구성된 소규모 인프라를 구축하는 과제입니다. 프로젝트의 모든 과정은 가상 머신에서 수행되야 하고, **docker-compose**를 사용해야 합니다.

> Each Docker image must have the same name as its corresponding service.
+	각 도커 이미지의 이름은 해당하는 서비스 명과 동일해야 합니다.
> Each service has to run in a dedicated container.
+	각 서비스는 전용 컨테이너 내에서 작동해야 합니다.	
>For performance matters, the containers must be built either from the penultimate stable version of Alpine Linux, or from Debian Buster. The choice is yours.
+	성능 문제를 위해, 컨테이너는 **stable version**의 **Alpine Linux** 혹은 **deban:buster** OS에서 작동해야합니다.

>You also have to write your own Dockerfiles, one per service. The Dockerfiles must be called in your docker-compose.yaml by your Makefile.
+	또한 각 서비스당 고유한 **Dockerfile**을 작성해야 합니다ㅇ 이 때 도커파일은 `Makefile`로 작성된 `docker-compse.yaml`로 부터 호출되어야 합니다.

> It means you have to build yourself the Docker images of your project. It is then forbidden to pull ready-made Docker images, as well as using services such as DockerHub(Alpine/Debian being excluded from this rule).

+	즉, 프로젝트에 필요한 도커 이미지를 우리 스스로 만들어야합니다. 도커허브와 같은 서비스를 이용해 사전에 완성된 도커 이미지를 받는 것은 엄격하게 금지됩니다.(Alpine Linux / Debian Buster 제외)

>
>You then have to set up:
>
>	• A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
	• A Docker container that contains WordPress + php-fpm (it must be installed and configured).
	• A Docker container that contains MariaDB.
	• A volume that contains your WordPress database.
	• A second volume that contains your WordPress website files.
	• A docker-network that establishes the connection between your containers.
>
>
> Your containers have to restart in case of a crash.