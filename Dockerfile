# Stage 1: Build environment
FROM mcr.microsoft.com/windows/server:ltsc2022-amd64 AS build

# Use PowerShell as the shell for Windows commands
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Install Git
RUN Invoke-WebRequest -Uri https://github.com/git-for-windows/git/releases/download/v2.34.1.windows.1/Git-2.34.1-64-bit.exe -OutFile git-installer.exe; \
    Start-Process -Wait -FilePath .\git-installer.exe -ArgumentList '/VERYSILENT /NORESTART /NOCANCEL /SP- /SUPPRESSMSGBOXES /DIR="C:\git"'; \
    Remove-Item git-installer.exe -Force

# Install Node.js using nvm-windows
ENV NODE_VERSION=16.13.0
ENV NVM_VERSION=1.1.8
RUN Invoke-WebRequest -Uri "https://github.com/coreybutler/nvm-windows/releases/download/$env:NVM_VERSION/nvm-setup.zip" -OutFile nvm-setup.zip; \
    Expand-Archive -Path nvm-setup.zip -DestinationPath C:\nvm; \
    Remove-Item nvm-setup.zip -Force; \
    setx /M PATH $('C:\nvm;C:\nvm\nodejs;C:\nvm\nodejs\node_modules\npm\bin;' + $env:PATH); \
    nvm install $env:NODE_VERSION; \
    nvm use $env:NODE_VERSION; \
    npm install -g yarn; \
    Remove-Item -Force -Recurse C:\nvm

# Verify Node.js and npm installation
RUN node --version; \
    npm --version

# Set the working directory in the build environment
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install virtualenv (assuming Python environment setup if needed)
RUN pip install virtualenv

# Install Node.js dependencies
RUN npm install

# Expose port 80
EXPOSE 80

# Define the command to run the application
CMD ["powershell", "-Command", "$env:PATH += ';C:\\app\\node_modules\\.bin'; .\\env\\Scripts\\Activate.ps1; pip install -r requirements.txt; gingerjs build; gunicorn --workers 1 --bind 0.0.0.0:80 main:app"]
