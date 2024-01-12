# 첫번째 스테이지 시작
FROM eclipse-temurin:17-jdk as builder

# 컨테이너의 작업 경로 설정
WORKDIR /workspace/app

# 호스트에서 빌드된 파일을 컨테이너로 복사
COPY ./gradlew /workspace/app/
COPY ./settings.gradle /workspace/app/
COPY ./build.gradle /workspace/app/
COPY ./gradle /workspace/app/gradle/
COPY ./src /workspace/app/src/

# 빌드 실행
RUN /workspace/app/gradlew build
RUN mv /workspace/app/build/libs/myweb-0.0.1-SNAPSHOT.jar /workspace/app/app.jar



# 두번째 스테이지 시작
FROM eclipse-temurin:17-jre as runner

# 각 스테이지는 별도의 환경이기 때문에 다시 선언
WORKDIR /workspace/app

# 이전 스테이지에서 jar파일 복사
COPY --from=builder /workspace/app/app.jar /workspace/app/app.jar

# 컨테이너 실행시에 app.jar를 실행
ENTRYPOINT ["java","-jar","app.jar"]