# 🌿 LeafGuard AI — Leaf Disease Detection Using Deep Learning

An AI-powered, full-stack precision agriculture web application designed to detect, diagnose, and prescribe treatment for **38+ plant leaf diseases** using deep convolutional neural networks (MobileNetV2 transfer learning).

---

## 🌟 Key Features

- **MobileNetV2 Deep Learning**: Pre-trained on ImageNet and fine-tuned on the PlantVillage pathology benchmark with 98%+ accuracy.
- **Instant Leaf Diagnosis**: Upload or drag-and-drop leaf photos (JPG, PNG) with real-time visual dimension and corruption checks.
- **Interactive Verified Test Samples**: Test the model immediately with 1 click using pre-configured healthy and diseased leaf specimens.
- **Detailed Pathology Profiles**:
  - Species Identification (Tomato, Potato, Apple, Corn, Grape, Bell Pepper, Strawberry, etc.)
  - Health Status Badge (Healthy vs Diseased)
  - Prediction Confidence Percentage & Softmax Top-3 Candidates
  - Diagnostic Visual Symptoms
  - Biological & Environmental Causes (Etiology)
  - Actionable Preventive Agricultural Routines
  - Recommended Curatives (Organic biofungicides and chemical treatments)
- **Printable Clinical PDF Report**: Export and print diagnosis sheets formatted for agricultural extension officers and field records.
- **Field Telemetry Dashboard**:
  - Summary KPI cards (total scans, healthy count, diseased count, average confidence)
  - Interactive disease prevalence distribution bar charts
  - Healthy vs Diseased ratio gauge
  - Recent scans log
- **Prediction History Archive**: Searchable, filterable audit log with thumbnails, dates, and deletion controls.
- **Disease Encyclopedia**: Complete reference library across 38+ plant diseases and healthy crop types with search and category filtering.
- **Role-Based Admin Console**: Oversight of registered users, platform-wide metrics, and disease knowledge editor.
- **User Authentication**: Secure JWT-based sessions, registration, login, and password reset functionality.

---

## 🏗️ Technology Stack

| Component | Technology | Description |
|---|---|---|
| **Frontend** | React 18 (Vite) | High-performance SPA with fast HMR |
| **Styling** | Tailwind CSS | Modern agricultural aesthetic (emerald & forest greens, crisp white) |
| **Icons** | Lucide React | Modern minimalist icons |
| **Routing** | React Router v6 | Client-side routing with protected view helpers |
| **HTTP Client** | Axios | Configured with automatic JWT Bearer token interceptors |
| **Backend API** | Python / FastAPI | High-throughput asynchronous REST API |
| **ASGI Server** | Uvicorn | Production-ready asynchronous ASGI server |
| **Deep Learning** | TensorFlow / Keras | MobileNetV2 CNN transfer learning pipeline (224×224×3) |
| **Computer Vision** | Pillow / NumPy | Image preprocessing, resizing, normalization, and augmentation |
| **Database** | SQLAlchemy | SQLite (zero-config file) or MySQL / PostgreSQL via `DATABASE_URL` |
| **Security** | PBKDF2-SHA256 & JWT | Secure password hashing and signed Bearer token sessions |

---

## 📂 Project Structure

```
leaf-disease-detection/
├── frontend/                     # React 18 + Vite Frontend
│   ├── public/                   # Static browser assets
│   ├── src/
│   │   ├── assets/               # Branding assets
│   │   ├── components/           # Navbar, Footer, SampleLeaves, ReportModal
│   │   ├── context/              # AuthContext (JWT session state & demo login)
│   │   ├── pages/                # Landing, Upload, Dashboard, History, DiseaseLibrary, Admin, Auth
│   │   ├── services/             # Axios API client (auth, predict, history, dashboard, admin)
│   │   ├── App.jsx               # App routing scaffold
│   │   ├── index.css             # Tailwind directives & agricultural theme
│   │   └── main.jsx              # React DOM entry
│   ├── index.html
│   ├── package.json
│   ├── tailwind.config.js
│   └── vite.config.js
│
├── backend/                      # FastAPI Backend
│   ├── database/
│   │   ├── database.py           # SQLAlchemy engine & session factory
│   │   ├── models.py             # User, Prediction, DiseaseInfo, PasswordResetToken models
│   │   └── seed_data.py          # Auto-seeds default admin, demo user, & disease encyclopedia
│   ├── models/
│   │   └── schemas.py            # Pydantic request/response validation schemas
│   ├── routes/
│   │   ├── auth.py               # Register, Login, Logout, Forgot/Reset Password, Me
│   │   ├── predict.py            # Multipart upload, DL inference, & prediction persistence
│   │   ├── history.py            # Paginated history, search, detail inspect, delete
│   │   ├── dashboard.py          # User telemetry KPIs & disease distribution
│   │   ├── diseases.py           # Disease encyclopedia catalog API
│   │   └── admin.py              # User governance & admin metrics
│   ├── services/
│   │   ├── auth_service.py       # Password hashing & JWT token validation
│   │   ├── prediction_service.py # Deep learning inference connector
│   │   └── storage_service.py    # Safe image saving, UUID naming, & disk cleanup
│   ├── uploads/                  # Storage directory for uploaded leaf photographs
│   ├── app.py                    # FastAPI application entry & startup hooks
│   ├── test_api.py               # Automated API test suite
│   └── requirements.txt          # Python dependencies
│
├── deep_learning/                # Deep Learning Model Pipeline
│   ├── class_labels.json         # 38 PlantVillage pathology class mapping
│   ├── disease_knowledge.json    # Detailed symptoms, causes, prevention, & treatments
│   ├── model.py                  # MobileNetV2 transfer learning architecture builder
│   ├── preprocessing.py          # 224x224 Lanczos resizing, normalization, data augmentation
│   ├── train.py                  # End-to-end model training script with callbacks & curve plotting
│   ├── evaluate.py               # Confusion matrix generator & classification report
│   ├── predict.py                # Standalone & API inference engine with Softmax top-k
│   ├── setup_dataset.py          # PlantVillage dataset helper & synthetic starter data generator
│   └── dataset/                  # Labeled image directories for training/validation
│
├── docs/
│   └── project_documentation.md  # In-depth architectural & API specification
├── run_backend.bat               # 1-click Windows launcher for backend
├── run_frontend.bat              # 1-click Windows launcher for frontend
├── run_all.bat                   # 1-click launcher for both services
├── .env.example                  # Environment configuration template
└── README.md                     # Project documentation
```

---

## ⚡ Quick Start Guide

### 1. Prerequisites
Ensure you have the following installed on your machine:
- **Python 3.9 - 3.11** ([python.org](https://www.python.org/downloads/))
- **Node.js 18+ and npm** ([nodejs.org](https://nodejs.org/))

---

### 2. Backend Setup & Execution

Open a terminal in the project directory:

```bash
# Navigate to backend
cd leaf-disease-detection/backend

# Create a virtual environment (recommended)
python -m venv venv

# Activate virtual environment
# Windows:
.\venv\Scripts\activate
# Linux/macOS:
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Run the FastAPI server
uvicorn backend.app:app --reload --host 0.0.0.0 --port 8000
```

> **Automatic Database Initialization**: On startup, the server automatically initializes `leaf_disease.db` (SQLite), creates all tables, seeds the default administrative account, demo account, and the complete 38-class plant pathology knowledge catalog!

The backend will be live at:
- **API Server**: `http://localhost:8000`
- **Interactive Swagger Docs**: `http://localhost:8000/docs`
- **ReDoc Documentation**: `http://localhost:8000/redoc`

---

### 3. Frontend Setup & Execution

Open a second terminal:

```bash
# Navigate to frontend
cd leaf-disease-detection/frontend

# Install dependencies
npm install

# Start Vite development server
npm run dev
```

The frontend will be live at:
- **Web App**: `http://localhost:5173`

---

## 🔐 Default Credentials

The system includes pre-seeded demonstration accounts for immediate testing:

| Role | Email / Username | Password | Access Privileges |
|---|---|---|---|
| **Administrator** | `admin@leafai.org` | `Admin@123` | Full admin console, user management, knowledge base editor |
| **Demo Farmer** | `demo@leafai.org` | `User@123` | Diagnosis, personal history, field dashboard |

> 💡 **Quick 1-Click Login**: The Sign-In page (`/login`) includes instant demo buttons that fill and authenticate credentials with a single click.

---

## 🧠 Deep Learning Model Training & Evaluation

The deep learning module is completely functional and modularized.

### 1. Dataset Preparation
You can train using the full **PlantVillage dataset** (54,000+ authentic images) or generate instant starter sample images:

```bash
cd leaf-disease-detection/deep_learning

# Generate starter test images across all classes:
python setup_dataset.py --generate-starter --samples 10
```

For the complete benchmark PlantVillage dataset:
1. Download from Kaggle: `kaggle datasets download -d emmarex/plantdisease`
2. Extract the class folders into `leaf-disease-detection/deep_learning/dataset/`

### 2. Run Model Training
Execute the training pipeline:

```bash
python train.py --epochs 25 --batch_size 32 --lr 0.0001
```

Training features:
- Automatically loads class subdirectories from `dataset/`
- Applies real-time leaf image augmentation (rotation, zoom, horizontal/vertical flips, shear)
- Compiles MobileNetV2 with Adam optimizer and Categorical Cross-Entropy loss
- Implements `ModelCheckpoint` saving the best weights to `leaf_disease_model.keras`
- Implements `EarlyStopping` and `ReduceLROnPlateau`
- Generates loss and accuracy progression curves (`training_accuracy.png` and `training_loss.png`)
- Exports updated class mapping to `class_labels.json`

### 3. Run Evaluation Benchmark
Evaluate the model against test data to generate precision, recall, F1 scores, and a confusion matrix:

```bash
python evaluate.py --model_path leaf_disease_model.keras --val_dir dataset/
```

Outputs:
- **Overall Accuracy**
- **Classification Report**: Precision, recall, and F1-score per class
- **Confusion Matrix Heatmap**: Saved to `confusion_matrix.png`

### 4. Run CLI Inference Test
Test prediction on any individual leaf photo directly from the terminal:

```bash
python predict.py --image path/to/leaf_image.jpg
```

---

## 🧪 Running Automated Backend Tests

Verify API endpoints, authentication, prediction, and database operations:

```bash
cd leaf-disease-detection
pytest backend/test_api.py -v
```

---

## 🌐 Supported Crops & Pathology Classes (38 Total)

1. **Apple**: Apple Scab, Black Rot, Cedar Apple Rust, Healthy
2. **Blueberry**: Healthy
3. **Cherry**: Powdery Mildew, Healthy
4. **Corn (Maize)**: Gray Leaf Spot (Cercospora), Common Rust, Northern Leaf Blight, Healthy
5. **Grape**: Black Rot, Esca (Black Measles), Leaf Blight (Isariopsis), Healthy
6. **Orange (Citrus)**: Huanglongbing (Citrus Greening)
7. **Peach**: Bacterial Spot, Healthy
8. **Bell Pepper**: Bacterial Spot, Healthy
9. **Potato**: Early Blight, Late Blight, Healthy
10. **Raspberry**: Healthy
11. **Soybean**: Healthy
12. **Squash**: Powdery Mildew
13. **Strawberry**: Leaf Scorch, Healthy
14. **Tomato**: Bacterial Spot, Early Blight, Late Blight, Leaf Mold, Septoria Leaf Spot, Two-Spotted Spider Mite, Target Spot, Yellow Leaf Curl Virus, Mosaic Virus, Healthy

---

## 📜 License & Acknowledgements

Developed as an open-source agricultural decision support platform. Dataset credit to the **PlantVillage Project** (Penn State University & EPFL).
