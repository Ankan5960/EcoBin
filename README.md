# ♻️ EcoBin - Smart Waste Management System

EcoBin is a scalable, IoT-powered smart waste management system that monitors bin status in real-time, collects environmental data, and assists in efficient garbage collection using modern web technologies, microservices, and cloud infrastructure.

---

## 🚀 Features- For user prespective

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

## 🚀 Features- For Devloper prespective

### Frontend :
- React: Used React with typescript. 
- Tailwind: For Styling used tailwind here.
- Shadcn: Some shadcn components are used here.

### Backend: 
- Used .Net WebApi with C#.
- Used MicroService based architecture.

### Hardware: 
- MCU: `ESP32`.
- Sensors: `HC-SR04`(Measures bin fill level), `MQ-135` (Detects air quality and harmful gases), `DHT11` (Monitors temperature and humidity), `Neo-6M` (Sends bin location), `TP5100` (Dual-cell lithium battery charging), `2S Lithium Battery`, `Solar Panel`.
- Arduino Uno: To configure the MCU and sensors. 

 ### Circuit design:
 ![ecobin_sensor_data_db_production](/Images/circuit-img.jpeg)

## 🧠 **System Architecture**

### Microservices services

| Service               | Responsibilities                                  |
|-----------------------|---------------------------------------------------|
| **EcoBin-Auth-Service**      | JWT Auth, User Signup/Login, Role Management      |
| **EcoBin-Sensor-Data-Service** | Receives and stores IoT sensor data             |
| **EcoBin-User-Data-Service** | Handles bin location suggestions and user data    |
| **EcoBin-Gateway-Service**   | API Gateway for routing and authentication        |

![Backend-architure](/Images/Backend-architure-img.jpeg)


### **Database**: PostgreSQL  
  - `ecobin_sensor_data_db_production`  
  ![ecobin_sensor_data_db_production](/Images/ecobin_sensor_data_db_production-img.jpeg)

  - `ecobin_auth_db_production` 
  ![ecobin_auth_db_production](/Images/ecobin_auth_db_production-img.jpeg) 

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

# Getting Start - Set up for local use

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
Ecobin-Hardware-Setup
```
## Mapbox Access Token

Go to the [Mapbox](https://www.mapbox.com/)
and create a Access Token and copy it 

![Mapbox Access Token](/Images/map_box_access_token_img.png)

this access token needed in EcoBin-Microservice as well as EcoBin frontend

# Set Up Ecobin-Microservices

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
## Env create
create a folder called `env` under the ..../EcoBin-Microservices/ directory.

under this create 6 folders:


1. `auth-db.env`:

```bash
POSTGRES_USER="your postgres username"
POSTGRES_PASSWORD="your postgres password"
POSTGRES_DB=ecobin_auth_db_production
```

2. `auth.env`:

```bash
ConnectionStrings__DefaultConnection=Host=ecobin-auth-db;Port=5432;Database=ecobin_auth_db_production;Username="your postgres username";Password="your postgres password"
Jwt__Key="your jwt key"
Jwt__Issuer=x.x.x.x

Migrations__Key="create a guid and paste here"
Migrations__Email="your email"
Migrations__Password="your password"
Migrations__AreaOfService="a area name like in my case it's newtown"

```

3. `gateway.env`:

```bash
ApiBaseUrls__EcoBinAuthService=http://ecobin-auth-service:6117
ApiBaseUrls__EcoBinSensorDataService=http://ecobin-sensor-data-service:6028
ApiBaseUrls__EcoBinUserDataService=http://ecobin-user-data-service:6274

```

4. `sensor-db.env`:

```bash
POSTGRES_USER="your postgres username"
POSTGRES_PASSWORD="your postgres password"
POSTGRES_DB=ecobin_sensor_data_db_production

```

5. `sensor.env`:

```bash
ConnectionStrings__DefaultConnection=Host=ecobin-auth-db;Port=5432;Database=ecobin_auth_db_production;Username="your postgres username";Password="your postgres password"
MapBox__AccessToken="your Mapbox apikey"
MapBox__BaseUrl=https://api.mapbox.com
Jwt__Key="your jwt key"
Jwt__Issuer=x.x.x.x
```

6. `user.env`:

```bash
EcoBinSensorDataApi__BaseUrl=http://ecobin-sensor-data-service:6028
MapBox__AccessToken="your Mapbox apikey"
MapBox__BaseUrl=https://api.mapbox.com
EmailServiceConfiguratin__SmtpHost=smtp.gmail.com
EmailServiceConfiguratin__SmtpPort=587
EmailServiceConfiguratin__FromEmail="your email"
EmailServiceConfiguratin__FromPassword="your password"
Jwt__Key="your jwt key"
Jwt__Issuer=x.x.x.x

```
## Run Docker:
make sure docker is installed and running
then run 
```bash
docker compose up --build
```
It take some time 
after sucessfull runyou can acess the swagger ui using this 


EcoBin Gateway Service: http://localhost:6010/swagger/index.html
![EcoBin Gateway Service](/Images/ecobin-gateway-service-img.jpeg)

EcoBin Auth Service: http://localhost:6117/swagger/index.html
![EcoBin Auth Service](/Images/ecobin-auth-data-img.jpeg)

EcoBin Sensor Data Service: http://localhost:6028/swagger/index.html
![EcoBin Sensor Data Service](/Images/ecobin-sensor-data-img.jpeg)

EcoBin User Data Service: http://localhost:6274/swagger/index.html
![EcoBin User Data Service](/Images/ecobin-user-data-img.jpeg)

## Now you need to migrate the databases
goto- http://localhost:6117/swagger/index.html

click on `/user-auth/Migration/db-migration`
![migration-key-setup](/Images/migration-key-setup.png)
and then click execute

# Set up Ecobin-Frontend

Go to the **Ecobin-Frontend** folder using 

```bash
cd Ecobin-Frontend
```



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
Now you can acess the Ecobin-Frontend

