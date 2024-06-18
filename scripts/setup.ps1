# Variables
$projectPath = "C:\xampp\htdocs\egarage_project"
$composerSetupUrl = "https://getcomposer.org/installer"
$composerSetupPath = "$projectPath\composer-setup.php"
$composerExePath = "$projectPath\composer.phar"

# Function to install Composer
function Install-Composer {
    Write-Output "Downloading Composer installer..."
    Invoke-WebRequest -Uri $composerSetupUrl -OutFile $composerSetupPath

    Write-Output "Installing Composer..."
    php $composerSetupPath --install-dir $projectPath --filename composer.phar

    # Clean up installer
    Remove-Item $composerSetupPath
}

# Function to install PHP dependencies using Composer
function Install-Dependencies {
    Write-Output "Installing PHP dependencies..."
    php $composerExePath install --working-dir $projectPath
}

# Check if Composer is installed
if (-Not (Test-Path $composerExePath)) {
    Install-Composer
} else {
    Write-Output "Composer is already installed."
}

# Install PHP dependencies
Install-Dependencies

Write-Output "Setup complete."
