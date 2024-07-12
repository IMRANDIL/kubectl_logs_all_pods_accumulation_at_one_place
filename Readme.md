# Kubernetes Pod Log Streaming Script

This script streams logs from all pods of a specified Kubernetes service into a single log file. The logs are continuously appended to the log file in real-time, making it easier to monitor and debug services.

## Prerequisites

- `kubectl` installed and configured to access your Kubernetes cluster.
- Access to the terminal/command line on your machine.

## Setup

1. **Save the Script**:
    - Save the provided script as `stream_logs.sh` on your server.

2. **Make the Script Executable**:
    - Change the file permissions to make the script executable.

    ```sh
    chmod +x stream_logs.sh
    ```

## Execution

1. **Run the Script**:
    - Execute the script to start streaming logs.

    ```sh
    ./stream_logs.sh
    ```

2. **Monitor Logs**:
    - The script will create a log file with the current date and time in its name (e.g., `order-service_logs_2024-07-12_12-34-56.txt`).
    - The logs from all pods of the specified service will be continuously appended to this file.

## Accessing Logs

- **Check the Log File**:
    - Open the log file to see the accumulated logs.

    ```sh
    less order-service_logs_YYYY-MM-DD_HH-MM-SS.txt
    ```

- **Real-Time Monitoring**:
    - You can use `tail -f` to monitor the log file in real-time.

    ```sh
    tail -f order-service_logs_YYYY-MM-DD_HH-MM-SS.txt
    ```

## Notes

- Ensure your service name and namespace are correctly specified in the script.
- If you encounter any issues, verify that `kubectl` is properly configured and you have the necessary permissions to access the Kubernetes cluster.
- To stop the script and log streaming, you need to terminate the script manually (e.g., with `Ctrl+C`).

By following these steps, you can easily stream logs from all pods of a particular service into a single log file and monitor them in real-time.
