# Flask Todo Application

A simple yet elegant todo list web application built with Flask and PostgreSQL. This application allows users to create, manage, and track their tasks with a beautiful, responsive user interface.

## Features

- ✅ **Add Tasks** - Create new todo items with ease
- ✅ **Mark Complete** - Check off completed tasks
- ✅ **Delete Tasks** - Remove tasks from your list
- ✅ **Task Timestamps** - See when each task was created
- ✅ **Responsive Design** - Works seamlessly on desktop and mobile devices
- ✅ **Task Counter** - Track completed tasks
- ✅ **Persistent Storage** - All tasks are saved in PostgreSQL database

## Tech Stack

- **Backend**: Flask (Python web framework)
- **Database**: PostgreSQL
- **ORM**: SQLAlchemy
- **Frontend**: HTML5, Bootstrap 5, Jinja2 templating
- **Styling**: Custom CSS with Bootstrap components

## Project Structure

```
flask_todo/
├── app.py                 # Main Flask application
├── templates/
│   ├── base.html         # Base template with styling
│   └── index.html        # Todo list page
├── __pycache__/          # Python cache (auto-generated)
└── README.md             # This file
```

## Prerequisites

Before you begin, ensure you have the following installed:

- **Python 3.7+** - Download from [python.org](https://www.python.org)
- **PostgreSQL** - Download from [postgresql.org](https://www.postgresql.org)
- **pip** - Python package manager (comes with Python)

## Installation & Setup

### 1. Clone or Navigate to Project

```bash
cd /PATH_TO_YOUR_PROJECT/flask_todo
```

### 2. Create a Virtual Environment (Recommended)

```bash
python3 -m venv venv
```

### 3. Activate Virtual Environment

**On macOS/Linux:**
```bash
source venv/bin/activate
```

**On Windows:**
```bash
venv\Scripts\activate
```

### 4. Install Required Dependencies

```bash
pip install flask flask-sqlalchemy psycopg2-binary
```

### 5. Configure PostgreSQL Database

Ensure PostgreSQL is running on your system. The default configuration expects:

- **Host**: localhost
- **Port**: 5433
- **Username**: postgres
- **Password**: 1234
- **Database**: commondb

If your PostgreSQL setup differs, modify the database URI in `app.py`:

```python
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://username:password@host:port/database_name'
```

### 6. Create Database (if not exists)

Using PostgreSQL CLI:

```bash
psql -U postgres -h localhost -p 5433
CREATE DATABASE commondb;
\q
```

Or use pgAdmin GUI tool for easier management.

## Running the Application

### Start Flask Development Server

```bash
python app.py
```

The application will start with the following output:

```
 * Running on http://127.0.0.1:5000
 * Press CTRL+C to quit
 * Restarting with reloader
 * Debugger is active!
```

### Access the Application

Open your web browser and navigate to:

```
http://localhost:5000
```

## Usage

1. **Add a Task**: Type your task in the input field and click "Add Task"
2. **Complete a Task**: Check the checkbox next to a task to mark it as complete
3. **Delete a Task**: Click the "Delete" button to remove a task
4. **View Timeline**: Each task displays the date and time it was created

## API Endpoints

| Method | Route | Description |
|--------|-------|-------------|
| GET | `/` | Display all todos |
| POST | `/add` | Add a new todo |
| POST | `/toggle/<todo_id>` | Toggle todo completion status |
| POST | `/delete/<todo_id>` | Delete a todo |

## Database Schema

### todos table

| Column | Type | Description |
|--------|------|-------------|
| id | Integer | Primary key |
| task | String(500) | Task description |
| completed | Boolean | Completion status (default: False) |
| created_at | DateTime | Task creation timestamp (default: UTC now) |

## License

This project is open source and available under the MIT License.

## Author

Created by Nayan Suhagiya

## Support

For issues or questions, please check the troubleshooting section or contact the project maintainer.
