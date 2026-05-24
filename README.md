# Robot Framework Project

## Prerequisites
- Python 3.8+ installed

## Setup (Windows PowerShell)
```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r requirements.txt
```

### Environment Configuration
1. Copy the `.env.example` file to create a `.env` file:
   ```powershell
   copy .env.example .env
   ```
2. Open `.env` and fill in the required values:
   - `QA_BASE_URL`: The target URL for testing (e.g., `https://qa-exercise.quantiumtech.net`).
   - `QA_USERNAME`: Your QA portal username.
   - `QA_PASSWORD`: Your QA portal password.
   - `QA_BROWSER`: The browser to use (e.g., `Chrome`, `Firefox`, `HeadlessChrome`).


## Run Tests
```powershell
robot -d output tests
```

## Notes
- Place reusable keywords in resources/
- Place variables in variables/
- Test suites live in tests/

