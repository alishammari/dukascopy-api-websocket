FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-alpine
WORKDIR /app
COPY --from=build /app/target/dukascopy-api-websocket-1.0.war app.war

EXPOSE 7080
EXPOSE 7081

# ENTRYPOINT ثابت (التطبيق يُشغّل الجار)
ENTRYPOINT ["java", "-jar", "app.war"]

# إذا أردت تمرير وسيطة بدء (مثلاً أثناء التطوير)
# CMD ["--dukascopy.credential-username=DEMO2HUWaQ", "--dukascopy.credential-password=HUWaQ"]
