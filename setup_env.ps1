Write-Host "Generating .env file for Django..."

# Generate a random secret key using Python
$secretKey = python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"

# Create the .env content
@"
DJANGO_SETTINGS_MODULE=islandGrid.settings
PYTHON_VERSION=3.11
SECRET_KEY=$secretKey
DEBUG=False
"@ | Set-Content -Path ".env"

Write-Host ".env file created with:"
Get-Content .env
