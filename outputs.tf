output "automation_connection_certificates" {
  description = "All automation_connection_certificate resources"
  value       = azurerm_automation_connection_certificate.automation_connection_certificates
}
output "automation_connection_certificates_automation_account_name" {
  description = "List of automation_account_name values across all automation_connection_certificates"
  value       = [for k, v in azurerm_automation_connection_certificate.automation_connection_certificates : v.automation_account_name]
}
output "automation_connection_certificates_automation_certificate_name" {
  description = "List of automation_certificate_name values across all automation_connection_certificates"
  value       = [for k, v in azurerm_automation_connection_certificate.automation_connection_certificates : v.automation_certificate_name]
}
output "automation_connection_certificates_description" {
  description = "List of description values across all automation_connection_certificates"
  value       = [for k, v in azurerm_automation_connection_certificate.automation_connection_certificates : v.description]
}
output "automation_connection_certificates_name" {
  description = "List of name values across all automation_connection_certificates"
  value       = [for k, v in azurerm_automation_connection_certificate.automation_connection_certificates : v.name]
}
output "automation_connection_certificates_resource_group_name" {
  description = "List of resource_group_name values across all automation_connection_certificates"
  value       = [for k, v in azurerm_automation_connection_certificate.automation_connection_certificates : v.resource_group_name]
}
output "automation_connection_certificates_subscription_id" {
  description = "List of subscription_id values across all automation_connection_certificates"
  value       = [for k, v in azurerm_automation_connection_certificate.automation_connection_certificates : v.subscription_id]
}

