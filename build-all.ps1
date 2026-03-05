# Build script for all microservices JAR files
# Run this before docker-compose up --build

$services = @(
    "restaurant-discovery-server",
    "restaurant-gateway-service",
    "restaurant-identity-service",
    "restaurant-user-service",
    "restaurant-branch-service",
    "restaurant-menu-service",
    "restaurant-order-service",
    "restaurant-reservation-service"
)

$rootDir = $PSScriptRoot
if (-not $rootDir) {
    $rootDir = Get-Location
}

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Building all microservices JAR files" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

$failed = @()

foreach ($service in $services) {
    $servicePath = Join-Path $rootDir $service
    
    if (Test-Path $servicePath) {
        Write-Host "`n>> Building $service..." -ForegroundColor Yellow
        
        Push-Location $servicePath
        
        # Use mvnw if available, otherwise use mvn
        if (Test-Path "mvnw.cmd") {
            & .\mvnw.cmd clean package -DskipTests
        } else {
            & mvn clean package -DskipTests
        }
        
        if ($LASTEXITCODE -ne 0) {
            Write-Host "   FAILED: $service" -ForegroundColor Red
            $failed += $service
        } else {
            Write-Host "   SUCCESS: $service" -ForegroundColor Green
        }
        
        Pop-Location
    } else {
        Write-Host "   SKIPPED: $service (directory not found)" -ForegroundColor Gray
    }
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Build Summary" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

if ($failed.Count -eq 0) {
    Write-Host "All services built successfully!" -ForegroundColor Green
    Write-Host "`nYou can now run: docker-compose up --build" -ForegroundColor Cyan
} else {
    Write-Host "Failed services:" -ForegroundColor Red
    foreach ($f in $failed) {
        Write-Host "  - $f" -ForegroundColor Red
    }
    exit 1
}
