# Stage 1: Compile Java files
FROM openjdk:17 AS builder

WORKDIR /app

# Copy servlet source code
COPY backend/classes/YourServlet.java .

# Download servlet-api.jar (you could also ADD it to the project instead)
RUN mkdir -p lib && \
    curl -o lib/servlet-api.jar https://repo1.maven.org/maven2/javax/servlet/javax.servlet-api/4.0.1/javax.servlet-api-4.0.1.jar

# Compile servlet
RUN javac -cp lib/servlet-api.jar YourServlet.java

# Stage 2: Use Tomcat to serve app
FROM tomcat:9.0

# Clean default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy static frontend files
COPY index.html styles.css script.js /usr/local/tomcat/webapps/ROOT/

# Copy servlet and config
COPY --from=builder /app/YourServlet.class /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/
COPY backend/WEB-INF/web.xml /usr/local/tomcat/webapps/ROOT/WEB-INF/

EXPOSE 8080
