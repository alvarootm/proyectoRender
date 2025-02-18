FROM openjdk:17-jdk-slim AS build
WORKDIR /app
COPY . .
RUN chmod +x mvnw  # Dar permisos de ejecución
RUN ./mvnw clean package -DskipTests

# Verificar los archivos generados en /app/target
RUN ls -l /app/target  # Asegurarse de que el archivo .jar esté presente

FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/entregaRender-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
