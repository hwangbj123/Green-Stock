![로고2](https://github.com/seoyounglee0105/green_airline_project/assets/106488607/45885ada-932d-4640-93a8-4a84d451bb9c)




<br>

## 🚀 프로젝트 개요
- *모든 팀원이 풀스택으로 개발에 참여했으며, 주 포지션은 아래와 같습니다.*
<br>

|   Name   | 이승호 | 김지홍 | 김민환 | 양승리 | 황병준 |
| :------: | :----: | :----: | :----: | :----: | :---: |
| Position | 팀장 & 회원 & 결제 기능 | 주식정보  | 공지사항 | 포트폴리오 | 작성 |

- 프로젝트 기간 : 2023년 10월 23일 ~ 2023년 11월 13일
- 시연 영상 (유튜브) : 

<br> 

## 🎮 기술 스택

### ✨ Front-End

<details>
    <summary>⚡️ FE 자세히 살펴보기</summary>
    <br>
    <ul>
        <li>bootstrap : 5.2.3 </li>
        <li>HTML5 </li>
        <li>CSS3 </li>
        <li>JavaScript : 1.16.1 </li>
        <li>JQuery : 3.5.1 </li>
        <li>Chart.js </li>
        <li>summernote : 0.8.18 </li>
    </ul>
</details>

  <br>

### 💻 Back-End

<details>
      <summary>⚡️ BE 자세히 살펴보기</summary>
      <br>
      <ul>
          <li>springboot : 2.7.15 </li>
          <li>MySQL : 8.0.32 </li>
          <li>jdk : 11.0.16.01 </li>
          <li>lombok </li>
          <li>MyBatis </li>
          <li>JSP </li>
          <li>BCrypt HASH </li>
          <li>Apache Tomcat : 9.0 </li>
      </ul>
  </details>
  
  <br>
  
### 🛠 외부 API

<details>
      <summary>⚡️ API 자세히 살펴보기</summary>
      <br>
      <ul>
          <li>카카오 소셜 로그인 API</li>
          <li>네이버 소셜 로그인 API</li>
          <li>구글 소셜 로그인 API</li>
          <li>카카오페이 API</li>
          <li>javax.mail API</li>
	  <li>한국투자증권 API</li>
      </ul>
</details>

  <br>

### 🙌🏻 Collaboration
<img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=Jira&logoColor=white"/> <img src="https://img.shields.io/badge/SpringBoot-6DB33F?style=flat&logo=Slack&logoColor=white"/> <img src="https://img.shields.io/badge/Github-181717?style=flat&logo=Github&logoColor=white"/> <img src="https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=Notion&logoColor=white"/> <img src="https://img.shields.io/badge/Chart.js-FF6384?style=flat&logo=Notion&logoColor=white"/> <img src="https://img.shields.io/badge/Eclipse-2C2255?style=flat&logo=Notion&logoColor=white"/><br><img src="https://img.shields.io/badge/JQuery-0769AD?style=flat&logo=Notion&logoColor=white"/> <img src="https://img.shields.io/badge/Gradle-02303A?style=flat&logo=Notion&logoColor=white"/> <img src="https://img.shields.io/badge/Tomcat-F8DC75?style=flat&logo=Notion&logoColor=white"/> <img src="https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=Notion&logoColor=white"/> <img src="https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=Notion&logoColor=white"/>


<br>

## ⚙ 의존성
```java
	implementation 'org.springframework.boot:spring-boot-starter-web'
	implementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter:2.3.1'
	implementation 'org.springframework.boot:spring-boot-starter-mail'
	implementation 'org.apache.tomcat.embed:tomcat-embed-jasper'
	implementation 'javax.servlet:jstl'
	implementation 'net.nurigo:sdk:4.3.0'
	compileOnly 'org.projectlombok:lombok'
	developmentOnly 'org.springframework.boot:spring-boot-devtools'
	runtimeOnly 'com.h2database:h2'
	runtimeOnly 'com.mysql:mysql-connector-j'
	annotationProcessor 'org.projectlombok:lombok'
	testImplementation 'org.springframework.boot:spring-boot-starter-test'
	testImplementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter-test:2.3.1'
	testImplementation 'io.projectreactor:reactor-test'
	implementation 'javax.mail:javax.mail-api:1.6.2'
	implementation group: 'com.google.zxing', name: 'javase', version: '3.5.0'
	implementation group: 'com.google.zxing', name: 'core', version: '3.5.0'
	implementation 'org.springframework.boot:spring-boot-starter-websocket'
	implementation 'org.springframework.boot:spring-boot-starter-webflux'
	implementation 'org.springframework.boot:spring-boot-starter-data-jpa'
	implementation 'org.springframework.security:spring-security-crypto'
	testRuntimeOnly 'org.junit.platform:junit-platform-launcher'
	// jsoup	
	implementation 'org.jsoup:jsoup:1.13.1'
	//file
	implementation 'commons-fileupload:commons-fileupload:1.4'
    	implementation 'commons-io:commons-io:2.11.0'
```

<br>
<br>

## 1️⃣ 프로젝트 구조

<details>
    <summary>⚡️ 구조 자세히 살펴보기</summary>
    
    📦src
     ┗ 📂main
       ┣ 📂java
       ┃ ┗ 📂com
       ┃   ┗ 📂green
       ┃     ┗ 📂greenstock
       ┃       ┃ ┣ 📂config
       ┃       ┃ ┗ 📂controller
       ┃       ┣ 📂dto
       ┃       ┣ 📂enums
       ┃       ┣ 📂handler
       ┃       ┃ ┗ 📂exception
       ┃       ┣ 📂repository
       ┃       ┃ ┣ 📂interfaces
       ┃       ┃ ┗ 📂model
       ┃       ┃ ┗ 📂entity
       ┃       ┣ 📂service
       ┃       ┗ 📂utils
       ┣ 📂resources
       ┃ ┣ 📂mapper
       ┃ ┗ 📂static
       ┗ 📂webapp
         ┗ 📂WEB-INF
           ┣ 📂resources
           ┃ ┣ 📂css
           ┃ ┣ 📂js
           ┃ ┣ 📂plugins
           ┃ ┣ 📂fonts
           ┃ ┗ 📂img
           ┗ 📂view
             ┣ 📂admin
             ┣ 📂advisor
             ┣ 📂board
             ┣ 📂chatting
             ┣ 📂layout
             ┣ 📂notice
             ┣ 📂pay
             ┣ 📂portfolio
             ┣ 📂stock
             ┗ 📂user


    
</details>
    
<br>

## 2️⃣ 프로젝트 개요

* 핵심 기능이 많으며 실무에서 활용할 수 있는 기능이 포함된 것들 중,
  결제, 환불, 채팅 등 여러 기능과 다양한 외부 API를 경험 해볼 수 있는 주식 커뮤니티 사이트로 주제를 선정함

<br>

## 3️⃣ 기능 구분

#### User

* 회원기능 : 로그인, 회원가입, 소셜 로그인(Kakao, Google, Naver), ID/PW 찾기, 작성글 관리, 구독 목록 관리
* 주식 정보 조회 : 당일 주식 정보확인, 개별 주식 상세 정보 확인, 주식 별 실시간 채팅
* 주식 포트폴리오 : 포트폴리오 입력 및 조회, 각 포트폴리오 관리 및 랭킹 조회
* 커뮤니티 : 커뮤니티 게시판, 공지사항
* 주식 전문가 : 주식 전문가 신청, 전문가 목록 조회, 전문가 구독 및 결제

#### Manager

* 대시보드 : 일일 접속 유저 차트 조회, 월별 구독자수 차트 조회
* 회원 관리 : 유저 목록 및 검색, 유저 정지기능
* 커뮤니티 관리 : 공지사항 관리, 커뮤니티 게시글 관리, 채팅 관리

<br>

## 4️⃣ ERD & 테이블 명세서
테이블 명세서 : [https://docs.google.com/spreadsheets/d/1oaUxJ4CWKrVUvi02h9mYOwBL-raDCLswAQ5Qllws7Xw/edit#gid=0](https://docs.google.com/spreadsheets/d/1PxWk2Hjt_2J9wEkbV4r2eIhkXZoKDakHFHb2PHKSTm8/edit#gid=0)

<br>
<br>

![ERD Model](https://github.com/seoyounglee0105/green_airline_project/assets/124985978/3dc47f53-61da-4115-9644-3d19a8e3f185)


<br>
<br>


## 5️⃣ SiteMap
<br>

<table>
<tr>
 <td>User</td>
 <td>Manager</td>
 </tr>
<tr>
<td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/105858187/872e19cf-262f-48aa-bd3a-338e88208be6"></td>
<td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/105858187/faa63d99-e44c-49d5-adf1-66d1dff62262"></td>
</tr>
</table>

<br>

## 6️⃣ 기능 - 회원

#### 회원가입
- 아이디 중복 확인
- 비밀번호 확인 
- Validation 처리
- 이메일 인증(javax.mail)

#### 로그인
- 카카오 소셜 로그인
- 구글 소셜 로그인
- 네이버 소셜 로그인
- 일반 로그인
- 아이디/비밀번호 찾기 (javax.mail)

#### 주식 정보 조회
- 회사명으로 주식 정보 조회
- 실시간 주식 가격 확인
- 기간별 종가, 거래량 차트

#### 주식 포트폴리오
- 포트폴리오 생성 및 수정, 삭제
- 포트폴리오 주식 추가 및 판매
- 포트폴리오 주식 목록 조회
- 포트폴리오 랭킹 조회
- 포트폴리오 일일 성장률 조회

#### 커뮤니티
- 

#### 주식 전문가
- 전문가 구독 및 결제(Kakao 결제 Api)
- 전문가 상담 게시판(구독자)

<br>

<table>
<tr>
  <td>메인</td>
  <td>회원 안내</td>
</tr>
<tr>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/106488607/3ea6b895-9579-47b6-a423-fbfcfb58833d"></td>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/106488607/f46b7412-65ce-44f3-a84b-6e192ecc30e6"></td>
</tr>
<tr>
  <td>카카오 소셜 로그인</td>
  <td>비밀번호 찾기 (이메일 SMTP)</td>
</tr>
<tr>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/105858187/8b4dbb54-cb86-4e52-9b80-9795dc45cfd1/img.gif"></td>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/106488607/fac17342-cb00-4329-8f1f-06a7d4fa94f8/img.gif"></td>
</tr>
<tr>
  <td>비밀번호 변경</td>
  <td>회원 정보 변경</td>
</tr>
<tr>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/105858187/65af6941-116b-443b-bf6a-022582240feb/img.gif"></td>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/105858187/9fa448ae-b9d3-44d2-82e6-e0b535ad7033a/img.gif"></td>
</tr>
<tr>
  <td>항공권 예약/환불 (카카오페이)</td>
  <td>항공권 예약/환불 (마일리지)</td>
</tr>
<tr>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/106488607/1cd653da-4adf-4cd9-a653-24aed68336c2/img.gif"></td>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/106488607/8295e81a-39ec-4d1f-b1f4-04bf66ff3289/img.gif"></td>
</tr>
<tr>
  <td>기내 서비스 조회</td>
  <td>위탁 수하물 신청</td>
</tr>
<tr>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/105858187/79470ee8-9b6d-42e3-877b-5b8e07bd3f84/img.gif"></td>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/105858187/c07b2977-7795-47e1-b2ba-b796f8d009ef/img.gif"></td>
</tr>
<tr>
  <td>특별 기내식 조회</td>
  <td>특별 기내식 신청</td>
</tr>
<tr>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/105858187/d075854e-8ebc-46ce-b78a-1fa218e5fd9c/img.gif"></td>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/105858187/dc56d0aa-5aff-4b47-963c-df326b674579/img.gif"></td>
</tr>
<tr>
  <td>여행일지</td>
  <td>공항 위치 정보 (구글 맵 API)</td>
</tr>
<tr>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/106488607/f5aab43f-dee4-4d17-838f-33668411aeaa/img.gif"></td>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/106488607/519cd0ca-d90a-4ed7-8fb2-e3d16f0ad3f2/img.gif"></td>
</tr>
<tr>
  <td>항공기 정보</td>
  <td>마일리지샵 구매 (이메일 SMTP)</td>
</tr>
<tr>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/106488607/3b1067de-58a7-478f-8576-fc91744a300d/img.gif"></td>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/106488607/8021f046-485e-486f-9862-15098df8aa41/img.gif"></td>
</tr>
<tr>
  <td>마일리지샵 환불</td>
  <td>공지사항</td>
</tr>
<tr>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/106488607/94235af1-5a2c-4fdd-9673-7aa45bd78b13/img.gif"></td>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/105858187/14721b13-882e-411b-b08a-00f1e11cbbc6/img.gif"></td>
</tr>
<tr>
  <td>자주 묻는 질문</td>
  <td>고객의 말씀 작성</td>
</tr>
<tr>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/105858187/3caecebf-071d-44c8-b5a2-bec30083b58c/img.gif"></td>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/106488607/ea38a3f9-cdae-42e6-8f3e-469970e2bdeb/img.gif"></td>
 </tr>
</table>

<br>

## 7️⃣ 기능 - 관리자

#### 대시보드
- chart.js 활용
- 일일 방문자 수, 월별 구독자 수

#### 회원 관리
- 회원 조회 (검색 기능, 페이징 처리)
- 회원 정지 처리

<br>

<table>
<tr>
  <td>대시보드</td>
  <td>회원 정보 조회</td>
</tr>
<tr>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/106488607/a5dd6d2d-c462-476b-90d9-86e759df94e9" width="445"></td>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/106488607/15547ecc-167f-4a2a-b87c-4462ecce1f43/img.gif"></td>
</tr>
<tr>
  <td>관리자 정보 조회</td>
  <td>마일리지샵 상품 등록</td>
</tr>
<tr>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/106488607/df7e0db1-de86-46cf-9c55-4ef402f77680/img.gif"></td>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/106488607/80afc88c-6ba2-4107-8a18-62bf118546df/img.gif"></td>
</tr>
<tr>
  <td>마일리지샵 이용 내역 조회</td>
  <td>공지사항 작성</td>
</tr>
<tr>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/106488607/28eb301d-1af1-4498-9a3b-2bd168987e39/img.gif"></td>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/105858187/7bea7e6a-0fab-4082-b406-446702474c90/img.gif"></td>
</tr>
<tr>
  <td>자주 묻는 질문 작성</td>
  <td>고객의 말씀 답변</td>
</tr>
<tr>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/105858187/f8fce7d1-ab33-4d66-b7d1-c4b03c7c94a0/img.gif"></td>
  <td><img src="https://github.com/seoyounglee0105/green_airline_project/assets/106488607/b0c45e0b-c09e-4473-8605-500392a60542/img.gif"></td>
</tr>
</table>
