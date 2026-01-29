# test_webhook.ps1
# Sends a test POST request to the local n8n instance

$url = "http://localhost:5678/webhook/ai-content-factory"
$body = @{
    product_name = "SuperGlow Lipstick"
    platform     = "TikTok"
} | ConvertTo-Json

Write-Host "Sending test data to n8n..." -ForegroundColor Cyan
try {
    $response = Invoke-RestMethod -Uri $url -Method Post -Body $body -ContentType "application/json"
    Write-Host "Success! n8n received the webhook." -ForegroundColor Green
    Write-Host "Response: $($response | ConvertTo-Json)" -ForegroundColor Gray
    Write-Host "Check your n8n interface to see the execution." -ForegroundColor Yellow
}
catch {
    Write-Host "Error: Could not connect to n8n." -ForegroundColor Red
    Write-Host "Make sure n8n is running (npx n8n start) and the workflow is executing or listening." -ForegroundColor Red
    Write-Error $_
}
