# frozen_string_literal: true
json.checklists @checklists do |checklist|
  json.id checklist.id
  json.title checklist.title
  json.created_on checklist.created_at.strftime("%d/%m/%Y %H:%M:%S")
  json.updated_at checklist.updated_at.strftime("%d/%m/%Y %H:%M:%S")
  json.created_by checklist.user.firstname + " " + checklist.user.lastname
end
