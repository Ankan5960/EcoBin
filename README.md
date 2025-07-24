# ♻️ EcoBin - Smart Waste Management System

EcoBin is a scalable, IoT-powered smart waste management system that monitors bin status in real-time, collects environmental data, and assists in efficient garbage collection using modern web technologies, microservices, and cloud infrastructure.

---

## 🚀 Features

### 🎛️ Admin Panel
- Manage users and roles (Admin, Collector, User, Guest)
- Monitor bin data and environmental status
- Identify hazardous/dangerous bins

### 👷 Collector Dashboard
- View bins needing urgent attention
- Receive optimized collection routes
- Status updates from bins

### 👤 User Interface
- Find nearest available smart bin
- Report issues or feedback

### 🧾 Guest Access
- Explore limited features without login

---

## 🧠 **System Architecture**

### 🔌**Hardware (IoT Nodes)**
- **ESP32** microcontroller  
- **Ultrasonic Sensor (HC-SR04)** – Measures bin fill level  
- **MQ-135** – Detects air quality and harmful gases  
- **DHT11** – Monitors temperature and humidity  
- **HX711 + Load Cell** – Measures bin weight  
- **Neo-6M GPS Module** – Sends bin location  
- **TP5100** – Dual-cell lithium battery charging  
- **2S Lithium Battery + Solar Panel** – Off-grid power supply  

### 🧰 **Backend (Microservices in C# .NET)**

| Service               | Responsibilities                                  |
|-----------------------|---------------------------------------------------|
| **EcoBin-Auth-Service**      | JWT Auth, User Signup/Login, Role Management      |
| **EcoBin-Sensor-Data-Service** | Receives and stores IoT sensor data             |
| **EcoBin-User-Data-Service** | Handles bin location suggestions and user data    |
| **EcoBin-Gateway-Service**   | API Gateway for routing and authentication        |

### **Database**: PostgreSQL  
  - `ecobin_sensor_data_db_production`  
  ![ecobin_sensor_data_db_production](images/img1.png)

  - `ecobin_auth_db_production` 
  ![ecobin_auth_db_production](images/img1.png) 

### 🌐 Frontend
- **React + TypeScript**
- **Tailwind CSS** + **shadcn/ui**
- Hosted on **Netlify**
- Fully responsive and role-based UI

### ☁️ Deployment
- Backend and DB hosted on **Google Cloud VM**
- Microservices containerized with **Docker**
- Frontend deployed via **Netlify**

---

## 📡 IoT Communication

Each bin (with unique `dustbinId`) sends JSON payload to the backend:

```json
{
  "dustbinId": "70950625-5dbd-41a4-b681-8caf2381edf7",
  "weightData": 234.5,
  "gasData": 102,
  "temperature": 32.4,
  "humidity": 58,
  "distance": 14.2,
  "latitude": "22.5782",
  "longitude": "88.4760"
}
```

## Getting Start - Set up for local use

Open Terminal and run 

If using Windows
```shell
./clone-repos.bat
./update-repos.bat
```
If using MacOs/Linux
```bash
chmod +x clone-repos.sh
./clone-repos.sh
chmod +x update-repos.sh
./update-repos.sh
```

If this are sucessfully run then there is two new folders created. 

```
Ecobin-Frontend
Ecobin-MicroServices
```
## Set Up Ecobin-Microservices

Go to the **Ecobin-Microservices** folder using 

```bash
cd Ecobin-Microservices
```
then if using Windows
```shell
./clone-repos.bat
./update-repos.bat
```
If using MacOs/Linux
```bash
chmod +x clone-repos.sh
./clone-repos.sh
chmod +x update-repos.sh
./update-repos.sh
```

now there is a Four new Folders
```
EcoBin-Auth-Service
EcoBin-GateWay-Service
EcoBin-Sensor-Data-Service
EcoBin-User-Data-Service
```
make sure docker is installed and running
then run 
```bash
docker compose up --build
```
it take some time 
after sucessfull runyou can acess the swagger ui using this 

http://localhost:6010/swagger/index.html

http://localhost:6117/swagger/index.html

http://localhost:6028/swagger/index.html

http://localhost:6274/swagger/index.html


### Set up Ecobin-Frontend

Go to the **Ecobin-Frontend** folder using 

```bash
cd Ecobin-Frontend
```

Go to the [Mapbox](https://www.mapbox.com/)
and create a Access Token and copy it 

![Mapbox Access Token](https://github.com/Ankan5960/EcoBin/blob/main/Images/mapbox-token.png)

Make a .env in /EcoBin-Frontend/ 
```
VITE_MAPBOX_ACCESS_TOKEN=your-copied-acess-token
VITE_ECOBIN_API_URL=http://localhost:6010
```
Now make sure you have installed **Node.js and npm** 
Run
```bash
npm install
npm start
```
Your Frontend now start at 
```
http://localhost:3000/
http://your-ip:3000/
```
