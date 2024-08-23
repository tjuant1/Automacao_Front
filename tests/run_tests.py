from robot import run_cli

# Run all suits in tests folder and automatically fit reports in logs folder
run_cli ([
    "-d", "../logs",
    "--name", "Front Automation",
    "."
])