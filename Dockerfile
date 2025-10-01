FROM openjdk:17-jdk-alpine
EXPOSE 7080
EXPOSE 7081
ADD target/dukascopy-api-websocket-1.0.war dukascopy-api-websocket.war
ENTRYPOINT [
  "java",
  "-jar",
  "dukascopy-api-websocket.war",
  "--dukascopy.credential-username=DEMO2HUWaQ",
  "--dukascopy.credential-password=HUWaQ"
]
