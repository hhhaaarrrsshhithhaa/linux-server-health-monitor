
#!/bin/bash

# Linux Server Health Monitoring Script

echo "=================================="
echo "      LINUX SERVER HEALTH CHECK"
echo "=================================="
echo "Timestamp: $(date)"
echo

# 1. Check CPU usage
echo "----- CPU USAGE -----"
top -bn1 | grep "Cpu(s)" || echo "CPU information unavailable"
echo

# 2. Check memory usage
echo "----- MEMORY USAGE -----"
free -h
echo

# 3. Check disk usage
echo "----- DISK USAGE -----"
df -h /
echo

# 4. Check system uptime
echo "----- SYSTEM UPTIME -----"
uptime
echo

# 5. Check selected services
echo "----- SERVICE STATUS -----"

for service in ssh cron; do
    if systemctl is-active --quiet "$service"; then
        echo "$service: RUNNING"
    else
        echo "$service: NOT RUNNING OR NOT INSTALLED"
    fi
done

echo
echo "=================================="
echo "       HEALTH CHECK COMPLETE"
echo "=================================="
