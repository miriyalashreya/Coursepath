# CoursePath: An Academic Prerequisite & Course Planning System

> **A Full Stack Web Application to plan academic course progressions, evaluate prerequisite relationships, calculate eligibility in real time, and build multi-semester degree pathways.**

---

## 📌 Project Abstract

**CoursePath** is a Full Stack academic planning system designed to help college students navigate academic course pathways based on prerequisite requirements and completed subjects. 

The system enables students to log in, review and update the courses they have completed, and automatically validates prerequisite dependencies across a Directed Acyclic Graph (DAG) curriculum model. Based on this information, the system identifies eligible courses, highlights missing prerequisites, displays multi-semester dependency roadmaps, and facilitates planning future semester schedules.

Administrators are equipped with a management portal to control course offerings, configure prerequisite dependencies with automated circular dependency prevention, manage academic departments, and analyze bottleneck prerequisite courses.

### 🔄 System Workflow

```text
+---------------+     +---------------------------+     +------------------------+
| Student Login | --> | Select Completed Courses  | --> | Check Prerequisites    |
+---------------+     +---------------------------+     +------------------------+
                                                                     |
+--------------------+     +------------------------+     +----------v-------------+
| Plan Next Semester | <-- | Generate Course Path   | <-- | Identify Eligible Courses
+--------------------+     +------------------------+     +------------------------+
```

---

## 🛠️ Technology Stack

| Layer | Technologies |
|---|---|
| **Backend** | Java 17, Spring Boot 3.2.5, Spring Data JPA (Hibernate), Bean Validation, Maven Wrapper |
| **Database** | **H2 Embedded Database** (zero setup required; works immediately out-of-the-box) or **MySQL 8.x** (configurable in `application.properties`) |
| **Frontend** | React 18, Vite, Modern Responsive CSS, SVG Directed Acyclic Graph, Lucide Icons, Canvas Confetti |
| **Testing** | JUnit 5, Spring Boot Test (Prerequisite DAG cycle tests, Eligibility calculation tests) |
| **IDE Support** | Visual Studio Code (preconfigured `.vscode/launch.json` & `.vscode/tasks.json`), IntelliJ IDEA, Eclipse |

---

## 🚀 How to Run in Visual Studio Code

### Method 1: One-Click Startup Script (Windows)

1. Extract `coursepath.zip` to your desired directory.
2. Double-click **`run.bat`** in the root directory.
3. The script will automatically:
   - Start the Spring Boot backend on **http://localhost:8080**
   - Start the React frontend on **http://localhost:5173**
   - Open your default web browser to the application!

---

### Method 2: Running Inside Visual Studio Code

1. Open **Visual Studio Code**.
2. Click **File** > **Open Folder...** and select the extracted `coursepath` folder.
3. Open a terminal in VS Code (`Ctrl + \`` or **Terminal** > **New Terminal**):

#### Terminal 1 - Start Spring Boot Backend:
```bash
cd backend
./mvnw spring-boot:run
```
*(On Windows Command Prompt / PowerShell, run: `.\mvnw.cmd spring-boot:run`)*

#### Terminal 2 - Start React Frontend:
```bash
cd frontend
npm run dev
```

4. Open your web browser and navigate to:
   👉 **http://localhost:5173**

---

### Method 3: Running Automated Tests

To run the automated test suite (Prerequisite Cycle Detection, Self-Dependency Check, Eligibility Transition):
```bash
cd backend
./mvnw test
```
*(Or `.\mvnw.cmd test` on Windows)*

---

## 👥 Demo Accounts & Authentication

The application includes both an **interactive registration & login modal** and an instant **demo profile switcher**:

| Role | Username | Password | Notes |
|---|---|---|---|
| **Student (Sophomore)** | `student` | `student123` | **John Doe** (Sem 3) - Semesters 1 & 2 courses completed; Sem 3 core courses unlocked! |
| **Student (Freshman)** | `alice` | `alice123` | **Alice Smith** (Sem 1) - Brand new student; Sem 1 courses eligible, future courses locked. |
| **Administrator** | `admin` | `admin123` | **Dr. Alan Turing** - Full access to Course Catalog, Prerequisite Manager, and Department CRUD. |

> 💡 **Student Registration**: Click on the user badge or Sign In button in the navigation bar to register a brand new student account with custom Student ID and Department!

---

## 🗄️ Database Configuration

### 1. Default (Embedded H2 Database - Zero Setup)
The project is configured to use H2 in-memory/file mode by default. You do not need to install MySQL to run the project immediately.
- **H2 Web Console**: [http://localhost:8080/h2-console](http://localhost:8080/h2-console)
- **JDBC URL**: `jdbc:h2:mem:coursepathdb`
- **Username**: `sa`
- **Password**: *(leave blank)*

### 2. Optional MySQL Configuration
To use local MySQL, open `backend/src/main/resources/application.properties` and uncomment the MySQL block:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/coursepath_db?createDatabaseIfNotExist=true&useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true
spring.datasource.username=root
spring.datasource.password=your_mysql_password
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
spring.jpa.database-platform=org.hibernate.dialect.MySQLDialect
```

---

## 📋 Comprehensive Feature Highlights

### 1. Student Dashboard & Degree Analytics
- Real-time progress bar of total credits earned vs total degree requirements.
- Cumulative GPA calculator weighted by course credits.
- Instant overview of Eligible vs Locked courses.

### 2. Completed Courses Manager (Step 2)
- Interactive checklist of all curriculum courses organized by semester.
- Grade assignment for completed courses (`A+`, `A`, `B+`, `B`, etc.).
- Convenient presets to test different student standings (e.g., Sophomore preset, Junior preset, Reset).

### 3. Prerequisite Checking & Eligibility Engine (Steps 3 & 4)
- **Automated Directed Acyclic Graph (DAG) validation**.
- Categorized views:
  - **Eligible Now**: All prerequisite criteria met; unlocked for immediate enrollment.
  - **Locked**: Unmet prerequisite dependencies. Displays visual chips showing exactly which courses are missing.
  - **Completed**: Already taken with grade displayed.

### 4. Interactive Course Path & Visual Dependency Graph (Step 5)
- **SVG Directed Acyclic Graph (DAG)**: Interactive node-and-edge visual canvas displaying courses across Semesters 1 to 8 with Bezier curve arrows.
  - Hover or click any node to highlight incoming prerequisites in cyan and outgoing unlocked courses in purple!
  - Zoom controls and department filters.
- **8-Semester Pathway Grid**: Detailed semester-by-semester card view.
- **Specialization Tracks**: AI & Machine Learning Track, Systems & Cloud Track, Software Engineering & Capstone Track.

### 5. Next Semester Planner (Step 6)
- Allows students to build a prospective semester schedule from eligible courses.
- **Live Credit Load Meter**: Indicates Full-Time (12-18 credits), Underload (< 12), and Overload (> 18) conditions.
- Save semester plans, view historical plans, and **Export / Print** formal academic semester schedules.

### 6. Academic Degree Audit & Graduation Readiness
- Categorized checklist verifying Foundational Mathematics, Core Software, Systems Architecture, and Capstone Project requirements.
- **Critical Bottleneck Advisory**: Proactively alerts students if they are missing foundational bottleneck courses (like CS201 Data Structures or CS205 OS) that delay graduation.
- Estimated semesters remaining to graduation.
- Export / Print Official Degree Audit Report.

### 7. Admin Management Module
- **Course Catalog CRUD**: Add, edit, and delete courses.
- **Prerequisite Manager**: Link prerequisite relationships between courses with automated cycle detection (prevents circular loops).
- **Department Manager**: Add academic departments.
- **Bottleneck Analysis**: Identifies courses that block the highest number of future downstream courses.

---

## 📁 Project Directory Structure

```text
coursepath/
├── backend/
│   ├── .mvn/                     # Maven Wrapper binary and configuration
│   ├── src/
│   │   ├── main/
│   │   │   ├── java/com/coursepath/
│   │   │   │   ├── CoursePathApplication.java
│   │   │   │   ├── config/       # CorsConfig
│   │   │   │   ├── controller/   # REST Controllers (Auth, Course, Student, Admin, etc.)
│   │   │   │   ├── dto/          # Data Transfer Objects
│   │   │   │   ├── initializer/  # DataInitializer (30 sample courses, prereqs, users)
│   │   │   │   ├── model/        # JPA Entities (Course, Prerequisite, User, Plan, etc.)
│   │   │   │   ├── repository/   # Spring Data JPA Repositories
│   │   │   │   └── service/      # Business logic & Prerequisite DAG engine
│   │   │   └── resources/
│   │   │       └── application.properties # H2 and MySQL configurations
│   │   └── test/                 # Automated JUnit 5 test suite
│   ├── mvnw                      # Linux/Mac Maven wrapper script
│   ├── mvnw.cmd                  # Windows Maven wrapper script
│   └── pom.xml                   # Maven dependencies
├── frontend/
│   ├── public/
│   ├── src/
│   │   ├── components/
│   │   │   ├── Navbar.jsx
│   │   │   ├── WorkflowStepper.jsx
│   │   │   ├── DashboardView.jsx
│   │   │   ├── CompletedCoursesView.jsx
│   │   │   ├── EligibilityView.jsx
│   │   │   ├── CoursePathView.jsx
│   │   │   ├── VisualDependencyGraph.jsx # Interactive SVG DAG Canvas
│   │   │   ├── SemesterPlannerView.jsx
│   │   │   ├── DegreeAuditView.jsx       # Graduation audit & bottleneck alerts
│   │   │   ├── AdminPortalView.jsx
│   │   │   ├── CourseDetailModal.jsx
│   │   │   ├── AuthModal.jsx             # Login & Registration modal
│   │   │   └── Toast.jsx
│   │   ├── api.js                # Centralized REST API client
│   │   ├── App.jsx               # Main state & view coordinator
│   │   ├── index.css             # Polished custom stylesheet
│   │   └── main.jsx
│   ├── index.html
│   ├── package.json
│   └── vite.config.js
├── .vscode/
│   ├── launch.json               # VS Code launch and debug configurations
│   ├── tasks.json                # VS Code build and run tasks
│   └── extensions.json           # Recommended VS Code plugins
├── run.bat                       # 1-Click Windows execution script
├── run.sh                        # 1-Click Unix/Mac execution script
└── README.md                     # Comprehensive project documentation
```
