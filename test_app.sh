# 1. Get all courses
curl http://localhost:5000/api/courses

# 2. Create a course
curl -X POST http://localhost:5000/api/courses \
  -H "Content-Type: application/json" \
  -d '{"name":"Python Fundamentals","description":"Learn Python basics","target_date":"2026-10-15","status":"Not Started"}'

# 3. Get the course by id
curl http://localhost:5000/api/courses/1

# 4. Update the course
curl -X PUT http://localhost:5000/api/courses/1 \
  -H "Content-Type: application/json" \
  -d '{"status":"In Progress"}'

# 5. Delete the course
curl -X DELETE http://localhost:5000/api/courses/1