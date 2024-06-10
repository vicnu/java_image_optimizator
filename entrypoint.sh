#!/bin/bash

# Create output directory if it doesn't exist
mkdir -p /out

# Run the Java Image Optimizer with correct classpath
java -cp /app/target/deps/pngtastic-1.0.jar:/app/target/image-web-optimizer-0.0.2-SNAPSHOT.jar nl.openweb.image.Optimizer /in /out
