# ============================================
# Dockerfile optimisé pour Java Maven App
# ============================================
# Ce Dockerfile utilise le JAR pré-compilé par GitHub Actions
# Le build Maven est effectué dans le workflow 1-maven-build.yml

FROM openjdk:8-jre-alpine

LABEL maintainer="devops@example.com"
LABEL description="Java Maven Spring Boot Application"
LABEL version="1.1.0"

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

COPY --chown=appuser:appgroup target/*.jar app.jar

EXPOSE 8080

USER appuser

# Configuration JVM optimisée pour les conteneurs
ENV JAVA_OPTS="-Xmx512m -Xms256m -XX:+UseContainerSupport -XX:MaxRAMPercentage=75.0"

HEALTHCHECK --interval=30s --timeout=3s --start-period=40s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:8080/actuator/health || exit 1

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
