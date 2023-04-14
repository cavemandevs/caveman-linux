#!/bin/bash

rfkill unblock all

iwctl device wlan0 scan

iwctl device wlan0 get-networks

echo which one do you want 
