
```markdown
# BookMyShow-like Website with Java Servlet & Tomcat

This project is a simple website inspired by **BookMyShow**, built with **HTML, CSS, JavaScript**, and a **Java Servlet backend** running on **Tomcat**.  
The project uses a **multi-stage Docker build** to compile the servlet and serve the application.

---

## 🚀 Features
- Static frontend: `index.html`, `styles.css`, `script.js`
- Java backend: `YourServlet.java` (Servlet API 4.0.1)
- Tomcat 9 as the application server
- Multi-stage Docker build for lightweight image

---

## 🛠 Project Structure
```

.
├── backend/
│   ├── classes/
│   │   └── YourServlet.java     # Servlet source
│   └── WEB-INF/
│       └── web.xml              # Servlet configuration
├── index.html                   # Main frontend page
├── styles.css                   # CSS styling
├── script.js                    # Frontend logic
├── Dockerfile                   # Multi-stage Dockerfile
└── README.md

````

---

## 🐳 Docker Build & Run

### 1. Build the Docker image
```bash
docker build -t bookmyshow-clone .
````

### 2. Run the container

```bash
docker run -d -p 8080:8080 bookmyshow-clone
```

### 3. Access the app

Open [http://localhost:8080](http://localhost:8080) in your browser.

---

## ⚙️ How It Works

1. **Stage 1 (Builder):**

   * Uses `openjdk:17`
   * Downloads `javax.servlet-api:4.0.1`
   * Compiles `YourServlet.java`

2. **Stage 2 (Runtime):**

   * Uses `tomcat:9.0`
   * Removes default Tomcat apps
   * Copies frontend files into `ROOT`
   * Copies compiled servlet and `web.xml` into `WEB-INF`

---

## 📂 Servlet Configuration Example (`web.xml`)

```xml
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         version="4.0">
    <servlet>
        <servlet-name>YourServlet</servlet-name>
        <servlet-class>YourServlet</servlet-class>
    </servlet>

    <servlet-mapping>
        <servlet-name>YourServlet</servlet-name>
        <url-pattern>/api/hello</url-pattern>
    </servlet-mapping>
</web-app>
```

---

## 🔧 Development Notes

* To add more servlets, place `.java` files in `backend/classes/` and update `web.xml`.
* Ensure correct package imports in `YourServlet.java`:

  ```java
  import java.io.*;
  import javax.servlet.*;
  import javax.servlet.http.*;
  ```

---

## 📜 License

This project is for **learning purposes only** and is not affiliated with BookMyShow.

```

