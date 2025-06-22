# 🏥 GNU Health HIS — Modern Hospital Information System

Welcome to the **GNU Health HIS** deployment setup! This project provides a streamlined way to launch both the backend and frontend of the GNU Health Hospital Information System using custom scripts and environment variables.


> ✅ **Tested & Verified** on **Ubuntu 24.04.2** with **Python 3.12.3**


---

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/vikassnwloodles/gnu_health_his.git
cd gnu_health_his
````

---

### 2. Set Up the Backend Environment

```bash
cp ./backend/.env.example ./backend/.env
nano ./backend/.env
```

🔧 **Edit your `.env` file** with the correct values:

```env
DB_USER=johndoe
DB_PASS=securepassword123
DB_NAME=mydb
PYTHON_VERSION=3.12.3
```

---

### 3. Launch the GNU Health Server

```bash
./backend/setup-gnuhealth-server.sh
```

This script installs dependencies, sets up the database, and starts the Tryton GNU Health backend server.

---

### 4. Launch the GNU Health GUI Client

```bash
./frontend/setup-gnuhealth-gui.sh     # Run once to set up the GUI client
./frontend/launch-gnuhealth-gui.sh    # Use this to launch the client
```

This launches the GUI frontend so you can start interacting with the HIS system right away.

---

## 📁 Project Structure

```
gnu_health_his/
├── backend/
│   ├── .env.example
│   ├── setup-gnuhealth-server.sh
│   └── ...
├── frontend/
│   ├── launch-gnuhealth-gui.sh
│   └── ...
├── README.md
```

---

## 🧠 What is GNU Health?

[GNU Health](https://www.gnuhealth.org) is a **Free/Libre Hospital and Health Information System** (HIS) that supports the management of electronic medical records (EMR), hospital infrastructure, and public health.

---

## ✅ Features

* Preconfigured environment for easier setup
* One-click setup scripts for backend and frontend
* Fully customizable `.env` support
* Designed for modern Linux environments

---

## 🤝 Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you’d like to change.

---

## 📬 Contact

Maintained by [@vikassnwloodles](https://github.com/vikassnwloodles)
For support or feedback, feel free to open an issue.

---
