# Robot Framework Project

## Prerequisites
- Python 3.8+ installed

## Setup (Windows PowerShell)
```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r requirements.txt
```

## Run Tests
```powershell
robot -d output tests
```

## Notes
- Place reusable keywords in resources/
- Place variables in variables/
- Test suites live in tests/

