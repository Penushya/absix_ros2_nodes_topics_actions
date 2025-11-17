# 🚀 absix — Beginner‑Friendly Docker Guide

### Docker Image: **penushyavarri/ros2-talker-listener-server-client:v1**

This guide is written for **complete beginners**.
You do **not** need any prior knowledge of Docker or ROS2.
Just follow each step carefully and you will be able to run the ROS2 talker/listener and service server/client programs inside the container.

---

# ✅ 1. What You Need

Before starting, install:

* **Docker** (Docker Desktop or Docker Engine)
* **Internet connection** (to pull the image)

That’s all.

---

# ✅ 2. Pull the Docker Image

This downloads the image from Docker Hub:

```bash
docker pull penushyavarri/ros2-talker-listener-server-client:v1
```

---

# ✅ 3. Run the Container

Run the container and name it **absix**:

```bash
docker run --rm -it --name absix --network host penushyavarri/ros2-talker-listener-server-client:v1 bash
```

### Why these options?

* `--name absix` → easy to open extra terminals later
* `--network host` → required for ROS2 communication
* `-it` → interactive shell so you can type commands
* `--rm` → container deletes itself when closed

After this command, you will be **inside the container**.

---

# ✅ 4. Opening Extra Terminals (Very Important for ROS2)

ROS2 usually needs **multiple terminals** (for talker, listener, server, client).
To open a new terminal **into the same container**, run this **from your host computer**:

```bash
docker exec -it absix bash
```

Run this command again each time you need another terminal.

---

# ✅ 5. Running the ROS2 Programs

Now that your container is running, you can start the ROS2 nodes.

## ▶️ Start the Talker

In **Terminal 1 (inside container)**:

```bash
ros2 run flexy_robot talker
```

## ▶️ Start the Listener

In **Terminal 2** (open using `docker exec -it absix bash`):

```bash
ros2 run flexy_robot listener
```

You should now see messages flowing between talker and listener.

---

# 🔧 6. Running the Service Server & Client

## ▶️ Start the Service Server

In **another terminal** inside the container:

```bash
ros2 run service server 5 7
```

(Replace `5 7` with any numbers you want.)

## ▶️ Start the Service Client

In another terminal:

```bash
ros2 run service client 5 7
```

You will see the result returned from the service.

---

# 🔁 7. Quick Example Workflow

Here is the full beginner-friendly workflow:

1️⃣ Pull the image:

```bash
docker pull penushyavarri/ros2-talker-listener-server-client:v1
```

2️⃣ Start the container:

```bash
docker run --rm -it --name absix --network host penushyavarri/ros2-talker-listener-server-client:v1 bash
```

3️⃣ Open extra terminals:

```bash
docker exec -it absix bash
```

4️⃣ Run talker:

```bash
ros2 run flexy_robot talker
```

5️⃣ Run listener:

```bash
ros2 run flexy_robot listener
```

6️⃣ Run service server:

```bash
ros2 run service server 3 4
```

7️⃣ Run service client:

```bash
ros2 run service client 3 4
```

---

# ❗ Troubleshooting (Beginner Friendly)

### 🟦 **Command not found: ros2**

Run inside container:

```bash
source /opt/ros/*/setup.bash
```

or

```bash
source install/setup.bash
```

### 🟦 Listener not receiving messages

Ensure you are using **multiple terminals** inside the same container:

```
docker exec -it absix bash
```

### 🟦 Networking issues

ROS2 works best on Linux with `--network host`.

---

# 🎉 You're Done!

You now know how to:
✔️ Pull the Docker image
✔️ Run the container
✔️ Open multiple terminals
✔️ Run ROS2 talker, listener, server, and client programs

If you want, I can also:

* create a **short version** of this README
* add **GitHub Actions** to auto-build/push your Docker image
* add **screenshots** or a diagram

Just tell me!
