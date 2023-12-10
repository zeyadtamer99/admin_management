# Flutter Admin Management

This is a flutter app that allows admins to manage tasks, sales agents, and dashboard analytics.

The project directory is organized as follows:

- lib: 
    - constants: Contains the constants.dart file that defines the app colors, fonts, and assets.
    - controllers: Contains the controller files that handle the app logic and state management using GetX.
    - models: Contains the salesmen.dart file that defines the salesmen model class until we use the backend.
    - views: 
        - auth: Contains the sign_in_screen.dart and sign_up_screen.dart files that handle the authentication UI.
        - add_task_screen.dart: The screen that allows the admin to add a new task to the salesman.
        - dashboard_screen.dart: The screen that displays the dashboard analytics.
        - home_screen.dart: The screen that displays the bottom navigation bar with the views.
        - new_sales_agent_screen.dart: The screen that allows the user to add a new sales agent/team leader/admin.
        - profile_screen.dart: The screen that displays the user's profile and settings.
        - task_status_screen.dart: The screen that displays the status of a task.

