# Fish shell version of alfan_rds_start_session
function alfan_rds_start_session
    # Define local variables from arguments
    set -l MFA_TOKEN $argv[1]
    set -l ARN_OF_MFA_DEVICE $argv[2]
    set -l INSTANCE_ID $argv[3]
    set -l DB_HOST $argv[4]
    set -l DB_PORT $argv[5]
    set -l LOCAL_PORT $argv[6]

    # Get temporary AWS credentials using MFA
    set -l creds_output (aws sts get-session-token \
        --serial-number $ARN_OF_MFA_DEVICE \
        --token-code $MFA_TOKEN \
        --profile alfan)

    # Check if the aws command was successful
    if test $status -ne 0
        echo "Error: Failed to get AWS session token." >&2
        return 1
    end

    # Check if the output is empty
    if test -z "$creds_output"
        echo "Error: Received empty credentials from AWS." >&2
        return 1
    end

    set -gx AWS_ACCESS_KEY_ID     (printf '%s' "$creds_output" | jq -r '.Credentials.AccessKeyId')
    set -gx AWS_SECRET_ACCESS_KEY (printf '%s' "$creds_output" | jq -r '.Credentials.SecretAccessKey')
    set -gx AWS_SESSION_TOKEN     (printf '%s' "$creds_output" | jq -r '.Credentials.SessionToken')

    if test (count $AWS_SESSION_TOKEN) -eq 0
        echo "Error: could not parse credentials" >&2
        return 1
    end

    echo "AWS session token obtained and exported."

    # Start the SSM port forwarding session
    aws ssm start-session \
        --region eu-west-1 \
        --target $INSTANCE_ID \
        --document-name AWS-StartPortForwardingSessionToRemoteHost \
        --parameters host=$DB_HOST,portNumber=$DB_PORT,localPortNumber=$LOCAL_PORT

    # Check the status of the ssm command
    if test $status -ne 0
        echo "Error: Failed to start SSM session." >&2
        return 1
    end

    return 0
end

# Fish shell version of alfan_rds_staging
function alfan_rds_staging
    # Expect MFA token as the first argument
    if test -z "$argv[1]"
      echo "Usage: alfan_rds_staging <MFA_TOKEN>" >&2
      return 1
    end
    set -l MFA_TOKEN $argv[1]

    # Define connection parameters locally
    set -l ARN_OF_MFA_DEVICE "arn:aws:iam::109877458136:mfa/mohamed.sherif"
    set -l INSTANCE_ID "i-047bf7947b658a3dc"
    set -l DB_HOST "staging-db.c9erxn7ebmuu.eu-west-1.rds.amazonaws.com"
    set -l DB_PORT "5432"
    set -l LOCAL_PORT "5432" # Or choose a different local port if 5432 is busy

    echo "Starting RDS session for Staging..."
    # Call the main session function with the parameters
    alfan_rds_start_session $MFA_TOKEN $ARN_OF_MFA_DEVICE $INSTANCE_ID $DB_HOST $DB_PORT $LOCAL_PORT
end

# Fish shell version of alfan_rds_production
function alfan_rds_production
    # Expect MFA token as the first argument
    if test -z "$argv[1]"
      echo "Usage: alfan_rds_production <MFA_TOKEN>" >&2
      return 1
    end
    set -l MFA_TOKEN $argv[1]

    # Define connection parameters locally
    set -l ARN_OF_MFA_DEVICE "arn:aws:iam::109877458136:mfa/mohamed.sherif"
    set -l INSTANCE_ID "i-0501406512a76ab83"
    set -l DB_HOST "production-db.c9erxn7ebmuu.eu-west-1.rds.amazonaws.com"
    set -l DB_PORT "5432"
    set -l LOCAL_PORT "5432" # Or choose a different local port if 5432 is busy

    echo "Starting RDS session for Production..."
    # Call the main session function with the parameters
    alfan_rds_start_session $MFA_TOKEN $ARN_OF_MFA_DEVICE $INSTANCE_ID $DB_HOST $DB_PORT $LOCAL_PORT
end
