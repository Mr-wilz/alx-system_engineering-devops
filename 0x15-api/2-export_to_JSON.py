#!/usr/bin/env python3
""" Exports data to Json format"""

import json
import requests

def export_todo_all_employees():
    url = "https://jsonplaceholder.typicode.com/"
    
    # Retrieve all users
    users_response = requests.get(url + "users")
    users = users_response.json()

    # Create a dictionary to store tasks for each user
    user_tasks = {}

    # Retrieve tasks for each user and store in the dictionary
    for user in users:
        user_id = user["id"]
        tasks_response = requests.get(url + "todos", params={"userId": user_id})
        tasks = tasks_response.json()
        user_tasks[user_id] = [{
            "task": task["title"],
            "completed": task["completed"],
            "username": user["username"]
        } for task in tasks]

    # Write data to JSON file
    with open("todo_all_employees.json", "w") as jsonfile:
        json.dump(user_tasks, jsonfile, indent=4)

if __name__ == "__main__":
    export_todo_all_employees()
