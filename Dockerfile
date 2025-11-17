# Use the original UNF Robotics image as base
FROM unfrobotics/docker-ros2-jazzy-gz-rviz2:latest

# Set working directory
WORKDIR /opt/ros_ws

# Copy your workspace
COPY . /opt/ros_ws/

# Build the workspace
RUN /bin/bash -c "source /opt/ros/jazzy/setup.bash && \
    cd /opt/ros_ws && \
    colcon build --packages-select flexy_robot service example_interfaces && \
    echo 'source /opt/ros_ws/install/setup.bash' >> ~/.bashrc"

# Set the default command
CMD ["/bin/bash"]
