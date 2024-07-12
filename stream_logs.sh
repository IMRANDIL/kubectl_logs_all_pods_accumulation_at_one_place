# Save this as stream_logs.sh
#!/bin/bash

# Define the service name (change this to your service name)
SERVICE_NAME="order-service"

# Define the namespace if your service is not in the default namespace
NAMESPACE="default"

# Get the current date and time to append to the file name
CURRENT_DATE_TIME=$(date +"%Y-%m-%d_%H-%M-%S")

# Define the log file name with the current date and time
LOG_FILE="${SERVICE_NAME}_logs_${CURRENT_DATE_TIME}.txt"

# Get the pod names for the specific service
PODS=$(kubectl get pods -n $NAMESPACE -l app=$SERVICE_NAME -o jsonpath='{.items[*].metadata.name}')

# Create or empty the log file
> $LOG_FILE

# Function to stream logs from a single pod
stream_logs() {
  local POD_NAME=$1
  echo "Streaming logs for pod: $POD_NAME"
  kubectl logs -f -n $NAMESPACE $POD_NAME >> $LOG_FILE 2>&1 &
}

# Loop through each pod and stream its logs
for POD in $PODS; do
  stream_logs $POD
done

# Wait for all background processes to complete
wait

echo "Logs are being streamed into $LOG_FILE"
