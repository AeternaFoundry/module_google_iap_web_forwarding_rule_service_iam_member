resource "google_iap_web_forwarding_rule_service_iam_member" "iap_web_forwarding_rule_service_iam_members" {
  for_each = var.iap_web_forwarding_rule_service_iam_members

  forwarding_rule_service_name = each.value.forwarding_rule_service_name
  member                       = each.value.member
  role                         = each.value.role
  project                      = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

