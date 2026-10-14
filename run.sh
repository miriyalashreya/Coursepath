#!/usr/bin/env bash
echo "===================================================================="
echo "       CoursePath: Academic Prerequisite & Course Planning System   "
echo "===================================================================="

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Ensure wrapper is executable
chmod +x "$ROOT_DIR/backend/mvnw"

echo "[1/2] Starting Spring Boot Backend (Port 8080)..."
(cd "$ROOT_DIR/backend" && ./mvnw spring-boot:run) &
BACKEND_PID=$!

echo "[2/2] Starting React Frontend (Port 5173)..."
(cd "$ROOT_DIR/frontend" && npm run dev) &
FRONTEND_PID=$!

echo ""
echo "CoursePath is running!"
echo "Backend:  http://localhost:8080"
echo "Frontend: http://localhost:5173"
echo ""
echo "Press Ctrl+C to terminate both servers."

trap "kill $BACKEND_PID $FRONTEND_PID; exit" SIGINT SIGTERM
wait
