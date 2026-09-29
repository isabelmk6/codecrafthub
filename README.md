# CodeCraftHub

CodeCraftHub is a simple beginner-friendly REST API project for managing online courses. It lets you create, view, update, and delete course records using HTTP requests.

This project is a great example for learning how REST APIs work in practice. It uses Flask, a lightweight Python web framework, and stores course data in a JSON file on your computer.

---

## Project Overview

CodeCraftHub helps track course information such as:

- course name
- description
- target date
- current status
- creation date

You can interact with the app using tools like:

- curl in the terminal
- Postman
- browser requests
- custom Python scripts

This project is intentionally simple so beginners can understand the basics of:

- routes
- HTTP methods
- JSON payloads
- request validation
- status codes
- file-based data storage

---

## Features

- Get a list of all courses
- Get one course by its ID
- Create a new course
- Update an existing course
- Delete a course
- Validate required fields before creating a course
- Validate course status values
- Save data to a local JSON file
- Return clear success and error messages in JSON

---

## Tech Stack

- Python 3
- Flask
- JSON file storage

---

## Installation Instructions

Follow these steps carefully.

### 1. Check Python is installed

Open your terminal and run:

```bash
python --version
```

If Python is not installed, install Python 3 from the official Python website.

### 2. Open the project folder

Go to the project folder in your terminal:

```bash
cd path/to/final-project-p1
```

Example:

```bash
cd /Users/yourname/Documents/final-project-p1
```

### 3. Create a virtual environment (recommended)

This keeps your project dependencies isolated.

```bash
python -m venv .venv
```

### 4. Activate the virtual environment

On macOS/Linux:

```bash
source .venv/bin/activate
```

On Windows:

```bash
.venv\Scripts\activate
```

### 5. Install Flask

```bash
pip install flask
```

### 6. Confirm Flask is installed

```bash
python -c "import flask; print(flask.__version__)"
```

If this works, your environment is ready.

---

## How to Run the Application

From the project folder, run:

```bash
python app.py
```

You should see output like:

```bash
CodeCraftHub API is starting...
Data will be stored in: /your/path/to/project/courses.json
API will be available at: http://localhost:5000
```

The app runs on:

```text
http://localhost:5000
```

Keep the terminal open while using the API.

---

## API Endpoints

The API uses JSON for both requests and responses.

### Base URL

```text
http://localhost:5000
```

---

### 1. Get all courses

Method: GET

Endpoint:

```http
GET /api/courses
```

Example:

```bash
curl -X GET http://localhost:5000/api/courses
```

Example response:

```json
{
  "success": true,
  "count": 1,
  "courses": [
    {
      "id": 1,
      "name": "Python Fundamentals",
      "description": "Learn Python basics and syntax.",
      "target_date": "2026-10-15",
      "status": "Not Started",
      "created_at": "2026-09-29 12:00:00"
    }
  ]
}
```

---

### 2. Get one course

Method: GET

Endpoint:

```http
GET /api/courses/<course_id>
```

Example:

```bash
curl -X GET http://localhost:5000/api/courses/1
```

Example response:

```json
{
  "success": true,
  "course": {
    "id": 1,
    "name": "Python Fundamentals",
    "description": "Learn Python basics and syntax.",
    "target_date": "2026-10-15",
    "status": "Not Started",
    "created_at": "2026-09-29 12:00:00"
  }
}
```

If the course does not exist:

```json
{
  "success": false,
  "error": "Course not found"
}
```

---

### 3. Create a new course

Method: POST

Endpoint:

```http
POST /api/courses
```

Headers:

```http
Content-Type: application/json
```

Example request body:

```json
{
  "name": "Python Fundamentals",
  "description": "Learn Python basics and syntax.",
  "target_date": "2026-10-15",
  "status": "Not Started"
}
```

Example curl command:

```bash
curl -X POST http://localhost:5000/api/courses \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Python Fundamentals",
    "description": "Learn Python basics and syntax.",
    "target_date": "2026-10-15",
    "status": "Not Started"
  }'
```

Example success response:

```json
{
  "success": true,
  "message": "Course added successfully",
  "course": {
    "id": 1,
    "name": "Python Fundamentals",
    "description": "Learn Python basics and syntax.",
    "target_date": "2026-10-15",
    "status": "Not Started",
    "created_at": "2026-09-29 12:00:00"
  }
}
```

Status code: 201 Created

---

### 4. Update a course

Method: PUT

Endpoint:

```http
PUT /api/courses/<course_id>
```

Headers:

```http
Content-Type: application/json
```

Example request body:

```json
{
  "name": "Python Fundamentals Updated",
  "status": "In Progress"
}
```

Example curl command:

```bash
curl -X PUT http://localhost:5000/api/courses/1 \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Python Fundamentals Updated",
    "status": "In Progress"
  }'
```

Example success response:

```json
{
  "success": true,
  "message": "Course updated successfully",
  "course": {
    "id": 1,
    "name": "Python Fundamentals Updated",
    "description": "Learn Python basics and syntax.",
    "target_date": "2026-10-15",
    "status": "In Progress",
    "created_at": "2026-09-29 12:00:00"
  }
}
```

Status code: 200 OK

---

### 5. Delete a course

Method: DELETE

Endpoint:

```http
DELETE /api/courses/<course_id>
```

Example:

```bash
curl -X DELETE http://localhost:5000/api/courses/1
```

Example success response:

```json
{
  "success": true,
  "message": "Course deleted successfully",
  "deleted_course": {
    "id": 1,
    "name": "Python Fundamentals Updated",
    "description": "Learn Python basics and syntax.",
    "target_date": "2026-10-15",
    "status": "In Progress",
    "created_at": "2026-09-29 12:00:00"
  }
}
```

Status code: 200 OK

---

## Valid Status Values

When creating or updating a course, the status must be one of these:

- Not Started
- In Progress
- Completed

Example valid JSON:

```json
{
  "status": "Completed"
}
```

Example invalid JSON:

```json
{
  "status": "Draft"
}
```

This returns an error:

```json
{
  "success": false,
  "error": "Status must be one of: Not Started, In Progress, Completed"
}
```

---

## Testing Instructions

You can test the project in a few ways.

### Option 1: Use curl in the terminal

This is the easiest method for beginners.

Example:

```bash
curl -X GET http://localhost:5000/api/courses
```

### Option 2: Use Postman

1. Open Postman.
2. Create a new request.
3. Select the HTTP method (GET, POST, PUT, DELETE).
4. Enter the URL.
5. Add the JSON body when needed.
6. Click Send.

### Option 3: Use Python requests

```python
import requests

response = requests.get('http://localhost:5000/api/courses')
print(response.status_code)
print(response.json())
```

---

## Example Test Cases

### Test 1: Get all courses

```bash
curl -X GET http://localhost:5000/api/courses
```

### Test 2: Create a course

```bash
curl -X POST http://localhost:5000/api/courses \
  -H "Content-Type: application/json" \
  -d '{
    "name": "JavaScript Basics",
    "description": "Learn JavaScript syntax and logic.",
    "target_date": "2026-11-01",
    "status": "Not Started"
  }'
```

### Test 3: Update a course

```bash
curl -X PUT http://localhost:5000/api/courses/1 \
  -H "Content-Type: application/json" \
  -d '{
    "status": "Completed"
  }'
```

### Test 4: Delete a course

```bash
curl -X DELETE http://localhost:5000/api/courses/1
```

---

## Troubleshooting Common Issues

### 1. The app will not start

Check that Flask is installed:

```bash
pip install flask
```

If you see a module error, make sure your virtual environment is active.

---

### 2. Port 5000 is already in use

Another app may already be using port 5000.

Try closing the other program or change the port in the file.

In app.py, look for:

```python
app.run(debug=True, host='0.0.0.0', port=5000)
```

Change it to another port, like 5001:

```python
app.run(debug=True, host='0.0.0.0', port=5001)
```

Then use:

```bash
http://localhost:5001
```

---

### 3. JSON is not accepted

Make sure your request includes:

```http
Content-Type: application/json
```

Example:

```bash
curl -X POST http://localhost:5000/api/courses \
  -H "Content-Type: application/json" \
  -d '{"name":"Course","description":"Test","target_date":"2026-10-15","status":"Not Started"}'
```

---

### 4. Missing required field error

The API requires these fields for a new course:

- name
- description
- target_date
- status

If you forget one, you will get an error like:

```json
{
  "success": false,
  "error": "Missing required field: target_date"
}
```

---

### 5. Invalid status error

The status must be exactly one of:

- Not Started
- In Progress
- Completed

Case and spelling must match.

---

### 6. Course not found

This happens when you try to update or delete an ID that does not exist.

Example:

```bash
curl -X GET http://localhost:5000/api/courses/9999
```

Response:

```json
{
  "success": false,
  "error": "Course not found"
}
```

---

## Project Structure

The project is very small and beginner-friendly.

```text
final-project-p1/
├── app.py
├── courses.json
├── README.md
├── .venv/
└── __pycache__/
```

### File explanations

#### app.py
This is the main application file.

It contains:

- Flask app setup
- route definitions
- JSON data loading and saving
- validation logic
- HTTP response handling

#### courses.json
This file stores all course records.

It is created automatically when the app runs for the first time.

#### README.md
This file explains the project and how to use it.

#### .venv
This folder contains your Python virtual environment.

---

## Learning Notes for Beginners

This project demonstrates important REST API ideas:

- GET = read data
- POST = create data
- PUT = update data
- DELETE = remove data
- JSON = common data format for APIs
- HTTP status codes tell you whether the request succeeded or failed
- validation helps protect the API from bad input

A typical workflow is:

1. Start the server
2. Send an HTTP request
3. Receive JSON data
4. Check the status code
5. Use the response to decide what to do next

---

## Example Beginner Workflow

```bash
python app.py
```

Then in another terminal:

```bash
curl -X POST http://localhost:5000/api/courses \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Intro to APIs",
    "description": "Learn how REST APIs work.",
    "target_date": "2026-12-10",
    "status": "Not Started"
  }'
```

Then:

```bash
curl -X GET http://localhost:5000/api/courses
```

This gives you a basic idea of how backend APIs work in real projects.

---

## Summary

CodeCraftHub is a simple course management API that teaches REST API basics through real, working code.

It is a practical starting point for beginners who want to learn:

- Flask
- REST APIs
- JSON requests and responses
- CRUD operations
- API testing with curl

---

## Next Steps

Once you understand this project, you can expand it by adding:

- user authentication
- search by course name
- pagination
- database storage with SQLite or PostgreSQL
- front-end interface
- filtering by status

Happy coding!
