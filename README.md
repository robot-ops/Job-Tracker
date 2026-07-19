# Job Tracker

A professional, high-performance full-stack monolith application designed to streamline the job application process. Users can organize, track, and log notes for their job applications in one centralized, sleek dashboard, eliminating the need to constantly check email inboxes.

---

## 🚀 Features

- **JWT-Based Authentication**: Secure sign-up, sign-in, and auth middleware safeguarding user data.
- **Visual Kanban Board**: Smooth drag-and-drop workflow tracking across stages: *Wishlist, Applied, Interviewing, Offer Received, and Rejected*.
- **List/Table View**: Quick sorting, filtering, and live search options to track and find specific jobs.
- **Analytics Dashboard**: Live statistics showing Total Opportunities, Active Interviews, Offers Received, and active response rates.
- **Interactive Activity Log & Notes**: Add, read, and delete timeline notes for each application to log milestones, contacts, and interview feedback.
- **Automated Logs**: Automatic chronological logging of status updates.

---

## 🛠️ Tech Stack

- **Core & Backend**: Node.js, Express, TypeScript, Prisma ORM
- **Frontend**: React, Vite, TypeScript, Vanilla CSS & CSS Modules (Rich Dark Slate Aesthetics)
- **Database**: MySQL

---

## 📁 Project Structure

```
job-tracker/
├── backend/               # Express REST API
│   ├── prisma/
│   │   └── schema.prisma  # Prisma schema and database configuration
│   ├── src/
│   │   ├── controllers/   # Auth and Job controllers
│   │   ├── middlewares/   # JWT authentication middleware
│   │   ├── index.ts       # Server entrypoint
│   │   └── prisma.ts      # Prisma client shared client
│   ├── package.json
│   └── tsconfig.json
├── frontend/              # Vite React SPA
│   ├── src/
│   │   ├── components/    # Reusable board, card, modal elements
│   │   ├── context/       # Authentication React context
│   │   ├── pages/         # Dashboard, Login, Register pages
│   │   ├── App.tsx        # App entry & client routing
│   │   ├── index.css      # Core styles & dark theme
│   │   └── main.tsx
│   ├── index.html
│   ├── package.json
│   ├── tsconfig.json
│   └── vite.config.ts
├── package.json           # Root package managing concurrent execution
├── .gitignore             # Ignored directories and credential files
└── README.md
```

---

## ⚙️ Installation & Setup

### Prerequisites
- Node.js (v18+)
- MySQL Server running locally

### Local Installation

1. **Clone the Workspace / Project**
   Ensure you are in the `job-tracker` folder directory.

2. **Install All Dependencies**
   Run the root package script to install dependencies for both backend and frontend automatically:
   ```bash
   npm run install:all
   ```

3. **Configure Environment Variables**
   Inside the `backend/` folder, a `.env` file has been created. Ensure it matches your local MySQL credentials:
   ```env
   PORT=5000
   DATABASE_URL="mysql://username:password@localhost:3306/job_tracker"
   JWT_SECRET="your-super-secret-key"
   ```

4. **Initialize Database Database & Schema**
   Create an empty database named `job_tracker` in your local MySQL instance. Then, run migrations to generate tables:
   ```bash
   cd backend
   npx prisma migrate dev --name init
   ```

5. **Run the Application**
   Navigate back to the root `job-tracker/` directory and spin up the development environment:
   ```bash
   cd ..
   npm run dev
   ```
   - **Frontend**: http://localhost:3000
   - **Backend API**: http://localhost:5000

---

## 📄 License

This project is licensed under the MIT License.
