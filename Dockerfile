FROM openjdk:17-jdk-slim AS build
WORKDIR /app
COPY . .
RUN chmod +x mvnw  # Dar permisos de ejecución
RUN ./mvnw clean package -DskipTests  

FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/Proyecto_Con_Render-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]