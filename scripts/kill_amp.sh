#!/usr/bin/env bash

launchctl unload /Library/LaunchAgents/com.symantec.uiagent.application.NFM.plist
launchctl unload /Library/LaunchAgents/com.cisco.amp.agent.plist
sudo launchctl unload /Library/LaunchDaemons/com.cisco.amp.daemon.plist
