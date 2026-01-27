from flask import Blueprint, render_template, request, redirect, url_for
from . import db  # ✅ Импортируем db из текущего пакета
from .models import Todo  # ✅ Импортируем Todo из models

main_bp = Blueprint('main', __name__)

@main_bp.route('/')
def index():
    todos = Todo.query.order_by(Todo.created_at.desc()).all()
    completed_count = Todo.query.filter_by(completed=True).count()
    return render_template('index.html', todos=todos, completed_count=completed_count)

@main_bp.route('/add', methods=['POST'])
def add_todo():
    task = request.form.get('task')
    if task:
        new_todo = Todo(task=task)
        db.session.add(new_todo)
        db.session.commit()
    return redirect(url_for('main.index'))

@main_bp.route('/toggle/<int:todo_id>', methods=['POST'])
def toggle_todo(todo_id):
    todo = Todo.query.get_or_404(todo_id)
    todo.completed = not todo.completed
    db.session.commit()
    return redirect(url_for('main.index'))

@main_bp.route('/delete/<int:todo_id>', methods=['POST'])
def delete_todo(todo_id):
    todo = Todo.query.get_or_404(todo_id)
    db.session.delete(todo)
    db.session.commit()
    return redirect(url_for('main.index'))